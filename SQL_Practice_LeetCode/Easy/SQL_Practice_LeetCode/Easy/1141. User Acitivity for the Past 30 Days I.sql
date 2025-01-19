/* Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day. 
 Return the result table in any order. 
 The result format is in the following example. 
  
 Input:  
 Activity table: 
 +---------+------------+---------------+---------------+ 
 | user_id | session_id | activity_date | activity_type | 
 +---------+------------+---------------+---------------+ 
 | 1       | 1          | 2019-07-20    | open_session  | 
 | 1       | 1          | 2019-07-20    | scroll_down   | 
 | 1       | 1          | 2019-07-20    | end_session   | 
 | 2       | 4          | 2019-07-20    | open_session  | 
 | 2       | 4          | 2019-07-21    | send_message  | 
 | 2       | 4          | 2019-07-21    | end_session   | 
 | 3       | 2          | 2019-07-21    | open_session  | 
 | 3       | 2          | 2019-07-21    | send_message  | 
 | 3       | 2          | 2019-07-21    | end_session   | 
 | 4       | 3          | 2019-06-25    | open_session  | 
 | 4       | 3          | 2019-06-25    | end_session   | 
 +---------+------------+---------------+---------------+ 
  
 Output:  
 +------------+--------------+  
 | day        | active_users | 
 +------------+--------------+  
 | 2019-07-20 | 2            | 
 | 2019-07-21 | 2            | 
 +------------+--------------+  
  
 Explanation: Do not care about days with zero active users. */ 
  
  
 SELECT /*+ parallel(16) +*/activity_date day, COUNT(DISTINCT user_id) active_users 
 FROM activity 
 WHERE activity_date<='2019-07-27' AND activity_date>ADDDATE('2019-07-27', -30) 
 GROUP BY activity_date 
 ORDER BY activity_date;