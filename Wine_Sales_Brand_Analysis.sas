*import PurchasePrice dataset and Sale dataset using wizard, label them as Purchase_Price and Sales.;

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

*** PurchasePrice = The price paid to purchase the product from the vendor in USD from daily inventory;

*** PurchasePrice = The price paid to purchase the product from the vendor in USD from purchase_price;

*** Price = The retail price of the product in USD from purchase_price;

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

data cog_no_dup;
set top_5_gross_marg (keep=brand Total_cost_sum);
run;

************** PART 1A-B - TOP 5 BRANDS BY GROSS MARGIN AND GROSS MARGIN PCT *************;

*Get top 5 of gross_margin;
proc sort data=Gross_Marg_pct_avg out=top_5_gross_marg nodupkey;
by descending Gross_Margin_sum brand;
run;

proc print data=top_5_gross_marg (obs=5);
var brand description size classification Total_sale Total_cost_sum Gross_Margin_sum Gross_Margin_pct_avg;
run;

*Get top 5 of gross_margin_pct;
proc sort data=Gross_Marg_pct_avg out=top_5_gross_marg_pct nodupkey;
by descending Gross_Margin_pct_avg brand;
run;

proc print data=top_5_gross_marg_pct (obs=5);
var brand description size classification Total_sale Total_cost_sum Gross_Margin_sum Gross_Margin_pct_avg;
run;

proc print data=top_5_gross_marg_pct;
var brand description size classification Total_sale Total_cost_sum Gross_Margin_sum Gross_Margin_pct_avg;
where (brand=1233 or brand=2832);
run;

*Why are their blank values in gross_margin_pct?;
data gross_marg_pct_blank;
set top_5_gross_marg_pct (keep=brand SalesDollars Total_sale PurchasePrice Gross_Margin_sum Gross_Margin_pct_avg);
where gross_margin_pct_avg=.;
run;
*these have no purchase price;

******** EXPORT DATASET FOR DASHBOARD *********;
proc export data=Gross_Marg_pct_avg
    outfile="C:\Users\nickd\Sale_and_Price.csv"
    dbms=csv
    replace;
run;

********* PART 4 CALCULATIONS ***********;

*** Import Inventory csv file, label as inventory;

**** Calculate Average Inventory by brand --
-- to do this, we will multiply the quantity for # of items in the inventory, multiply this by PurchasePrice, 
and take the average of this value ;
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
with cog_no_dup dataset created using syntax above for part 1 (that contains the cost of goods by brand)
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

*Print data where brand=213 or brand=1286;
data brand_spec;
set DIO;
where (brand=213 or brand=1286);
run;

*export for dashboard;
proc export data=DIO
    outfile="C:\Users\nickd\ITR_DIO_brand.csv"
    dbms=csv
    replace;
run;
