/* Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Prices table: 
 +------------+------------+------------+--------+ 
 | product_id | start_date | end_date   | price  | 
 +------------+------------+------------+--------+ 
 | 1          | 2019-02-17 | 2019-02-28 | 5      | 
 | 1          | 2019-03-01 | 2019-03-22 | 20     | 
 | 2          | 2019-02-01 | 2019-02-20 | 15     | 
 | 2          | 2019-02-21 | 2019-03-31 | 30     | 
 +------------+------------+------------+--------+ 
  
 UnitsSold table: 
 +------------+---------------+-------+ 
 | product_id | purchase_date | units | 
 +------------+---------------+-------+ 
 | 1          | 2019-02-25    | 100   | 
 | 1          | 2019-03-01    | 15    | 
 | 2          | 2019-02-10    | 200   | 
 | 2          | 2019-03-22    | 30    | 
 +------------+---------------+-------+ 
  
 Output:  
 +------------+---------------+ 
 | product_id | average_price | 
 +------------+---------------+ 
 | 1          | 6.96          | 
 | 2          | 16.96         | 
 +------------+---------------+ 
  
 Explanation:  
 Average selling price = Total Price of Product / Number of products sold. 
 Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96 
 Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96 */ 
  
  
 SELECT /*+ parallel(32) +*/ p.product_id "product_id", IFNULL(ROUND(SUM(units*price)/SUM(units),2),0) "average_price"  
 FROM prices p LEFT JOIN unitssold u ON p.product_id=u.product_id 
 AND u.purchase_date BETWEEN start_date AND end_date 
 GROUP BY p.product_id;