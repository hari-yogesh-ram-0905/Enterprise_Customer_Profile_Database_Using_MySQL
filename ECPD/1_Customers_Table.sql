# --------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE ECPD;         #  ECPD ->  Enterprise Customer Profile Database

# --------------------------------------------------------------------------------------------------------------------------------

USE ECPD;

# --------------------------------------------------------------------------------------------------------------------------------

#  Create the Table : (Customers)
#  -------------------------------


CREATE TABLE Customers (

    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(55) NOT NULL,
    CustomerType VARCHAR(50) CHECK (CustomerType IN ('Enterprise', 'SMB', 'Startup', 'Government', 'Non-Profit')),
    Industry VARCHAR(255) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    ContactEmail VARCHAR(255) UNIQUE NOT NULL,
    IsActive VARCHAR(3) CHECK (IsActive IN ('Yes', 'No'))
    
);


# --------------------------------------------------------------------------------------------------------------------------------

#  Retreive the Data from the Table :
# ------------------------------------

SELECT * FROM Customers;

# --------------------------------------------------------------------------------------------------------------------------------

#  Insert the data into the table :
# ----------------------------------

INSERT INTO Customers (CustomerName, CustomerType, Industry, Country, ContactEmail, IsActive) VALUES
('TechNova Solutions', 'SMB', 'Technology', 'India', 'contact@technovasolutions.com', 'Yes'),
('FinTrust Corp', 'Enterprise', 'Finance', 'India', 'info@fintrustcorp.com', 'No'),
('MediCore Startups', 'Startup', 'Healthcare', 'USA', 'support@medicorestartups.com', 'Yes'),
('EduGov Services', 'Government', 'Education', 'India', 'info@edugov.in', 'No'),
('HopeMakers Foundation', 'Non-Profit', 'Manufacturing', 'UK', 'hello@hopemakers.org.uk', 'Yes'),
('CapitalRoots Ltd', 'Enterprise', 'Finance', 'India', 'contact@capitalroots.in', 'Yes'),
('NextGen Tech Labs', 'Startup', 'Technology', 'Germany', 'hello@nextgentech.de', 'No'),
('MediPlus Clinics', 'SMB', 'Healthcare', 'India', 'info@mediplusclinics.in', 'Yes'),
('ScholarlyGov India', 'Government', 'Education', 'India', 'support@scholarlygov.in', 'No'),
('OpenTech Foundation', 'Non-Profit', 'Technology', 'USA', 'contact@opentechfoundation.org', 'Yes'),
('Innovate Manufacturing', 'Startup', 'Manufacturing', 'India', 'contact@innovatemfg.in', 'Yes'),
('FutureBridge Pvt Ltd', 'Enterprise', 'Technology', 'India', 'info@futurebridge.in', 'No'),
('SmartLearn UK', 'SMB', 'Education', 'UK', 'hello@smartlearn.co.uk', 'Yes'),
('FinGov India', 'Government', 'Finance', 'India', 'contact@fingov.gov.in', 'Yes'),
('CureCare Startups', 'Startup', 'Healthcare', 'India', 'info@curecare.in', 'No'),
('DigitalScape Inc.', 'Enterprise', 'Technology', 'USA', 'support@digitalscape.com', 'Yes'),
('FinWave Solutions', 'SMB', 'Finance', 'India', 'contact@finwave.in', 'No'),
('GreenEarth Org', 'Non-Profit', 'Manufacturing', 'Germany', 'info@greenearth.org.de', 'Yes'),
('EduVision Bureau', 'Government', 'Education', 'India', 'contact@eduvision.gov.in', 'Yes'),
('HealthNest Startups', 'Startup', 'Healthcare', 'India', 'hello@healthnest.in', 'No'),
('InfoTech Global Ltd', 'Enterprise', 'Technology', 'UK', 'info@infotechglobal.co.uk', 'Yes'),
('MoneySmart SMB', 'SMB', 'Finance', 'India', 'support@moneysmart.in', 'Yes'),
('LearnSpark Inc', 'Startup', 'Education', 'USA', 'info@learnspark.com', 'No'),
('HealthGov Trust', 'Government', 'Healthcare', 'India', 'contact@healthgov.in', 'Yes'),
('SaaSOne Systems', 'Enterprise', 'Technology', 'India', 'support@saasone.in', 'Yes'),
('FinanceCare Trust', 'Non-Profit', 'Finance', 'Germany', 'info@financecaretrust.de', 'No'),
('ManuFact India', 'SMB', 'Manufacturing', 'India', 'hello@manufactindia.in', 'Yes'),
('EduStart India', 'Startup', 'Education', 'India', 'contact@edustart.in', 'No'),
('MediBridge USA', 'Government', 'Healthcare', 'USA', 'support@medibridge.gov.us', 'Yes'),
('CodeCrafters India', 'Enterprise', 'Technology', 'India', 'info@codecrafters.in', 'Yes'),
('SMB ManuMakers', 'SMB', 'Manufacturing', 'India', 'support@manumakers.in', 'No'),
('FinSpark Startups', 'Startup', 'Finance', 'Germany', 'contact@finspark.de', 'Yes'),
('EduGov UK', 'Government', 'Education', 'UK', 'hello@edugov.co.uk', 'No'),
('HealthServe Org', 'Non-Profit', 'Healthcare', 'India', 'info@healthserve.org.in', 'Yes'),
('FinEdge Startups', 'Startup', 'Finance', 'India', 'support@finedge.in', 'Yes'),
('TechSavvy SMB', 'SMB', 'Technology', 'India', 'info@techsavvy.in', 'No'),
('ManuCore Inc.', 'Enterprise', 'Manufacturing', 'USA', 'contact@manucore.com', 'Yes'),
('CareFirst Gov', 'Government', 'Healthcare', 'India', 'care@carefirst.gov.in', 'Yes'),
('EduLearn Germany', 'Startup', 'Education', 'Germany', 'hello@edulearn.de', 'No'),
('WealthBridge Ltd', 'Enterprise', 'Finance', 'India', 'info@wealthbridge.in', 'Yes'),
('ByteWise Ltd', 'SMB', 'Technology', 'UK', 'support@bytewise.co.uk', 'Yes'),
('HealTech Trust', 'Non-Profit', 'Healthcare', 'India', 'contact@healtechtrust.org.in', 'No'),
('GovFinance India', 'Government', 'Finance', 'India', 'gov@financeindia.gov.in', 'Yes'),
('SkyNet Startups', 'Startup', 'Technology', 'USA', 'hello@skynetstartups.com', 'Yes'),
('MediCare GmbH', 'Enterprise', 'Healthcare', 'Germany', 'info@medicare.de', 'No'),
('QuickFunds Startups', 'Startup', 'Finance', 'India', 'support@quickfunds.in', 'Yes'),
('ClassEdge Gov', 'Government', 'Education', 'India', 'info@classedge.gov.in', 'Yes'),
('CodeVerse India', 'SMB', 'Technology', 'India', 'contact@codeverse.in', 'No'),
('TrustFinance UK', 'Enterprise', 'Finance', 'UK', 'info@trustfinance.co.uk', 'Yes'),
('HopeCare USA', 'Non-Profit', 'Healthcare', 'USA', 'hello@hopecare.org', 'Yes');


# --------------------------------------------------------------------------------------------------------------------------------

#  Retreive the Data from the Table :
# ------------------------------------

SELECT * FROM Customers;

# --------------------------------------------------------------------------------------------------------------------------------