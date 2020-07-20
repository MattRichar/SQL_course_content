--Answering multiple questions such as:--
--Pick one city and category of your choice and group the businesses in that city or category by their overall star rating.--
--I chose the city of Toronto and the category of Food--

--1.Do the two groups you chose to analyze have a different distribution of hours?--
--Answer:Yes, the group which has 4-5 stars has hours that run in the evening and--
--open later in the day while the group which has 2-3 stars has hours that --
--run in morning till 22:00.--

--2. Do the two groups you chose to analyze have a different number of reviews?--
--The total number of reviews between each group is different. There are-- 
--more reviews for the group with 4-5 stars compared to the group with--
--2-3 stars.--

--3. Are you able to infer anything from the location data provided between these two groups? Explain.--
-- Answer: We are not able to infer anything from the location data provided. Each --
-- business is within a 1.5km radius of one another meaning there is --
-- no discernable trend in location compared to star rating from the data --
-- selected.--

--Here we are selecting the name of the business, its average star rating, the 
--number of reviews, and its latitude & longitude.
--We assign an alias of b for business table, h for hours table, and c for
--category table.

SELECT 
  b.name,
  b.stars, 
  h.hours, 
  b.review_count, 
  b.latitude, 
  b.longitude
FROM 
  (business AS b
  LEFT JOIN 
    category AS c 
    ON (b.id=c.business_id) )
--We first join the business with the category.
LEFT JOIN 
  hours AS h 
  ON b.id=h.business_id
--Then we join that result with the hours table.
WHERE 
  b.city='Toronto' AND c.category='Food'

--Output:

-- +--------------------+-------+-----------------------+--------------+----------+-----------+
-- | name               | stars | hours                 | review_count | latitude | longitude |
-- +--------------------+-------+-----------------------+--------------+----------+-----------+
-- | Cabin Fever        |   4.5 | Monday|16:00-2:00     |           26 |  43.6553 |  -79.4567 |
-- | Cabin Fever        |   4.5 | Tuesday|18:00-2:00    |           26 |  43.6553 |  -79.4567 |
-- | Cabin Fever        |   4.5 | Friday|18:00-2:00     |           26 |  43.6553 |  -79.4567 |
-- | Cabin Fever        |   4.5 | Wednesday|18:00-2:00  |           26 |  43.6553 |  -79.4567 |
-- | Cabin Fever        |   4.5 | Thursday|18:00-2:00   |           26 |  43.6553 |  -79.4567 |
-- | Cabin Fever        |   4.5 | Sunday|16:00-2:00     |           26 |  43.6553 |  -79.4567 |
-- | Cabin Fever        |   4.5 | Saturday|16:00-2:00   |           26 |  43.6553 |  -79.4567 |
-- | Loblaws            |   2.5 | Monday|8:00-22:00     |           10 |  43.6551 |  -79.4494 |
-- | Loblaws            |   2.5 | Tuesday|8:00-22:00    |           10 |  43.6551 |  -79.4494 |
-- | Loblaws            |   2.5 | Friday|8:00-22:00     |           10 |  43.6551 |  -79.4494 |
-- | Loblaws            |   2.5 | Wednesday|8:00-22:00  |           10 |  43.6551 |  -79.4494 |
-- | Loblaws            |   2.5 | Thursday|8:00-22:00   |           10 |  43.6551 |  -79.4494 |
-- | Loblaws            |   2.5 | Sunday|8:00-22:00     |           10 |  43.6551 |  -79.4494 |
-- | Loblaws            |   2.5 | Saturday|8:00-22:00   |           10 |  43.6551 |  -79.4494 |
-- | Halo Brewery       |   4.0 | Tuesday|15:00-21:00   |           15 |  43.6618 |  -79.4466 |
-- | Halo Brewery       |   4.0 | Friday|15:00-21:00    |           15 |  43.6618 |  -79.4466 |
-- | Halo Brewery       |   4.0 | Wednesday|15:00-21:00 |           15 |  43.6618 |  -79.4466 |
-- | Halo Brewery       |   4.0 | Thursday|15:00-21:00  |           15 |  43.6618 |  -79.4466 |
-- | Halo Brewery       |   4.0 | Sunday|11:00-21:00    |           15 |  43.6618 |  -79.4466 |
-- | Halo Brewery       |   4.0 | Saturday|11:00-21:00  |           15 |  43.6618 |  -79.4466 |
-- | The Kosher Gourmet |   3.5 | None                  |            3 |  43.7175 |  -79.4291 |
-- +--------------------+-------+-----------------------+--------------+----------+-----------+
