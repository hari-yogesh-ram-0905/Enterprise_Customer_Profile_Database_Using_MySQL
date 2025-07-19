# ------------------------------------------------------------------------------------------------------------------------------------
#                                                 Topic wise (Query Examples)
# ------------------------------------------------------------------------------------------------------------------------------------

USE ECPD;

# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 17 ( VIEWS )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  virtual tables based on SQL queries. Simplifies complex logic, security, reusable queries.

# 1. Create view for active customers :
# --------------------------------------

CREATE VIEW ActiveCustomers AS
SELECT * FROM Customers WHERE IsActive = 'Yes';

# retrieve the views(ActiveCustomers) :
# -------------------------------------
SELECT * FROM ActiveCustomers;


# 2. Create view for less-than-1 lakh-value contracts :
# ------------------------------------------------------

CREATE VIEW LessThan1LakhsValueContracts AS
SELECT * FROM Contracts WHERE ContractValue < 100000;

# retrieve the views(LessThan1LakhsValueContracts) :
# --------------------------------------------------
SELECT * FROM LessThan1LakhsValueContracts;


# 3. Create view showing products with subscription count :
# ---------------------------------------------------------

CREATE VIEW ProductSubscriptionCount AS
SELECT ProductName, COUNT(*) AS SubscriptionCount
FROM ProductsSubscribed
GROUP BY ProductName;

# retrieve the views(ProductSubscriptionCount) :
# --------------------------------------------------
SELECT * FROM ProductSubscriptionCount;


# 4. Create view for In-Progress support tickets :
# -------------------------------------------------

CREATE VIEW OpenTickets AS
SELECT * FROM SupportTickets WHERE Status = 'In Progress';

# retrieve the views(OpenTickets) :
# ----------------------------------
SELECT * FROM OpenTickets;


# 5. Create view for contacts with Gmail addresses :
# ---------------------------------------------------

CREATE VIEW GmailContacts AS
SELECT * FROM Contacts
WHERE Email LIKE '%@gmail.com';

# retrieve the views(GmailContacts) :
# ----------------------------------
SELECT * FROM GmailContacts;


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 18 ( STORED PROCEDURES )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses : reusable SQL routines on the server. Simplifies Complex Business logic, boost performance, reduce code duplication.

#  Delimiter -> Uses :
# ---------------------
#  We use DELIMITER in MySQL to temporarily change the default statement terminator (;)
#  so that multi-statement blocks like procedures, triggers, or functions can be defined without confusing MySQL.

#  1) Get Indian Customers :
# ---------------------------

DELIMITER //
CREATE PROCEDURE GetCustomersFromIndia()
BEGIN
  SELECT * FROM Customers WHERE Country = 'India';
END //
DELIMITER ;

#  Call the Procedure here :
# ---------------------------
CALL GetCustomersFromIndia();


#  2) Get Contracts value below a fixed value (1 lakh) :
# -------------------------------------------------------

DELIMITER //
CREATE PROCEDURE GetLowValueContracts()
BEGIN
  SELECT * FROM Contracts WHERE ContractValue < 100000;
END //
DELIMITER ;

#  Call the Procedure here :
# ---------------------------
CALL GetLowValueContracts();


#  3) Get Tickets by fixed priority (High) :
# -------------------------------------------

DELIMITER //
CREATE PROCEDURE GetHighPriorityTickets()
BEGIN
  SELECT * FROM SupportTickets WHERE Priority = 'High';
END //
DELIMITER ;

#  Call the Procedure here :
# ---------------------------
CALL GetHighPriorityTickets();


#  4)  List Products by Fixed Subscription date :
# -----------------------------------------------

DELIMITER &&
CREATE PROCEDURE ListRecentProducts()
BEGIN
  SELECT * FROM ProductsSubscribed WHERE SubscriptionDate >= '2023-01-01';
END &&
DELIMITER ;

#  Call the Procedure here :
# ---------------------------
CALL ListRecentProducts();

# --------------------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 19 ( JOINS )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses :  combine rows from two or more tables based on related columns between them.

# 1) Retrieve the customer name, their industry, and the contact person's full name and position
#    for all customers who have at least one registered contact in the Contacts table.
# -------------------------------------------------------------------------------------------------
 
SELECT
    c.CustomerName,
    c.Industry,
    ct.FullName AS ContactPerson,
    ct.Position
FROM
    Customers c
INNER JOIN
    Contacts ct
ON
    c.CustomerID = ct.CustomerID;


#  2)  get a full list of customers and their contracts, showing even those customers
#      who do not have any contracts.
#  ------------------------------------------------------------------------------------

SELECT
    c.CustomerID,
    c.CustomerName,
    c.CustomerType,
    c.Country,
    con.ContractID,
    con.ContractStartDate,
    con.ContractEndDate,
    con.ContractValue,
    con.Status
FROM
    Customers c
LEFT JOIN
    Contracts con
ON
    c.CustomerID = con.CustomerID;
    
    
#  3) Retrieve a list of all product subscriptions along with their corresponding customer details.
# --------------------------------------------------------------------------------------------------

SELECT
    ps.SubscriptionID,
    ps.ProductName,
    ps.SubscriptionDate,
    ps.RenewalDate,
    ps.SubscriptionValue,
    ps.IsAutoRenewed,
    c.CustomerID,
    c.CustomerName,
    c.CustomerType,
    c.Country
FROM
    Customers c
RIGHT JOIN
    ProductsSubscribed ps
ON
    c.CustomerID = ps.CustomerID;
    
    
#  4)   Display all customers and their support tickets, showing every customer even if they never raised a ticket :
# -------------------------------------------------------------------------------------------------------------------

SELECT
    c.CustomerID,
    c.CustomerName,
    c.Country,
    st.TicketID,
    st.IssueCategory,
    st.IssueDescription,
    st.Status
FROM
    Customers c
LEFT JOIN
    SupportTickets st
ON
    c.CustomerID = st.CustomerID

UNION

SELECT
    c.CustomerID,
    c.CustomerName,
    c.Country,
    st.TicketID,
    st.IssueCategory,
    st.IssueDescription,
    st.Status
FROM
    Customers c
RIGHT JOIN
    SupportTickets st
ON
    c.CustomerID = st.CustomerID;
  

#  5)   From the Customers table, find pairs of customers from the same country but with different industries :
# ---------------------------------------------------------------------------------------------------------------

SELECT
    c1.CustomerID AS CustomerID_1,
    c1.CustomerName AS CustomerName_1,
    c1.Industry AS Industry_1,
    c2.CustomerID AS CustomerID_2,
    c2.CustomerName AS CustomerName_2,
    c2.Industry AS Industry_2,
    c1.Country
FROM
    Customers c1
INNER JOIN
    Customers c2
ON
    c1.Country = c2.Country                -- same country
    AND c1.Industry <> c2.Industry         -- different industries
    AND c1.CustomerID < c2.CustomerID;     -- avoid duplicate pairs (A,B vs B,A)
    
# --------------------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------------------
#                                                 Topic - 20 ( CASE STATEMENTS )                   
# ---------------------------------------------------------------------------------------------------------------------------

#  Uses : conditional expression in SQL that returns specific values based on conditions, similar to (if-else) logic.
#  Used to perform conditional logic inside SQL queries, especially to transform data or derive new columns.

# 1. Categorize Customers by Type:
# --------------------------------

# Use Case : Management wants to view customers categorized as 'Large', 'Medium', or 'Small' based on their CustomerType.

SELECT 
    CustomerID,
    CustomerName,
    CustomerType,
    CASE 
        WHEN CustomerType = 'Enterprise' THEN 'Large'
        WHEN CustomerType IN ('SMB', 'Government') THEN 'Medium'
        ELSE 'Small'
    END AS CustomerSizeCategory
FROM Customers;


# 2. Contacts Preferred Communication Flag:
# -----------------------------------------

# Use Case: Sales team wants to flag contacts as 'Remote Friendly' or 'Needs In-Person' based on PreferredContactMethod.

SELECT 
    ContactID,
    FullName,
    PreferredContactMethod,
    CASE 
        WHEN PreferredContactMethod IN ('Email', 'Phone') THEN 'Remote Friendly'
        ELSE 'Needs In-Person'
    END AS CommunicationType
FROM Contacts;


# 3. Contract Duration Category:
# ------------------------------

# Use Case: Finance wants to categorize contracts based on their duration.

SELECT 
    ContractID,
    ContractStartDate,
    ContractEndDate,
    DATEDIFF(ContractEndDate, ContractStartDate) AS DurationDays,
    CASE 
        WHEN DATEDIFF(ContractEndDate, ContractStartDate) > 365 THEN 'Long-Term'
        WHEN DATEDIFF(ContractEndDate, ContractStartDate) BETWEEN 181 AND 365 THEN 'Mid-Term'
        ELSE 'Short-Term'
    END AS ContractLengthCategory
FROM Contracts;


# 4. Auto Renewal Status for Subscriptions:
# -----------------------------------------

# Use Case: Subscription team wants to label subscriptions as 'Will Renew' or 'Needs Attention'.

SELECT 
    SubscriptionID,
    ProductName,
    IsAutoRenewed,
    CASE 
        WHEN IsAutoRenewed = 'Yes' THEN 'Will Renew'
        ELSE 'Needs Attention'
    END AS RenewalStatus
FROM ProductsSubscribed;


# 5. Ticket Priority Response Plan:
# ----------------------------------

# Use Case: Support team wants to assign internal action plans based on ticket priority.

SELECT 
    TicketID,
    IssueCategory,
    Priority,
    CASE 
        WHEN Priority = 'High' THEN 'Immediate Response Required'
        WHEN Priority = 'Medium' THEN 'Respond within EOD'
        ELSE 'Respond within 2 Days'
    END AS ActionPlan
FROM SupportTickets;


# ---------------------------------------------------------------------------------------------------------------------------