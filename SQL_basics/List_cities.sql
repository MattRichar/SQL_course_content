--List the cities with the most reviews in descending order:--

SELECT 
  city, 
  SUM(review_count) AS total_reviews
  --List the city and the total number of reviews as total_reviews for each city.
  --Multiple businesses may be in the same city and each one has a number of reviews.
FROM 
  business
GROUP BY 
  city
  --Here, we are determing the total number of reviews for each city and listing them in descending order.
ORDER BY 
  total_reviews DESC;
  --We list them in descending order of total_reviews.
	
	
