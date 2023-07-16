create database Drinks;
 select * from dim_repondents;
 
 -- 1 a. Who prefers energy drink more? (male/female/non-binary?)

SELECT Gender, COUNT(*) AS Total
FROM dim_repondents
GROUP BY Gender;

-- b. Which age group prefers energy drinks more?
SELECT r.Age, COUNT(*) AS Total
FROM dim_repondents r
INNER JOIN fact_survey_responses s ON r.Respondent_ID = s.Respondent_ID
GROUP BY r.Age;

-- c. Which type of marketing reaches the most Youth (15-30)? 
SELECT fsr.Marketing_channels, COUNT(*) AS Youth_Count
FROM fact_survey_responses fsr
JOIN dim_repondents dr ON fsr.Respondent_ID = dr.Respondent_ID
WHERE dr.Age IN ('15-18', '19-30')
GROUP BY fsr.Marketing_channels
ORDER BY Youth_Count DESC
LIMIT 1;

select Marketing_channels from fact_survey_responses;
select Age from dim_repondents;

-- 2 a. What are the preferred ingredients of energy drinks among respondents?

SELECT Ingredients_expected, COUNT(*) AS Ingredient_Count
FROM fact_survey_responses
GROUP BY Ingredients_expected
ORDER BY Ingredient_Count DESC;

-- b. What packaging preferences do respondents have for energy drinks?
SELECT Packaging_preference, COUNT(*) AS Packaging_Count
FROM fact_survey_responses
GROUP BY Packaging_preference
ORDER BY Packaging_Count DESC;

-- 3. a. Who are the current market leaders?
SELECT DISTINCT Current_brands, sum(Respondent_ID) as Users
FROM fact_survey_responses
group by Current_brands;

-- b. What are the primary reasons consumers prefer those brands over ours?

SELECT Reasons_for_choosing_brands, COUNT(*) AS Reason_Count
FROM fact_survey_responses
WHERE Current_brands IN (SELECT DISTINCT Current_brands FROM fact_survey_responses)
GROUP BY Reasons_for_choosing_brands
ORDER BY Reason_Count DESC;

-- 4. a. Which marketing channel can be used to reach more customers?

SELECT Marketing_channels, COUNT(*) AS Customer_Count
FROM fact_survey_responses
GROUP BY Marketing_channels
ORDER BY Customer_Count DESC
LIMIT 1;

-- b. How effective are different marketing strategies and channels in reaching our customers?
SELECT Marketing_channels, Brand_perception, COUNT(*) AS Perception_Count
FROM fact_survey_responses
GROUP BY Marketing_channels, Brand_perception;

-- 5. a. What do people think about our brand? (overall rating)

SELECT AVG(CASE
    WHEN Brand_perception = 'Positive' THEN 10
    WHEN Brand_perception = 'Negative' THEN 1
    WHEN Brand_perception = 'Neutral' THEN 5
    ELSE NULL -- handle any other cases
END) AS AverageRating
FROM fact_survey_responses;


-- b. Which cities do we need to focus more on?
SELECT c.City
FROM fact_survey_responses fsr
Join dim_repondents r on r.Respondent_ID=fsr.Respondent_ID
JOIN dim_cities c ON c.City_ID = r.City_ID 
GROUP BY c.City
ORDER BY COUNT(*) DESC
LIMIT 5;

select * from fact_survey_responses;
select * from dim_cities;
select * from dim_repondents;

-- 6. a. Where do respondents prefer to purchase energy drinks?
SELECT Purchase_location, COUNT(*) AS Preference_Count
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY Preference_Count DESC;

-- b. What are the typical consumption situations for energy drinks among respondents?
SELECT Typical_consumption_situations, COUNT(*) AS Situation_Count
FROM fact_survey_responses
GROUP BY Typical_consumption_situations
ORDER BY Situation_Count DESC;

 -- c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
 
 SELECT Price_range, Limited_edition_packaging, COUNT(*) AS Decision_Count
FROM fact_survey_responses
GROUP BY Price_range, Limited_edition_packaging;

-- 7. a. Which area of business should we focus more on our product development?
-- (Branding/taste/availability)
select Improvements_desired,
count(Respondent_ID) as Total_Respondents
from fact_survey_responses
where Current_brands ="CodeX"
group by Improvements_desired;

