# --------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE ECPD;         #  ECPD ->  Enterprise Customer Profile Database

# --------------------------------------------------------------------------------------------------------------------------------

USE ECPD;

# --------------------------------------------------------------------------------------------------------------------------------

#  Create the Table : (Contacts)
#  -------------------------------

CREATE TABLE Contacts (

    ContactID INT PRIMARY KEY,
    CustomerID INT,
    FullName VARCHAR(255) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(50) UNIQUE,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PreferredContactMethod VARCHAR(20) CHECK (PreferredContactMethod IN ('Email', 'Phone', 'In-Person')),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    
);

# --------------------------------------------------------------------------------------------------------------------------------

#  Retreive the Data from the Table :
# ------------------------------------

SELECT * FROM Contacts;

# --------------------------------------------------------------------------------------------------------------------------------

#  Insert the data into the table :
# ----------------------------------

INSERT INTO Contacts (ContactID, CustomerID, FullName, Position, PhoneNumber, Email, PreferredContactMethod) VALUES
(1, 12, 'Hari Yogesh Ram', 'Sales Representative', '9345367376', 'hariyogeshram882@gmail.com', 'Phone'),
(2, 7, 'Suresh Babu', 'Software Engineer', '9123456702', 'suresh.babu62@yahoo.in', 'Email'),
(3, 4, 'Ravi Shankar', 'Project Manager', '9123456703', 'ravi.shankar39@gmail.com', 'In-Person'),
(4, 18, 'Karthik Raj', 'Data Analyst', '9123456704', 'karthik.raj88@yahoo.in', 'Phone'),
(5, 26, 'Manoj Kumar', 'Marketing Manager', '9123456705', 'manoj.kumar23@gmail.com', 'Email'),
(6, 50, 'Vijay Anand', 'Financial Analyst', '9123456706', 'vijay.anand99@gmail.com', 'Phone'),
(7, 16, 'Dinesh Kumar', 'Business Analyst', '9123456707', 'dinesh.kumar44@yahoo.in', 'In-Person'),
(8, 41, 'Saravanan M', 'HR Specialist', '9123456708', 'saravanan.m17@gmail.com', 'Email'),
(9, 33, 'Ramesh S', 'Operations Manager', '9123456709', 'ramesh.s84@yahoo.in', 'Phone'),
(10, 29, 'Kumaravel P', 'Technical Lead', '9123456710', 'kumaravel.p71@gmail.com', 'In-Person'),
(11, 6, 'Balaji T', 'Support Engineer', '9123456711', 'balaji.t52@yahoo.in', 'Phone'),
(12, 1, 'Rajesh K', 'System Administrator', '9123456712', 'rajesh.k89@gmail.com', 'Email'),
(13, 17, 'Ganesh V', 'Product Owner', '9123456713', 'ganesh.v30@gmail.com', 'Phone'),
(14, 9, 'Prakash R', 'UX Designer', '9123456714', 'prakash.r66@yahoo.in', 'Phone'),
(15, 45, 'Sathish R', 'Account Manager', '9123456715', 'sathish.r10@gmail.com', 'In-Person'),
(16, 25, 'Senthil K', 'DevOps Engineer', '9123456716', 'senthil.k61@yahoo.in', 'Email'),
(17, 13, 'Murugan S', 'Network Engineer', '9123456717', 'murugan.s95@gmail.com', 'Email'),
(18, 31, 'Anand B', 'Recruiter', '9123456718', 'anand.b73@yahoo.in', 'Phone'),
(19, 37, 'Selva M', 'Business Consultant', '9123456719', 'selva.m28@gmail.com', 'In-Person'),
(20, 21, 'Harish R', 'Scrum Master', '9123456720', 'harish.r60@yahoo.in', 'Phone'),
(21, 2, 'Sundar C', 'Database Administrator', '9123456721', 'sundar.c34@gmail.com', 'Email'),
(22, 20, 'Naveen M', 'Frontend Developer', '9123456722', 'naveen.m46@yahoo.in', 'In-Person'),
(23, 38, 'Ragul S', 'Backend Developer', '9123456723', 'ragul.s80@gmail.com', 'Phone'),
(24, 15, 'Ajay K', 'Cloud Architect', '9123456724', 'ajay.k58@yahoo.in', 'Email'),
(25, 19, 'Vignesh R', 'AI Engineer', '9123456725', 'vignesh.r12@gmail.com', 'In-Person'),
(26, 35, 'Santhosh P', 'Machine Learning Engineer', '9123456726', 'santhosh.p91@yahoo.in', 'Email'),
(27, 23, 'Kiran M', 'IT Consultant', '9123456727', 'kiran.m67@gmail.com', 'Phone'),
(28, 3, 'Mohanraj S', 'Tech Support', '9123456728', 'mohanraj.s55@yahoo.in', 'Phone'),
(29, 47, 'Bharath K', 'Mobile Developer', '9123456729', 'bharath.k29@gmail.com', 'In-Person'),
(30, 32, 'Deepak A', 'AI Researcher', '9123456730', 'deepak.a94@yahoo.in', 'Email'),
(31, 44, 'Yuvaraj S', 'BI Developer', '9956997253', 'yuviishaitan@gmail.com', 'Phone'),
(32, 10, 'Arvind M', 'Tester', '9123456732', 'arvind.m85@yahoo.in', 'In-Person'),
(33, 46, 'Prem K', 'Technical Writer', '9123456733', 'prem.k11@gmail.com', 'Email'),
(34, 27, 'Ashok R', 'Compliance Officer', '9123456734', 'ashok.r72@yahoo.in', 'Phone'),
(35, 8, 'Sridhar S', 'Cloud Support Engineer', '9123456735', 'sridhar.s88@gmail.com', 'In-Person'),
(36, 40, 'Priya R', 'Team Lead', '9123456736', 'priya.r90@gmail.com', 'Email'),
(37, 36, 'Anitha S', 'Data Scientist', '9123456737', 'anitha.s48@yahoo.in', 'Phone'),
(38, 11, 'Divya M', 'Quality Analyst', '9123456738', 'divya.m14@gmail.com', 'In-Person'),
(39, 22, 'Kavitha P', 'Project Coordinator', '9123456739', 'kavitha.p61@yahoo.in', 'Phone'),
(40, 43, 'Lakshmi R', 'Solution Architect', '9123456740', 'lakshmi.r23@gmail.com', 'Email'),
(41, 34, 'Revathi K', 'Customer Success Manager', '9123456741', 'revathi.k84@yahoo.in', 'Phone'),
(42, 14, 'Meena S', 'Product Designer', '9123456742', 'meena.s79@gmail.com', 'In-Person'),
(43, 30, 'Sangeetha R', 'Digital Marketer', '9123456743', 'sangeetha.r48@yahoo.in', 'Phone'),
(44, 24, 'Bhuvana M', 'Process Manager', '9123456744', 'bhuvana.m96@gmail.com', 'Email'),
(45, 39, 'Latha K', 'HR Manager', '9123456745', 'latha.k32@yahoo.in', 'Phone'),
(46, 5, 'Karthik', 'Recruitment Lead', '7397182711', 'karthik42@gmail.com', 'In-Person'),
(47, 28, 'Nithya P', 'IT Trainer', '9123456747', 'nithya.p65@yahoo.in', 'Email'),
(48, 42, 'Deepa K', 'Risk Analyst', '9123456748', 'deepa.k77@gmail.com', 'Phone'),
(49, 48, 'Geetha S', 'Business Executive', '9123456749', 'geetha.s29@yahoo.in', 'Phone'),
(50, 49, 'Uma M', 'Technical Recruiter', '9123456750', 'uma.m93@gmail.com', 'In-Person');

# --------------------------------------------------------------------------------------------------------------------------------

#  Retreive the Data from the Table :
# ------------------------------------

SELECT * FROM Contacts;

-- SELECT * FROM Customers;

# --------------------------------------------------------------------------------------------------------------------------------