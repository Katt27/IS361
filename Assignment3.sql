/* SQL Assignment Submission
   Author: Your Name
   Date: Submission Date
   Description: This script contains SQL queries for the flights database assignment.
   It includes queries to count the total number of flights, group flights by airline,
   and perform various aggregations as per the assignment instructions.
*/

-- 1. Show the total number of flights
-- Counts the total number of flights in the flights table.
SELECT COUNT(*) AS total_number_of_flights
FROM flights;

-- 2. Show the total number of flights by airline (carrier)
-- Groups flights by airline and counts the number of flights for each carrier.
SELECT carrier, COUNT(*) AS number_of_flights
FROM flights
GROUP BY carrier;

-- 3. Show all of the airlines, ordered by number of flights in descending order
-- Assumes joining with an airlines table to get airline names. Adjust as necessary.
SELECT a.name AS airline_name, COUNT(f.id) AS number_of_flights
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
GROUP BY a.name
ORDER BY number_of_flights DESC;

-- 4. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order
-- Limits the results to the top 5 airlines with the most flights.
SELECT a.name AS airline_name, COUNT(f.id) AS number_of_flights
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
GROUP BY a.name
ORDER BY number_of_flights DESC
LIMIT 5;

-- 5. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order
-- Filters flights by distance before counting and ranking the airlines.
SELECT a.name AS airline_name, COUNT(f.id) AS number_of_flights
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
WHERE f.distance >= 1000
GROUP BY a.name
ORDER BY number_of_flights DESC
LIMIT 5;

-- 6. Custom question: Show the average flight delay per airline for flights departing from 'JFK' airport, ordered by average delay in descending order
-- This query calculates the average delay for each airline for flights departing from JFK and orders them by the average delay.
SELECT a.name AS airline_name, AVG(f.delay) AS average_delay
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
WHERE f.origin = 'JFK'
GROUP BY a.name
ORDER BY average_delay DESC;
