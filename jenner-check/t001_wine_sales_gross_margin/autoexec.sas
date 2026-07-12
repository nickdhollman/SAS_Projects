options obs=100; /* cap input rows for the captured run */

/* Mock data standing in for the original script's imported Purchase_Price,
   Sales and Inventory worksheets (loaded there via the SAS Studio import
   wizard). Column shapes match what the script reads: brand + volume +
   PurchasePrice from the price side, brand + SalesQuantity + SalesDollars
   from the sales side, brand + Quantity + PurchasePrice from inventory. */

data purchase_price;
  length volume $10;
  input brand volume $ PurchasePrice;
  datalines;
1001 750ml 12.50
1002 750ml 8.75
1003 1.5L 22.00
1004 750ml 15.25
1005 Unknow 9.99
;
run;

data sales;
  input brand SalesQuantity SalesDollars;
  datalines;
1001 120 2400.00
1001 80 1600.00
1002 200 2900.00
1003 60 1980.00
1004 150 3300.00
1005 40 520.00
;
run;

data inventory;
  input brand Quantity PurchasePrice;
  datalines;
1001 300 12.50
1002 500 8.75
1003 100 22.00
1004 250 15.25
1005 90 9.99
;
run;

/* The original script's first PROC SORT operates on WORK.PRICE, which in
   the author's interactive session was already populated by the import
   wizard before this script ran (the script later rebuilds it from
   purchase_price). Seed that same pre-existing state here. */
data price;
  set purchase_price;
run;
