CREATE DATABASE ola ;
USE ola ;
SELECT * FROM bookings ;

# 1. Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
SELECT * FROM bookings 
where Booking_Status = 'Success';

SELECT * FROM successful_bookings;

# 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type , AVG(Ride_Distance)
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle;


# 3. Get the total number of cancelled rides by customers:

Create View cancelled_rides_by_customers As
SELECT count(*)
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';
SELECT * FROM cancelled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers As
SELECT Customer_ID,COUNT(Customer_ID) AS total_ride
FROM bookings
GROUP BY Customer_ID
ORDER BY total_ride DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) AS max_ratings ,
MIN(Driver_Ratings) AS min_ratings
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan' AND Driver_Ratings IS NOT NULL;

SELECT * FROM Max_Min_Driver_Rating;

# 7. Retrieve all rides where payment was made using UPI:

CREATE VIEW UPI_Payment AS
SELECT * FROM bookings
WHERE Payment_Method ='UPI';

SELECT * FROM UPI_Payment;

# 8. Find the average customer rating per vehicle type:

SELECT Vehicle_Type , AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
WHERE Customer_Rating IS NOT NULL
GROUP BY Vehicle_Type ;
# 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';


# 10. List all incomplete rides along with the reason:

SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

