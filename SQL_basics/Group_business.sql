--Group business based on the ones that are open and the ones that are closed. --
--What differences can you find between the ones that are still open and the ones that are closed? --
--List at least two differences and the SQL code you used to arrive at your answer.--

--Difference 1: The average number of stars for the businesses that are open --
--              is 0.15 greater than the average number of stars for --
--              businesses that are closed. --

--Difference 2: There are 110 million more reviews for the businesses that --
--              are open compared to the businesses that are closed. --

-SQL code comparing open business to closed businesses--

SELECT 
  AVG(o.stars) AS average_stars_open,
--Calculate the average number of stars for open businesses.--
  SUM(o.review_count) AS total_reviews_open,
--Calculate the total number of reviews for open businesses.--
  AVG(c.stars) AS average_stars_closed,
--Calculate the average number of stars for closed businesses.--
  SUM(c.review_count) AS total_reviews_closed,
--Calculate the total number of reviews for closed businesses.--
FROM 
  business o, business c
--Here we use a SELF JOIN since we want to compare data from the same table.--
WHERE 
  o.is_open=1
  AND 
  c.is_open=0;

--Here I am assuming that is_open=1 means the business is open and is_open=0 
--means the business is closed.

--OUTPUT: 

-- +--------------------+--------------------+----------------------+----------------------+
-- | average_stars_open | total_reviews_open | average_stars_closed | total_reviews_closed |
-- +--------------------+--------------------+----------------------+----------------------+
-- |      3.67900943396 |          409336000 |        3.52039473684 |            299013280 |
-- +--------------------+--------------------+----------------------+----------------------+
