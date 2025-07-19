# --------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE ECPD;         #  ECPD ->  Enterprise Customer Profile Database

# --------------------------------------------------------------------------------------------------------------------------------

USE ECPD;

# --------------------------------------------------------------------------------------------------------------------------------

#  Create the Table : (SupportTickets)
#  ------------------------------------


CREATE TABLE SupportTickets (

    TicketID INT PRIMARY KEY,
    CustomerID INT,
    IssueCategory VARCHAR(50) CHECK (IssueCategory IN ('Login', 'Performance', 'Billing', 'Feature Request', 'Outage')),
    IssueDescription TEXT NOT NULL,
    DateLogged DATE NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Open', 'In Progress', 'Closed')),
    Priority VARCHAR(10) CHECK (Priority IN ('Low', 'Medium', 'High')),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    
);


# --------------------------------------------------------------------------------------------------------------------------------

#  Retreive the Data from the Table :
# ------------------------------------

SELECT * FROM SupportTickets;

# --------------------------------------------------------------------------------------------------------------------------------

#  Insert the data into the table :
# ----------------------------------

INSERT INTO SupportTickets (TicketID, CustomerID, IssueCategory, IssueDescription, DateLogged, Status, Priority) VALUES
(1, 12, 'Login', 'User unable to log into dashboard.', '2023-07-01', 'Open', 'High'),
(2, 4, 'Performance', 'System slow during peak hours.', '2022-11-12', 'In Progress', 'Medium'),
(3, 25, 'Billing', 'Duplicate charge on last invoice.', '2023-01-20', 'Closed', 'Low'),
(4, 9, 'Feature Request', 'Requesting dark mode option.', '2023-03-03', 'Open', 'Low'),
(5, 16, 'Outage', 'Service not available in region.', '2022-09-10', 'Closed', 'High'),
(6, 7, 'Login', 'Password reset email not received.', '2023-05-18', 'In Progress', 'Medium'),
(7, 18, 'Performance', 'Page loading very slowly.', '2022-12-22', 'Open', 'High'),
(8, 31, 'Billing', 'Tax calculation seems incorrect.', '2023-04-10', 'Closed', 'Medium'),
(9, 6, 'Feature Request', 'Add export to Excel option.', '2023-02-25', 'In Progress', 'Low'),
(10, 43, 'Outage', 'API not responding intermittently.', '2023-06-30', 'Open', 'High'),
(11, 5, 'Login', 'Two-factor auth not working.', '2022-10-15', 'Closed', 'Medium'),
(12, 3, 'Performance', 'Dashboard freezes occasionally.', '2023-05-05', 'In Progress', 'High'),
(13, 22, 'Billing', 'Requesting invoice breakdown.', '2022-11-01', 'Closed', 'Low'),
(14, 47, 'Feature Request', 'Need support for CSV upload.', '2023-01-12', 'Open', 'Low'),
(15, 10, 'Outage', 'System unavailable for 2 hours.', '2022-12-05', 'Closed', 'High'),
(16, 20, 'Login', 'User locked out after failed attempts.', '2023-06-22', 'In Progress', 'Medium'),
(17, 13, 'Performance', 'Report generation is slow.', '2022-08-01', 'Closed', 'Medium'),
(18, 29, 'Billing', 'Charged extra for add-on.', '2023-03-20', 'Open', 'High'),
(19, 50, 'Feature Request', 'Add Slack integration.', '2022-09-14', 'Closed', 'Low'),
(20, 14, 'Outage', 'Service interruption reported.', '2023-01-30', 'In Progress', 'High'),
(21, 1, 'Login', 'Unable to login via mobile app.', '2022-11-28', 'Closed', 'High'),
(22, 8, 'Performance', 'Lag when switching tabs.', '2023-02-08', 'Open', 'Medium'),
(23, 36, 'Billing', 'Late fee applied incorrectly.', '2022-07-22', 'Closed', 'Low'),
(24, 41, 'Feature Request', 'Support for dark/light themes.', '2023-03-14', 'In Progress', 'Low'),
(25, 2, 'Outage', 'Unexpected downtime.', '2023-04-27', 'Closed', 'High'),
(26, 19, 'Login', 'Error message when logging in.', '2022-10-18', 'Open', 'Medium'),
(27, 26, 'Performance', 'Loading issues on analytics.', '2023-06-01', 'In Progress', 'High'),
(28, 33, 'Billing', 'Subscription fee not applied.', '2023-01-04', 'Closed', 'Low'),
(29, 28, 'Feature Request', 'Option to delete accounts.', '2022-12-19', 'Open', 'Low'),
(30, 11, 'Outage', 'Email service down.', '2022-09-05', 'Closed', 'High'),
(31, 44, 'Login', 'App crashes at login screen.', '2023-02-21', 'In Progress', 'Medium'),
(32, 15, 'Performance', 'Graphs are not rendering properly.', '2023-03-03', 'Closed', 'Medium'),
(33, 23, 'Billing', 'Change in billing cycle.', '2022-11-17', 'Open', 'Low'),
(34, 40, 'Feature Request', 'Multi-language support needed.', '2023-05-13', 'In Progress', 'Low'),
(35, 35, 'Outage', 'Server crashed unexpectedly.', '2023-06-10', 'Closed', 'High'),
(36, 37, 'Login', 'Cannot authenticate using SSO.', '2023-01-08', 'Open', 'High'),
(37, 24, 'Performance', 'Heavy lag after update.', '2022-10-20', 'In Progress', 'High'),
(38, 27, 'Billing', 'Incorrect GST rate applied.', '2022-12-30', 'Closed', 'Medium'),
(39, 32, 'Feature Request', 'Add email template editor.', '2023-02-14', 'Open', 'Low'),
(40, 39, 'Outage', 'Service was disrupted at night.', '2022-11-09', 'Closed', 'High'),
(41, 30, 'Login', 'Unable to reset password.', '2023-06-01', 'In Progress', 'Medium'),
(42, 21, 'Performance', 'Too many redirects.', '2022-08-27', 'Open', 'Medium'),
(43, 17, 'Billing', 'Need refund for unused time.', '2023-03-01', 'Closed', 'Low'),
(44, 42, 'Feature Request', 'Schedule report feature.', '2023-04-09', 'In Progress', 'Low'),
(45, 46, 'Outage', 'Cloud service outage reported.', '2022-09-26', 'Closed', 'High'),
(46, 38, 'Login', 'Forgot password not functioning.', '2023-05-21', 'Open', 'Medium'),
(47, 34, 'Performance', 'Too many requests error.', '2022-10-02', 'Closed', 'Medium'),
(48, 49, 'Billing', 'Discount not applied.', '2023-01-25', 'In Progress', 'Low'),
(49, 45, 'Feature Request', 'More admin controls needed.', '2022-12-12', 'Open', 'Low'),
(50, 48, 'Outage', 'Unexpected server reboot.', '2023-02-16', 'Closed', 'High');

# --------------------------------------------------------------------------------------------------------------------------------

#  Retreive the Data from the Table :
# ------------------------------------

SELECT * FROM SupportTickets;

# --------------------------------------------------------------------------------------------------------------------------------