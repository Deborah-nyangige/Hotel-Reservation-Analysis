SELECT TOP 5*
FROM [Hotel Reservation Dataset]

SELECT COUNT(*) AS Total_Rows
FROM [Hotel Reservation Dataset]

SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Hotel Reservation Dataset'

SELECT COUNT(*) AS total_reservations
FROM [Hotel Reservation Dataset]


SELECT TOP 1 type_of_meal_plan, COUNT(*) AS plan_count
FROM [Hotel Reservation Dataset]
GROUP BY type_of_meal_plan
ORDER BY plan_count DESC


SELECT ROUND(AVG(avg_price_per_room), 2) AS avg_price_children
FROM [Hotel Reservation Dataset]
WHERE no_of_children > 0

SELECT 
    SUM(CASE WHEN YEAR(CAST(arrival_date AS DATE)) = 2017 THEN 1 ELSE 0 END) AS Reservations_2017,
    SUM(CASE WHEN YEAR(CAST(arrival_date AS DATE)) = 2018 THEN 1 ELSE 0 END) AS Reservations_2018
FROM [Hotel Reservation Dataset]
WHERE TRY_CAST(arrival_date AS DATE) IS NOT NULL
AND YEAR(CAST(arrival_date AS DATE)) IN (2017, 2018)


SELECT TOP 1 room_type_reserved, COUNT(*) AS room_type_count
FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved
ORDER BY room_type_count DESC

SELECT COUNT(*) AS weekend_reservations
FROM [Hotel Reservation Dataset]
WHERE no_of_weekend_nights > 0

SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time)AS lowest_lead_time
FROM [Hotel Reservation Dataset]

SELECT TOP 1 market_segment_type, COUNT(*) AS segment_count
FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY segment_count DESC

SELECT COUNT(*) AS confirmed_reservations
FROM [Hotel Reservation Dataset]
WHERE booking_status = 'Confirmed'

SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM [Hotel Reservation Dataset]

SELECT AVG(no_of_weekend_nights) AS Avg_Weekend_Nights_Involving_Children
FROM [Hotel Reservation Dataset]
WHERE no_of_children > 0

SELECT 
    CASE MONTH(arrival_date)
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS Month,
    COUNT(Booking_ID) AS Reservations_Made
FROM [Hotel Reservation Dataset]
GROUP BY MONTH(arrival_date)
ORDER BY MONTH(arrival_date)


SELECT 
    room_type_reserved,
    ROUND(AVG(no_of_weekend_nights + no_of_week_nights), 0) AS Avg_Nights
FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved



SELECT TOP 1
    room_type_reserved,
    COUNT(room_type_reserved) AS Total_Count,
    ROUND(AVG(avg_price_per_room), 2) AS Average_Price
FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved
ORDER BY Total_Count DESC

SELECT TOP 1
    market_segment_type,
    ROUND(AVG(avg_price_per_room), 2) AS Avg_Price_Per_Room
FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY Avg_Price_Per_Room DESC
