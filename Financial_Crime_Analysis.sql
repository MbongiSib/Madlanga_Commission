--South Africa Criminal Database - 30 SQL Questions (Questions Only)
--1. Display all records from the CriminalCases table.
USE FIN_CRIME
SELECT * from crime_table;
--2. Count the total number of cases in the table.
SELECT COUNT (RecordID) AS num_cases
FROM crime_table
--3. Count the number of cases in each province.
SELECT COUNT (RecordID) AS Mpumalanga
FROM crime_table
Where Province='Mpumalanga';
SELECT COUNT (RecordID) AS Gauteng
FROM crime_table
Where Province='Gauteng';
SELECT COUNT (RecordID) AS Limpopop
FROM crime_table
Where Province='Limpopo';
SELECT COUNT (RecordID) AS KwaZuluNatal
FROM crime_table
Where Province='KwaZulu-Natal';
SELECT COUNT (RecordID) AS NorthWest
FROM crime_table
Where Province='North West';
SELECT COUNT (RecordID) AS EastenCape
FROM crime_table
Where Province='Eastern Cape';
SELECT COUNT (RecordID) AS NorthernCape
FROM crime_table
Where Province='Northern Cape';
SELECT COUNT (RecordID) AS FreeState
FROM crime_table
Where Province='Free State';
SELECT COUNT (RecordID) AS WesternCape
FROM crime_table
Where Province='Western Cape';
--4. Retrieve all cases where the crime type is Fraud.
SELECT * from crime_table
Where CrimeType='Fraud';
--5. Count the number of cases for each crime type.
SELECT COUNT (RecordID) AS FraudNumbers
from crime_table
Where CrimeType='Fraud';
--6. Display all cases classified as High or Critical risk.
SELECT * from crime_table
WHERE RiskLevel='Critical' or RiskLevel='High';
--7. Calculate the average Financial Score of all suspects.
Select AVG(FinancialScore) AS FinScoreAVG
from crime_table;
--8. Find the highest Estimated Fraud Amount recorded.

--9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.
--10. Display all cases where the suspect was arrested.
--11. Count how many suspects were arrested versus not arrested.
SELECT Count (RecordID) AS Arrested
from crime_table
WHere Arrested = 1;
SELECT Count (RecordID) AS UnArrested
from crime_table
WHere Arrested = 0;

--12. Count the number of cases associated with each bank.
--13. Calculate the total Estimated Fraud Amount per province.
Select Distinct Province from crime_table;
Select SUM(EstimatedFraudAmount_ZAR) AS KwaZulu
from crime_table
WHERE province = 'KwaZulu-Natal';

Select SUM(EstimatedFraudAmount_ZAR) AS Northwest
from crime_table
WHERE province = 'North West';

Select SUM(EstimatedFraudAmount_ZAR) AS Gauteng
from crime_table
WHERE province  = 'Gauteng';

Select SUM(EstimatedFraudAmount_ZAR) AS Limpopo
from crime_table
WHERE province  = 'Limpopo';

Select SUM(EstimatedFraudAmount_ZAR) AS Mpumalanga
from crime_table
WHERE province  = 'Mpumalanga';

Select SUM(EstimatedFraudAmount_ZAR) AS EasternCape
from crime_table
WHERE province  = 'Eastern Cape';

Select SUM(EstimatedFraudAmount_ZAR) AS FreeState
from crime_table
WHERE province  = 'Free State';

Select SUM(EstimatedFraudAmount_ZAR) AS WesternCape
from crime_table
WHERE province  = 'Western Cape';

Select SUM(EstimatedFraudAmount_ZAR) AS NorthernCape
from crime_table
WHERE province  = 'Northern Cape';
--14. Retrieve all suspects older than 50 years.
Select * from crime_table
Where age>50;
--15. Calculate the average age of suspects per province.
Select Distinct Province from crime_table;
Select AVG(Age) AS KwaZulu
from crime_table
WHERE province = 'KwaZulu-Natal';

Select AVG(Age) AS Northwest
from crime_table
WHERE province = 'North West';

Select AVG(Age) AS Gauteng
from crime_table
WHERE province  = 'Gauteng';

Select AVG(Age) AS Limpopo
from crime_table
WHERE province  = 'Limpopo';

Select AVG(Age) AS Mpumalanga
from crime_table
WHERE province  = 'Mpumalanga';

Select AVG(Age) AS EasternCape
from crime_table
WHERE province  = 'Eastern Cape';

Select AVG(Age) AS FreeState
from crime_table
WHERE province  = 'Free State';

Select AVG(Age) AS WesternCape
from crime_table
WHERE province  = 'Western Cape';

Select AVG(Age) AS NorthernCape
from crime_table
WHERE province  = 'Northern Cape';
--16. Display all cases recorded from 2020 onwards.
Select * from crime_table
Where CrimeDate LIKE '202%'
--17. Count how many cases resulted in a Convicted status.

--18. Retrieve all suspects with more than three previous offenses.
Select *
from crime_table
Where PreviousOffenses>3;
--19. Show the distribution of cases by Risk Level.
Select distinct RiskLevel from crime_table;

Select Count(RecordID) AS LowLevel
from crime_table
Where RiskLevel like 'Low';

Select Count(RecordID) AS HIGHLevel
from crime_table
Where RiskLevel like 'High';

Select Count(RecordID) AS MedLevel
from crime_table
Where RiskLevel like 'Medium';

Select Count(RecordID) AS CriticalLevel
from crime_table
Where RiskLevel like 'Critical';
--20. Calculate the total Estimated Fraud Amount across all cases.
Select SUM(Convert(bigint,EstimatedFraudAmount_ZAR)) As TotalFraudAmunt
from crime_table
Where RecordID > 0;
--21. Identify the province with the highest number of cases.

--22. Retrieve the youngest suspect in the dataset.
--23. Retrieve the oldest suspect in the dataset.
Select * from crime_table 
order by Age DESC;
--24. Count the number of cases handled by each investigating officer.
Select distinct InvestigatingOfficer
from crime_table;

Select Count(RecordID) As OfficerMabena
from crime_table 
Where InvestigatingOfficer Like '%Mabena'

Select Count(RecordID) As OfficerNaidoo
from crime_table 
Where InvestigatingOfficer Like '%Naidoo';

Select Count(RecordID) As OfficerSmith
from crime_table 
Where InvestigatingOfficer Like '%Smith';

Select Count(RecordID) As OfficerMoyo
from crime_table 
Where InvestigatingOfficer Like '%Moyo';

Select Count(RecordID) As OfficerNkosi
from crime_table 
Where InvestigatingOfficer = 'Officer Nkosi';
--25. Calculate the average Estimated Fraud Amount per crime type.
--26. Display all cases occurring in Gauteng province.
--27. Retrieve all Fraud cases classified as High risk.
--28. Count the number of cases per year based on CrimeDate.
--ALTER TABLE crime_table
--Add YearCol VARCHAR(4)
--UPDATE crime_table
--SET YearCol = Left(CrimeDate,4)
--Select * from crime_table
--Where Left(CrimeDate,4) Like '20%';

Select YearCol, Count(RecordID) AS NumCase
from crime_table
Group by YearCol;
--29. Display all suspects with a Financial Score below 500.
--30. Identify the most common Crime Type in the dataset.
Select Crimetype , SUM(EstimatedFraudAmount_ZAR) As crimeAvG
From crime_table
Group by CrimeType;
