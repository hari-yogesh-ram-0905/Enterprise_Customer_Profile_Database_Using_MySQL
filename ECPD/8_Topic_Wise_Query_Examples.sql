# ------------------------------------------------------------------------------------------------------------------------------------
#                                                 Topic wise (Query Examples)
# ------------------------------------------------------------------------------------------------------------------------------------

USE ECPD;


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 12 ( ORDER BY )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses : sorts the result-set (ascending or descending) . (By default -> sorts the data by "Ascending order")

# 1. Customers ordered by CustomerName ascending :
# -------------------------------------------------

SELECT CustomerID, CustomerName FROM Customers
ORDER BY CustomerName ASC;

# 2. Contacts ordered by FullName descending :
# --------------------------------------------

SELECT ContactID, FullName FROM Contacts
ORDER BY FullName DESC;

# 3. Contracts ordered by ContractValue descending :
# ---------------------------------------------------

SELECT ContractID, ContractValue FROM Contracts
ORDER BY ContractValue DESC;

# 4. Products subscribed ordered by SubscriptionDate ascending :
# ---------------------------------------------------------------

SELECT SubscriptionID, SubscriptionDate FROM ProductsSubscribed
ORDER BY SubscriptionDate ASC;

# 5. Support tickets ordered by DateLogged descending :
# ------------------------------------------------------

SELECT TicketID, DateLogged FROM SupportTickets
ORDER BY DateLogged DESC;


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 13 ( GROUP BY )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  groups rows sharing the same value for aggregation. And Summarizing data with aggregate functions.

# 1. Count of customers per country :
# ------------------------------------

SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

# 2. Count of contacts by preferred contact method :
# ---------------------------------------------------

SELECT PreferredContactMethod, COUNT(*) AS TotalContacts
FROM Contacts
GROUP BY PreferredContactMethod;

# 3. Total contract value per contract type :
# ---------------------------------------------

SELECT ContractType, SUM(ContractValue) AS TotalValue
FROM Contracts
GROUP BY ContractType;

# 4. Number of subscriptions per product :
# -----------------------------------------

SELECT ProductName, COUNT(*) AS SubscriptionCount
FROM ProductsSubscribed
GROUP BY ProductName;

# 5. Support tickets count per priority :
# ----------------------------------------

SELECT Priority, COUNT(*) AS TicketCount
FROM SupportTickets
GROUP BY Priority;


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 14 ( HAVING )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  filters results after GROUP BY. Apply filters on aggregated results.

# 1. Countries with less than 10 customers :
# ------------------------------------------

SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country
HAVING COUNT(*) < 10;

# 2. Contact methods with more than 15 :
# ---------------------------------------

SELECT PreferredContactMethod, COUNT(*) AS ContactCount
FROM Contacts
GROUP BY PreferredContactMethod
HAVING COUNT(*) > 15;

# 3. Contract types with total value below 5 million :
# ----------------------------------------------------

SELECT ContractType, SUM(ContractValue) AS TotalValue
FROM Contracts
GROUP BY ContractType
HAVING SUM(ContractValue) < 5000000;

# 4. Products with more than 7 subscriptions :
# ---------------------------------------------

SELECT ProductName, COUNT(*) AS SubscriptionCount
FROM ProductsSubscribed
GROUP BY ProductName
HAVING COUNT(*) > 7;

# 5. Ticket priorities with less than or equal to 15 tickets :
# -------------------------------------------------------------

SELECT Priority, COUNT(*) AS TicketCount
FROM SupportTickets
GROUP BY Priority
HAVING COUNT(*) <= 15;


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 15 ( AGGREGATE Functions )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  Aggregates summarize many rows to a "single value". Calculates (sum, average, min, max, count)

# 1. Total number of customers :
# -------------------------------

SELECT COUNT(*) AS TotalCustomers 
FROM Customers;

# 2. Average contract value :
# ----------------------------

SELECT AVG(ContractValue) AS AvgContractValue 
FROM Contracts;

# 3. Maximum contract value :
# ---------------------------

SELECT MAX(ContractValue) AS MaxContractValue 
FROM Contracts;

# 4. Maximum contract value :
# ----------------------------

SELECT MIN(ContractValue) AS MinContractValue 
FROM Contracts;

# 5. Maximum contract value :
# ----------------------------

SELECT SUM(ContractValue) AS TotalContractValue 
FROM Contracts;


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 16 ( DATE Functions )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  manipulate or extract date/time values. 

#  ------------------------------------
#            a)  DATE_ADD
#  ------------------------------------

# 1) Extend a contract’s end date by 30 days :
# --------------------------------------------

SELECT ContractID, ContractEndDate,
       DATE_ADD(ContractEndDate, INTERVAL 30 DAY) AS ExtendedEndDate
FROM Contracts;

# 2) Warranty expiry by adding 2 years to purchase date :
# --------------------------------------------------------

SELECT SubscriptionID, ProductName, SubscriptionDate, 
       DATE_ADD(SubscriptionDate, INTERVAL 2 YEAR) AS WarrantyExpiry
FROM ProductsSubscribed;


#  ------------------------------------
#            b)  DATE_SUB
#  ------------------------------------

# 1) Check membership that started 2 months ago :
# ------------------------------------------------

SELECT CustomerID, CustomerName, DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AS TwoMonthsAgo
FROM Customers;

#  ------------------------------------
#            c)  DATEDIFF
#  ------------------------------------

#  1) For each contract, what is the number of days between its start date and end date :
# ----------------------------------------------------------------------------------------

SELECT ContractID, ContractStartDate, ContractEndDate,
       DATEDIFF(ContractEndDate, ContractStartDate) AS Contracted_Days_In_Numbers
FROM Contracts;

#  ------------------------------------
#            d)  EXTRACT
#  ------------------------------------

# 1) Extract year, month and date of subscription :
# --------------------------------------------------

SELECT SubscriptionID, ProductName, SubscriptionDate,
       EXTRACT(YEAR FROM SubscriptionDate) AS SubscriptionYear,
       EXTRACT(MONTH FROM SubscriptionDate) AS SubscriptionMonth,
       EXTRACT(DAY FROM SubscriptionDate) AS SubscriptionDay
FROM ProductsSubscribed;

# --------------------------------------------------------------------------------------------------------------------------------