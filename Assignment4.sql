-- Select all data from the planes table
SELECT * FROM planes;

-- Update the planes table so that rows with no year will be assigned the year 2013
UPDATE planes SET year = 2013 WHERE year IS NULL;

-- Insert a new record into the planes table
INSERT INTO planes (tailnum, year, type, manufacturer, model, engines, seats, speed, engine) 
VALUES ('N15501', 2013, 'Fixed wing single engine', 'BOEING', 'A222-101', 3, 100, NULL, 'Turbo-fan');

-- Delete the newly inserted record
DELETE FROM planes WHERE tailnum = 'N15501';
