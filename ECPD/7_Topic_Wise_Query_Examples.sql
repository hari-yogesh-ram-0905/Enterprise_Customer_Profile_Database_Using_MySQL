# ------------------------------------------------------------------------------------------------------------------------------------
#                                                 Topic wise (Query Examples)
# ------------------------------------------------------------------------------------------------------------------------------------

USE ECPD;

# ------------------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 1 ( WHERE )
# ------------------------------------------------------------------------------------------------------------------------------------

#   Uses : Used to filter rows in SELECT, UPDATE, DELETE statements.

# 1. Customers in India :
# ------------------------

SELECT CustomerName, Country FROM Customers
WHERE Country = 'India';


# 2. Contacts preferring phone contact :
# ---------------------------------------

SELECT FullName, PreferredContactMethod FROM Contacts
WHERE PreferredContactMethod = 'Phone';

# 3. Active contracts :
# ---------------------

SELECT ContractID, ContractType, Status FROM Contracts
WHERE Status = 'Active';

# 4. Products with auto-renew enabled :
# --------------------------------------

SELECT SubscriptionID, ProductName FROM ProductsSubscribed
WHERE IsAutoRenewed = 'Yes';

# 5. Open support tickets with high priority :
# ---------------------------------------------

SELECT TicketID, IssueCategory, IssueDescription FROM SupportTickets
WHERE Status = 'Open' AND Priority = 'High';


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 2 ( BETWEEN )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  filters data (numeric or date) within a specified range of values.

# 1. Customers with IDs between 10 and 20 :
# -----------------------------------------

SELECT CustomerID, CustomerName FROM Customers
WHERE CustomerID BETWEEN 10 AND 20;

# 2. Contacts with ContactID between 5 and 15 :
# ---------------------------------------------

SELECT ContactID, FullName FROM Contacts
WHERE ContactID BETWEEN 5 AND 15;

# 3. Contracts valued between 100000 and 300000 :
# -----------------------------------------------

SELECT ContractID, ContractValue FROM Contracts
WHERE ContractValue BETWEEN 100000 AND 300000;

# 4. ProductsSubscribed between 2022-01-01 and 2022-12-31 :
# ----------------------------------------------------------

SELECT SubscriptionID, SubscriptionDate FROM ProductsSubscribed
WHERE SubscriptionDate BETWEEN '2022-01-01' AND '2022-12-31';

# 5. Support tickets logged between 2023-01-01 and 2023-06-30 :
# --------------------------------------------------------------

SELECT TicketID, DateLogged FROM SupportTickets
WHERE DateLogged BETWEEN '2023-01-01' AND '2023-06-30';


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 3 ( AND )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  combines multiple conditions that all must be true.

# 1. Active customers in India :
# -------------------------------

SELECT CustomerName FROM Customers
WHERE Country = 'India' AND IsActive = 'Yes';

#  2. Contacts who prefer email AND have unique phone numbers :
# --------------------------------------------------------------

SELECT FullName, PhoneNumber FROM Contacts
WHERE PreferredContactMethod = 'Email' AND PhoneNumber IS NOT NULL;

#  3. Active contracts of type Annual :
# --------------------------------------

SELECT ContractID, ContractValue FROM Contracts
WHERE Status = 'Active' AND ContractType = 'Annual';

# 4. Subscriptions auto-renewed AND CRM product :
# ------------------------------------------------

SELECT SubscriptionID FROM ProductsSubscribed
WHERE ProductName = 'CRM' AND IsAutoRenewed = 'Yes';

# 5. Support tickets open AND priority high :
# --------------------------------------------

SELECT TicketID, IssueCategory, IssueDescription FROM SupportTickets
WHERE Status = 'Open' AND Priority = 'High';


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 4 ( OR )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses : combines conditions where at least one must be true.

# 1. Customers from India or USA :
# ---------------------------------

SELECT CustomerName, Country FROM Customers
WHERE Country = 'India' OR Country = 'USA';

# 2. Contacts preferring phone OR in-person :
# --------------------------------------------

SELECT FullName, PreferredContactMethod FROM Contacts
WHERE PreferredContactMethod = 'Phone' OR PreferredContactMethod = 'In-Person';

# 3. Contracts active OR expired :
# ---------------------------------

SELECT ContractID, Contractvalue, Status FROM Contracts
WHERE Status = 'Active' OR Status = 'Expired';

# 4. Products of type ERP OR Analytics :
# --------------------------------------

SELECT SubscriptionID, ProductName FROM ProductsSubscribed
WHERE ProductName = 'ERP' OR ProductName = 'Analytics';

# 5. Support tickets with priority High OR Medium :
# --------------------------------------------------

SELECT TicketID, IssueCategory, IssueDescription, Priority FROM SupportTickets
WHERE Priority = 'High' OR Priority = 'Medium';

# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 5 ( NOT , <>, != )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  Negation operators filter records not meeting a condition.

# 1. Customers not from India :
# -----------------------------

SELECT CustomerName, Country FROM Customers
WHERE Country <> 'India';

# 2. Contacts whose preferred method is not In-Person :
# --------------------------------------------------

SELECT FullName, PreferredContactMethod FROM Contacts
WHERE PreferredContactMethod != 'In-Person';

# 3. Contracts that are not Active & Expired :
# --------------------------------------------

SELECT ContractID, ContractValue, Status FROM Contracts
WHERE Status <> 'Active' AND Status <> 'Expired';

# 4. ProductsSubscribed that are not auto-renewed :
# --------------------------------------------------

SELECT SubscriptionID, ProductName FROM ProductsSubscribed
WHERE IsAutoRenewed <> 'Yes';

# 5. Support tickets not in Closed status
# ----------------------------------------

SELECT TicketID, IssueCategory, IssueDescription, Status FROM SupportTickets
WHERE Status != 'Closed';

# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 6 ( IN )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses : matches a column against multiple possible values

# 1. Customers from India, USA, or UK :
# -------------------------------------

SELECT CustomerName, Country FROM Customers
WHERE Country IN ('India', 'USA', 'UK');

# 2. Contacts preferring Phone or Email :
# ----------------------------------------

SELECT FullName, PreferredContactMethod FROM Contacts
WHERE PreferredContactMethod IN ('Phone', 'Email');

# 3. Contracts with statuses Active or Pending :
# -----------------------------------------------

SELECT ContractID, Status FROM Contracts
WHERE Status IN ('Active', 'Pending');

# 4. ProductsSubscribed with product CRM or ERP :
# -----------------------------------------------

SELECT SubscriptionID, ProductName FROM ProductsSubscribed
WHERE ProductName IN ('CRM', 'ERP');

# 5. Support tickets with priorities High or Medium :
# -----------------------------------------------------

SELECT TicketID, IssueCategory, IssueDescription, Priority FROM SupportTickets
WHERE Priority IN ('High', 'Medium');



# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 7 ( NOT IN )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  excludes a set of listed values

# 1. Customers not from India or USA :
# -------------------------------------

SELECT CustomerName, Country FROM Customers
WHERE Country NOT IN ('India', 'USA');

# 2. Contacts not preferring Phone or Email :
# --------------------------------------------

SELECT FullName, PreferredContactMethod FROM Contacts
WHERE PreferredContactMethod NOT IN ('Phone', 'Email');

# 3. Contracts not Active or Pending :
# ------------------------------------

SELECT ContractID, Status FROM Contracts
WHERE Status NOT IN ('Active', 'Pending');

# 4. ProductsSubscribed not CRM or ERP :
# ---------------------------------------
SELECT SubscriptionID, ProductName FROM ProductsSubscribed
WHERE ProductName NOT IN ('CRM', 'ERP');

# 5. Support tickets not High or Medium priority :
# -------------------------------------------------

SELECT TicketID, IssueCategory, IssueDescription, Priority FROM SupportTickets
WHERE Priority NOT IN ('High', 'Medium');


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 8 ( LIKE Operator )                   
# ---------------------------------------------------------------------------------------------------------------------------                                        -----------

#  Uses : allows pattern-based filtering using wildcards( %, _ ). Text Searching, Partial Matching.

# 1. Customers whose name starts with 'F'  :
# --------------------------------------------

SELECT CustomerName, Country FROM Customers
WHERE CustomerName LIKE 'F%';

# 2. Contacts whose full name ends with 'ar' :
# ---------------------------------------------

SELECT FullName FROM Contacts
WHERE FullName LIKE '%ar';

# 3. Contracts whose ContractType contains 'Annual' :
# ----------------------------------------------------

SELECT ContractID, ContractType, Status FROM Contracts
WHERE ContractType LIKE '%Annual%';

# 4. Products with product name ending with 's' :
# --------------------------------------------------

SELECT SubscriptionID, ProductName FROM ProductsSubscribed
WHERE ProductName LIKE '%s';

# 5. Support ticket issue category for 2rd letter containing 'e':
# ----------------------------------------------------------------

SELECT TicketID, IssueCategory FROM SupportTickets
WHERE IssueCategory LIKE '_e%';


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 9 ( LINIT )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  restricts the number of returned rows

# 1. First 5 customers :
# -----------------------

SELECT * FROM Customers
LIMIT 5;

# 2. First 10 contacts :
# -----------------------

SELECT * FROM Contacts
LIMIT 10;

# 3. First 3 contracts :
# -----------------------

SELECT * FROM Contracts
LIMIT 3;

# 4. First 5 product subscriptions :
# ------------------------------------

SELECT * FROM ProductsSubscribed
LIMIT 5;

# 5. First 7 support tickets :
# -----------------------------

SELECT * FROM SupportTickets
LIMIT 7;

# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 10 ( OFFSET )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  skips a specified number of rows before returning results

# 1. Show 5 customers, skipping the first 5 :
# --------------------------------------------

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 5 OFFSET 5;

# 2. Get contacts, skip first 10, next 5 :
# ------------------------------------------

SELECT * FROM Contacts
ORDER BY ContactID
LIMIT 5 OFFSET 10;

# 3. List contracts, skip first 2 records, next 3 :
# --------------------------------------------------

SELECT * FROM Contracts
ORDER BY ContractID
LIMIT 3 OFFSET 2;

# 4. Show 10 products, skip first 20 :
# --------------------------------------

SELECT * FROM ProductsSubscribed
ORDER BY SubscriptionID
LIMIT 10 OFFSET 20;

# 5. Get support tickets, skip first 15 :
# ----------------------------------------

SELECT * FROM SupportTickets
ORDER BY TicketID
LIMIT 10 OFFSET 15;

# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 11 ( DISTINCT )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  returns only unique (non-duplicate) values

# 1. List all unique countries of customers :
# --------------------------------------------

SELECT DISTINCT Country 
FROM Customers;

# 2. Get all unique preferred contact methods :
# ----------------------------------------------

SELECT DISTINCT PreferredContactMethod 
FROM Contacts;

# 3. List distinct contract types :
# ----------------------------------

SELECT DISTINCT ContractType 
FROM Contracts;

# 4. Show all distinct product names :
# -------------------------------------

SELECT DISTINCT ProductName 
FROM ProductsSubscribed;

# 5. List unique ticket priorities :
# -----------------------------------

SELECT DISTINCT Priority 
FROM SupportTickets;

# ---------------------------------------------------------------------------------------------------------------------------