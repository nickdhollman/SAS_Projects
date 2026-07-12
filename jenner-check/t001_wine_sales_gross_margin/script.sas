/* Adapted from Wine_Sales_Brand_Analysis.sas (nickdhollman/SAS_Projects).
   Original script imported PurchasePrice/Sales/Inventory via the SAS
   Studio import wizard and wrote CSVs to C:\Users\nickd\...  Here the
   three source tables are provided inline via DATALINES (same column
   shapes the original script reads: brand, volume, PurchasePrice on the
   price side; brand, SalesQuantity, SalesDollars on the sales side; and
   brand, Quantity, PurchasePrice on the inventory side) and the two
   PROC EXPORT targets are redirected to relative paths. The gross-margin,
   gross-margin-percent, inventory-turnover-rate and days-inventory-
   outstanding logic is otherwise untouched. */

***************** CALCULATIONS FOR PART 1 - GROSS MARGIN AND GROSS MARGIN % ********;

*merge dataset for price and sales;
proc sort data=price;
by brand;
run;
proc sort data=sales;
by brand;
run;

proc freq data=price;
tables volume;
run;

data price;
set purchase_price;
if volume='Unknow' then volume='';
numeric_volume = input(volume, comma9.);
    drop volume;
rename numeric_volume = volume;
run;


data sale_price;
merge sales (in=a) price (in=b);
by brand;
if a=1;
run;

*double check that sales has multiple brands;
proc sort data=sale_price out=sale_pric_no_dup nodupkey;
by brand;
run;

*SalesPrice for Sales dataset is the The total revenue generated from the sales, in USD;

*Multiply PurchasePrice by SalesQuantity before adding up;
Data Sale_price_b;
set Sale_price;
Total_cost = SalesQuantity * PurchasePrice;
run;

*** Cost of Goods calc = (sum (Total_cost) by brand);
proc sql;
create table COG as
select *, sum(Total_cost) as Total_cost_sum
from Sale_price_b
group by brand;
quit;

*** calc = (sum (SalesPrice) by brand) ;
proc sql;
create table Total_sale as
select *, sum(SalesDollars) as Total_Sale
from COG
group by brand;
quit;

*Gross Margin = (SalesDollars - Total Cost);
proc sql;
create table Gross_Marg as
select *, (SalesDollars - Total_cost) as Gross_Margin
from Total_sale;
quit;

*Sum Gross Margin;
proc sql;
create table Gross_Marg_sum as
select *, sum(Gross_Margin) as Gross_Margin_sum
from Gross_Marg
group by brand;
quit;

*Gross Margin % = sum of Gross Margin/ sum of Sales Dollars;
proc sql;
create table Gross_Marg_pct as
select *, (Gross_Margin / SalesDollars) as Gross_Margin_pct
from Gross_Marg_sum;
quit;

*Sum Grosss Margin pct;
proc sql;
create table Gross_Marg_pct_avg as
select *, AVG(Gross_Margin_pct) as Gross_Margin_pct_avg
from Gross_Marg_pct
group by brand;
quit;

************** PART 1A-B - TOP BRANDS BY GROSS MARGIN AND GROSS MARGIN PCT *************;

*Get top brands by gross_margin;
proc sort data=Gross_Marg_pct_avg out=top_gross_marg nodupkey;
by descending Gross_Margin_sum brand;
run;

proc print data=top_gross_marg;
var brand Total_sale Total_cost_sum Gross_Margin_sum Gross_Margin_pct_avg;
run;

data cog_no_dup;
set top_gross_marg (keep=brand Total_cost_sum);
run;

*Get top brands by gross_margin_pct;
proc sort data=Gross_Marg_pct_avg out=top_gross_marg_pct nodupkey;
by descending Gross_Margin_pct_avg brand;
run;

proc print data=top_gross_marg_pct;
var brand Total_sale Total_cost_sum Gross_Margin_sum Gross_Margin_pct_avg;
run;

********* PART 4 CALCULATIONS ***********;

**** Calculate Average Inventory by brand --
-- to do this, we will multiply the quantity for # of items in the inventory,
multiply this by PurchasePrice, and take the average of this value ;
data inventory_b;
set inventory;
Total_cost = PurchasePrice * Quantity;
run;

proc sql;
create table avg_inventory as
select *, avg(Total_cost) as avg_inventory
from inventory_b
group by brand;
quit;

proc sort data=avg_inventory out=avg_invent_no_dup nodupkey;
by brand;
run;

*merge avg_invent_no_dup dataset above (that contains the average value of inventory by brand)
with cog_no_dup dataset created above for part 1 (that contains the cost of goods by brand)
to calculate inventory turnover rate;
proc sort data=avg_invent_no_dup;
by brand;
run;

proc sort data=cog_no_dup;
by brand;
run;

data ITR;
merge avg_invent_no_dup (in=a) cog_no_dup (in=b);
by brand;
if a=1;
run;

*** Calculate Inventory Turnover Rate ****
* Calculation =  Total Cost / Average Inventory by brand ;
data ITR_calc;
set ITR;
ITR = Total_cost_sum / avg_inventory;
run;
proc sort data=ITR_calc;
by descending ITR;
run;

*** Days Inventory Outstanding = (Average inventory / Cost of sales (Total Cost)) x Number of days in period;
data DIO;
set ITR_calc;
DIO = (avg_inventory / Total_cost_sum) * 365;
run;

proc print data=DIO;
var brand Total_cost_sum avg_inventory ITR DIO;
run;

*export for dashboard (redirected from the original C:\Users\nickd\ paths);
proc export data=Gross_Marg_pct_avg
    outfile="./output/Sale_and_Price.csv"
    dbms=csv
    replace;
run;

proc export data=DIO
    outfile="./output/ITR_DIO_brand.csv"
    dbms=csv
    replace;
run;
