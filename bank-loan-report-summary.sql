select * from bank_loan_data

-- TOTAL LOAN APPLICATIONS --

select count(id) as Total_Loan_Applications from bank_loan_data

-- MTD Total Loan Applications --

select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- PMTD Total Loan Applications --

select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

-- TOTAL FUNDED AMOUNT --

select sum(loan_amount) as Total_Funded_Amount from bank_loan_data

-- MTD TOTAL FUNDED AMOUNT --

select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- PMTD TOTAL FUNDED AMOUNT --

select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

-- TOTAL AMOUNT RECEIVED --

select sum(total_payment) as Total_Amount_Received from bank_loan_data

-- MTD TOTAL AMOUNT RECEIVED --

select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- PMTD TOTAL AMOUNT RECEIVED --

select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

-- AVERAGE INTEREST RATE --

select round(avg(int_rate), 4) * 100 as Avg_Interest_Rate from bank_loan_data

-- MTD AVERAGE INTEREST RATE --

select round(avg(int_rate), 4) * 100 as MTD_Avg_Interest_Rate from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- PMTD AVERAGE INTEREST RATE --

select round(avg(int_rate), 4) * 100 as PMTD_Avg_Interest_Rate from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

-- AVERAGE DTI --

select round(avg(dti), 4)*100 as Avg_DTI from bank_loan_data

-- MTD AVERAGE DTI --

select round(avg(dti), 4)*100 as MTD_Avg_DTI from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

-- PMTD AVERAGE DTI --

select round(avg(dti), 4)*100 as PMTD_Avg_DTI from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

-- GOOD LOAN PERCENTAGE --

select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)/count(id) 
	as Good_Loan_Percentage
	from bank_loan_data

-- GOOD LOAN APPLICATIONS --

select count(id) as Good_Loan_Applications from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

-- GOOD LOAN FUNDED AMOUNT --

select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

-- GOOD LOAN AMOUNT RECEIVED --

select sum(total_payment) as Good_Loan_Amount_Received from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current'

-- BAD LOAN PERCENTAGE --

select (count(case when loan_status = 'Charged Off' then id end)*100)/count(id) 
	as Bad_Loan_Percentage
	from bank_loan_data

-- BAD LOAN APPLICATIONS --

select count(id) as Bad_Loan_Applications from bank_loan_data
where loan_status='Charged Off'

-- BAD LOAN FUNDED AMOUNT --

select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data
where loan_status='Charged Off'

-- BAD LOAN AMOUNT RECEIVED --

select sum(total_payment) as Bad_Loan_Amount_Received from bank_loan_data
where loan_status='Charged Off'

-- LOAN STATUS --

select 
	loan_status,
	count(id) as LoanCount,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount,
	avg(int_rate * 100) as Interest_Rate,
	avg(dti * 100) as DTI
from
	bank_loan_data
group by 
	loan_status

-- MTD LOAN STATUS --

select 
	loan_status,
	sum(total_payment) as MTD_Total_Amount_Received,
	sum(loan_amount) as MTD_Total_Funded_Amount
from 
	bank_loan_data
where month(issue_date) = 12
group by loan_status



