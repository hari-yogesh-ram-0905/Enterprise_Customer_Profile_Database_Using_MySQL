# ----------------------------------------------------------------------------------------------------------------------------

#                                        Step - 1  :  ( Import the required libraries )

# ----------------------------------------------------------------------------------------------------------------------------


import streamlit as st       #  Used to build interactive web apps in Python easily.

import mysql.connector       #  Used to connect and interact with a MySQL database from Python.

import pandas as pd          #  Used to handle, analyze, and manipulate tabular data efficiently.


# ----------------------------------------------------------------------------------------------------------------------------

#                                            Step - 2  :  ( Streamlit Config )

# ----------------------------------------------------------------------------------------------------------------------------


st.set_page_config(page_title="Enterprise Customer Profile Database", layout="wide")


# Global styles :
# -----------------

st.markdown(

    """
    <style>
    body { background-color: #f0f2f6; }
    button[kind="primary"] {
        border-radius: 8px;
        font-weight: bold;
    }
    h1,h2,h3,h4 {
        font-family: Arial, Helvetica, sans-serif;
    }
    </style>
    """,
    unsafe_allow_html=True

)

# Elegant centered page title :
# -----------------------------

st.markdown(

    """
    <h1 style="
        text-align:center;
        color:#2E3A59;
        font-family: Arial, Helvetica, sans-serif;
        font-weight:700;
        font-size: 40px;
        margin-top: 10px;
        margin-bottom: 20px;
    ">
    🚀 Enterprise Customer Profile Database
    </h1>
    """,
    unsafe_allow_html=True

)


# ----------------------------------------------------------------------------------------------------------------------------

#                                          Step - 3  :   ( Database Connection )

# ----------------------------------------------------------------------------------------------------------------------------


def get_connection():

    return mysql.connector.connect(

        host="localhost",
        user="root",
        password="Sharma@45177",  #   < update your MySQL database password here >
        database="ECPD"
    )


# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 4  :  ( Tabs )

# ----------------------------------------------------------------------------------------------------------------------------


tab1, tab2, tab3, tab4, tab5 = st.tabs([

    "📊 Project Overview",
    "📂 Table Explorer",
    "🔎 Table Records & Query Runner",
    "📝 Topic-wise Query Runner",
    "🏁 Final Overview"

])


# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 5  :  ( Tab -> 1 )

# ----------------------------------------------------------------------------------------------------------------------------



with tab1:  # ( Project Overview )

    st.markdown(

        """
        <div style="background-color:#E1F5FE; padding:20px; border-radius:12px;">
        <h2 style="
            color:#01579B;
            text-align:center;
            font-weight:700;
            font-size:28px;">
            📊 Project Overview
        </h2>
        <p style="font-size:17px;line-height:1.7;">
        The <b>Enterprise Customer Profile Database (ECPD)</b> Helps manage
        <span style="color:#D84315;font-weight:bold;">customers</span>, contacts,
        product subscriptions, contracts, and support tickets.
        It ensures <b>data consistency</b> and supports efficient
        <span style="background-color:#FFF176;padding:2px 4px;border-radius:4px;">
        customer relationship management
        </span>.
        </p>
        </div>
        """,
        unsafe_allow_html=True

    )

    st.markdown(

        """
        <div style="background-color:#FFF3E0; padding:20px; border-radius:10px;">
        <h3 style="color:#E65100;">📌 Why we need these 5 Tables?</h3>
        <ul style="font-size:16px; line-height:1.8;">
        <li><b>Customers</b>: Stores key details like name, region, and registration, acting as the central entity.<br>
        Links to other tables like contacts, contracts, and tickets for complete profile management.</li>

        <li><b>Contacts</b>: Holds details of individuals related to each customer for communication.<br>
        Helps identify points of contact like admins or managers for coordination and service.</li>

        <li><b>Contracts</b>: Captures agreement terms between the customer and company.<br>
        Includes start/end dates, contract value, and billing commitments to manage obligations.</li>

        <li><b>ProductsSubscribed</b>: Tracks all active subscriptions for each customer.<br>
        Useful for analyzing usage, billing, and eligibility for services or support.</li>

        <li><b>SupportTickets</b>: Logs customer issues and support interactions.<br>
        Enables tracking issue history, resolutions, and SLA performance for better service.</li>
        </ul>
        </div>
        """,
        unsafe_allow_html=True

    )

    st.markdown(

        """
        <div style="background-color:#E8F5E9; padding:20px; border-radius:10px;">
        <h3 style="color:#2E7D32;">🗂️ Database & Tables</h3>
        <p style="font-size:16px;">
        <b>Database Name:</b> <span style="color:#4A148C;">ECPD</span><br>
        <b>Tables:</b><br>
        • Customers<br>
        • Contacts<br>
        • Contracts<br>
        • ProductsSubscribed<br>
        • SupportTickets
        </p>
        </div>
        """,
        unsafe_allow_html=True

    )


# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 6  :  ( Tab -> 2 )

# ----------------------------------------------------------------------------------------------------------------------------


with tab2:      #  ( Table name with Column Definition )

    st.markdown(

        """
        <div style="background-color:#F3E5F5; padding:20px; border-radius:12px;">
        <h2 style="
            color:#6A1B9A;
            text-align:center;
            font-weight:700;
            font-size:28px;">
            📂 Table Name with Column Definition
        </h2>
        <p style="font-size:16px;line-height:1.7; text-align:center;">
        Click a table below to see a
        <b style="color:#D84315;">detailed explanation</b> of its structure
        and <span style="background-color:#FFF176; border-radius:4px; padding:2px 4px;">
        business purpose</span>.
        </p>
        </div>
        """,
        unsafe_allow_html=True

    )


    st.markdown("<br>", unsafe_allow_html=True)


    if st.button("📋 Customers"):

        st.markdown("""
        <div style="background-color:#E0F7FA; padding:20px; border-radius:12px;">
        <h3 style="color:#00707A;">🟢 Customers Table</h3>
        <ul>
        <b>Purpose:</b> Stores the profile of every customer for <b style="color:#D84315;">marketing, billing, and relationship management</b>.<br><br>
        <b style="color:#4A148C;">Columns and Explanation:</b><br><br>
        • <b>CustomerID</b> (INT, PK, AUTO_INCREMENT): Unique numeric identifier for each customer.<br>
        &emsp;<i>Helps uniquely identify the customer record.</i><br><br>
        • <b>CustomerName</b> (VARCHAR 55, NOT NULL): Official name of the customer.<br>
        &emsp;<i>Used in documents and billing.</i><br><br>
        • <b>CustomerType</b> (ENUM: Enterprise, SMB, Startup, etc.): Classifies the business nature.<br>
        &emsp;<i>Important for segment-based marketing.</i><br><br>
        • <b>Industry</b> (VARCHAR 255, NOT NULL): Industry sector.<br>
        &emsp;<i>Useful for analytics and segmentation.</i><br><br>
        • <b>Country</b> (VARCHAR 50, NOT NULL): Country of the customer.<br>
        &emsp;<i>Used for regulatory and compliance checks.</i><br><br>
        • <b>ContactEmail</b> (VARCHAR 255, UNIQUE, NOT NULL): Main contact email.<br>
        &emsp;<i>Serves as a unique digital identifier.</i><br><br>
        • <b>IsActive</b> (ENUM Yes/No): Whether the customer is active.<br>
        &emsp;<i>Used to enable or disable accounts.</i><br>
        </ul>
        </div>
        """, unsafe_allow_html=True)


    if st.button("👤 Contacts"):

        st.markdown("""
        <div style="background-color:#FFFDE7; padding:20px; border-radius:12px;">
        <h3 style="color:#BF360C;">🟢 Contacts Table</h3>
        <p><b>Purpose:</b> Contains contact person details for each customer.</p>
        <ul>
        • <b>ContactID</b> (INT, PK): Unique contact record ID.<br>
        &emsp;<i>Used to identify each contact person.</i><br><br>
        • <b>CustomerID</b> (INT, FK): Linked to Customers.<br>
        &emsp;<i>Enforces relation between contact and customer.</i><br><br>
        • <b>FullName</b> (VARCHAR, NOT NULL): Person’s full name.<br>
        &emsp;<i>Identifies the individual person.</i><br><br>
        • <b>Position</b> (VARCHAR, NOT NULL): Designation of the contact person.<br>
        &emsp;<i>Useful for hierarchy and addressing communications.</i><br><br>
        • <b>PhoneNumber</b> (VARCHAR, UNIQUE): Contact number.<br>
        &emsp;<i>Used for phone conversations.</i><br><br>
        • <b>Email</b> (VARCHAR, UNIQUE, NOT NULL): Email of the contact.<br>
        &emsp;<i>For electronic communication.</i><br><br>
        • <b>PreferredContactMethod</b> (ENUM Email, Phone, In-Person): Preferred way to communicate.<br>
        &emsp;<i>Helps optimize contact reach-out methods.</i><br>
        </ul>
        </div>
        """, unsafe_allow_html=True)


    if st.button("📄 Contracts"):

        st.markdown("""
        <div style="background-color:#E3F2FD; padding:20px; border-radius:12px;">
        <h3 style="color:#0D47A1;">🟢 Contracts Table</h3>
        <p><b>Purpose:</b> Stores contract agreements for each customer.</p>
        <ul>
        • <b>ContractID</b> (INT, PK): Unique contract identifier.<br>
        &emsp;<i>Ensures unique contract tracking.</i><br><br>
        • <b>CustomerID</b> (INT, FK): Links to the Customers table.<br>
        &emsp;<i>Allows connecting the contract to a customer profile.</i><br><br>
        • <b>ContractStartDate</b> (DATE, NOT NULL): Start date of the contract.<br>
        &emsp;<i>Establishes validity period from.</i><br><br>
        • <b>ContractEndDate</b> (DATE, NOT NULL): End date of the contract.<br>
        &emsp;<i>Establishes validity period to.</i><br><br>
        • <b>ContractValue</b> (DECIMAL, CHECK >0): Contract price.<br>
        &emsp;<i>Revenue from the agreement.</i><br><br>
        • <b>ContractType</b> (ENUM Annual, Quarterly, Bi-Annual): Frequency of agreement.<br>
        &emsp;<i>Helps with billing and renewals.</i><br><br>
        • <b>Status</b> (ENUM Active, Expired, Terminated): Status of the contract.<br>
        &emsp;<i>Tracks contract lifecycle.</i><br>
        </ul>
        </div>
        """, unsafe_allow_html=True)


    if st.button("🛠️ ProductsSubscribed"):

        st.markdown("""
        <div style="background-color:#FCE4EC; padding:20px; border-radius:12px;">
        <h3 style="color:#880E4F;">🟢 ProductsSubscribed Table</h3>
        <p><b>Purpose:</b> Stores product subscription details per customer.</p>
        <ul>
        • <b>SubscriptionID</b> (INT, PK): Unique ID of the subscription.<br>
        &emsp;<i>Allows identification of the subscription record.</i><br><br>
        • <b>CustomerID</b> (INT, FK): Links to Customers.<br>
        &emsp;<i>Connects subscription with customer details.</i><br><br>
        • <b>ProductName</b> (ENUM: CRM, ERP, Analytics, etc.): Which product is subscribed.<br>
        &emsp;<i>Helps track product-level utilization.</i><br><br>
        • <b>SubscriptionDate</b> (DATE, NOT NULL): Start date of the subscription.<br>
        &emsp;<i>Tracks billing start.</i><br><br>
        • <b>RenewalDate</b> (DATE, NOT NULL): When to renew.<br>
        &emsp;<i>Automates renewal alerts.</i><br><br>
        • <b>SubscriptionValue</b> (DECIMAL, >0): Value of the subscription.<br>
        &emsp;<i>Billing and revenue management.</i><br><br>
        • <b>IsAutoRenewed</b> (ENUM Yes/No): If the subscription auto-renews.<br>
        &emsp;<i>Helps plan renewals in advance.</i><br>
        </ul>
        </div>
        """, unsafe_allow_html=True)


    if st.button("🎫 SupportTickets"):

        st.markdown("""
        <div style="background-color:#FFF8E1; padding:20px; border-radius:12px;">
        <h3 style="color:#F57F17;">🟢 SupportTickets Table</h3>
        <p><b>Purpose:</b> Tracks customer support issues and status.</p>
        <ul>
        • <b>TicketID</b> (INT, PK): Unique ticket identifier.<br>
        &emsp;<i>Enables tracking each issue individually.</i><br><br>
        • <b>CustomerID</b> (INT, FK): References the customer.<br>
        &emsp;<i>Connects the issue to the customer profile.</i><br><br>
        • <b>IssueCategory</b> (ENUM: Login, Performance, Billing, etc.): Type of issue.<br>
        &emsp;<i>Helps categorize problems for prioritization.</i><br><br>
        • <b>IssueDescription</b> (TEXT, NOT NULL): Explanation of the issue.<br>
        &emsp;<i>Gives agents details to troubleshoot.</i><br><br>
        • <b>DateLogged</b> (DATE, NOT NULL): When the issue was created.<br>
        &emsp;<i>Used for SLA tracking.</i><br><br>
        • <b>Status</b> (ENUM Open, Closed, In Progress): Status of resolution.<br>
        &emsp;<i>Tracks progress.</i><br><br>
        • <b>Priority</b> (ENUM Low, Medium, High): Business urgency.<br>
        &emsp;<i>Used for prioritizing support queues.</i><br>
        </ul>
        </div>
        """, unsafe_allow_html=True)


# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 7  :  ( Tab -> 3 )

# ----------------------------------------------------------------------------------------------------------------------------


with tab3:       # ( Show table Records & Custom Query Runner )

    st.markdown(

        """
        <div style="background-color:#E0F2F1; padding:20px; border-radius:12px;">
        <h2 style="
            color:#00695C;
            text-align:center;
            font-weight:700;
            font-size:28px;">
            🔎 Show Table Records & Custom Query Runner
        </h2>
        <p style="font-size:16px;text-align:center;">
        Click buttons below to view all records, or run custom SQL queries.
        </p>
        </div>
        """,
        unsafe_allow_html=True

    )


    st.markdown("<br>", unsafe_allow_html=True)


    # table buttons :
    # ---------------

    btn1 = st.button("Show Customers Table", key="btn1")
    btn2 = st.button("Show Contacts Table", key="btn2")
    btn3 = st.button("Show Contracts Table", key="btn3")
    btn4 = st.button("Show ProductsSubscribed Table", key="btn4")
    btn5 = st.button("Show SupportTickets Table", key="btn5")

    query_results = None


    if btn1:

        with get_connection() as conn:

            df = pd.read_sql("SELECT * FROM Customers", conn)

            st.dataframe(df, use_container_width=True)


    if btn2:

        with get_connection() as conn:

            df = pd.read_sql("SELECT * FROM Contacts", conn)

            st.dataframe(df, use_container_width=True)


    if btn3:

        with get_connection() as conn:

            df = pd.read_sql("SELECT * FROM Contracts", conn)

            st.dataframe(df, use_container_width=True)


    if btn4:

        with get_connection() as conn:

            df = pd.read_sql("SELECT * FROM ProductsSubscribed", conn)

            st.dataframe(df, use_container_width=True)


    if btn5:

        with get_connection() as conn:

            df = pd.read_sql("SELECT * FROM SupportTickets", conn)

            st.dataframe(df, use_container_width=True)



    st.subheader("💻 Run Custom SQL Query", divider="rainbow")

    custom_query = st.text_area("Enter your SQL query here:", height=150)


    if st.button("Run Custom Query"):

        if custom_query.strip():

            try:

                with get_connection() as conn:

                    if custom_query.strip().lower().startswith("select"):

                        df = pd.read_sql(custom_query, conn)

                        st.dataframe(df, use_container_width=True)


                    else:

                        with conn.cursor() as cursor:

                            cursor.execute(custom_query)

                            conn.commit()

                            st.success("Non-select query executed successfully.")


            except Exception as e:

                st.error(f"Error: {e}")


        else:

            st.warning("Please enter a SQL query.")


# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 8  :  ( Tab -> 4 )

# ----------------------------------------------------------------------------------------------------------------------------


with tab4:

    st.markdown(

        """
        <div style="background-color:#FFFDE7; padding:20px; border-radius:12px;">
        <h2 style="
            color:#F57F17;
            text-align:center;
            font-weight:700;
            font-size:28px;">
            📝 Topic-wise SQL Query Runner
        </h2>
        <p style="font-size:16px; text-align:center;">
        Click a topic button below to see ready-made queries for that topic. Select a query to run and view results instantly.
        </p>
        </div>
        """,
        unsafe_allow_html=True

    )


    st.markdown("<br>", unsafe_allow_html=True)


    # create a dictionary : ( topic explanations ) :
    # -----------------------------------------------

    topic_explanations = {

        "Topic 1: WHERE": {

            "definition": "The WHERE clause filters records that fulfill a specified condition.",
            "uses": "Used to filter rows in SELECT, UPDATE, DELETE statements.",
            "Real-Time Uses": "Commonly used for retrieving only relevant data from large tables."

        },

        "Topic 2: BETWEEN": {

            "definition": "BETWEEN filters data within a specified range of values.",
            "uses": "Used for numeric, date or text ranges.",
            "Real-Time Uses": "Used in financial, date-based or ranking queries."

        },

        "Topic 3: AND": {

            "definition": "AND combines multiple conditions that all must be true.",
            "uses": "Used to filter rows matching multiple criteria together.",
            "Real-Time Uses": "In business rules or multi-factor filters."

        },

        "Topic 4: OR": {

            "definition": "OR combines conditions where at least one must be true.",
            "uses": "Used to broaden filtering conditions.",
            "Real-Time Uses": "When you need multiple alternative options to be matched."

        },

        "Topic 5: NOT / != / <>": {

            "definition": "Negation operators filter records not meeting a condition.",
            "uses": "Used to exclude unwanted rows.",
            "Real-Time Uses": "In data cleaning or exception reporting."

        },

        "Topic 6: IN": {

            "definition": "IN matches a column against multiple possible values.",
            "uses": "Simplifies OR conditions.",
            "Real-Time Uses": "Useful in dashboards, selections, categories."

        },

        "Topic 7: NOT IN": {

            "definition": "NOT IN excludes a set of listed values.",
            "uses": "Filters out multiple unwanted values at once.",
            "Real-Time Uses": "Validations or blacklisting."

        },

        "Topic 8: LIKE": {

            "definition": "LIKE allows pattern-based filtering using wildcards.",
            "uses": "Text searching, partial matching.",
            "Real-Time Uses": "Search bars, auto-suggest, name matching."

        },

        "Topic 9: LIMIT": {

            "definition": "LIMIT restricts the number of returned rows.",
            "uses": "Pagination, previews, sample data.",
            "Real-Time Uses": "Large datasets or dashboards."

        },

        "Topic 10: OFFSET": {

            "definition": "OFFSET skips a specified number of rows before returning results.",
            "uses": "Combines with LIMIT for paging.",
            "Real-Time Uses": "Web applications with paged results."

        },

        "Topic 11: DISTINCT": {

            "definition": "DISTINCT returns only unique (non-duplicate) values.",
            "uses": "Removes duplicates from results.",
            "Real-Time Uses": "Unique reporting, summarized listings."

        },

        "Topic 12: ORDER BY": {

            "definition": "ORDER BY sorts results ascending or descending.",
            "uses": "Ordering results for user presentation.",
            "Real-Time Uses": "Reports, user interfaces, leaderboards."

        },

        "Topic 13: GROUP BY": {

            "definition": "GROUP BY groups rows sharing the same value for aggregation.",
            "uses": "Summarizing data with aggregate functions.",
            "Real-Time Uses": "Dashboards, KPIs, reports."

        },

        "Topic 14: HAVING": {

            "definition": "HAVING filters results after GROUP BY aggregations.",
            "uses": "Apply filters on aggregated results.",
            "Real-Time Uses": "Group-level reporting, advanced analytics."

        },

        "Topic 15: AGGREGATE Functions": {

            "definition": "Aggregates summarize many rows to a single value.",
            "uses": "Calculates sum, average, min, max, count, etc.",
            "Real-Time Uses": "Financials, totals, averages, summaries."

        },

        "Topic 16: DATE Functions": {

            "definition": "DATE functions manipulate or extract date/time values.",
            "uses": "Adjust dates, calculate periods, extract parts.",
            "Real-Time Uses": "Schedules, renewals, membership systems."

        },

        "Topic 17: VIEWS": {

            "definition": "Views are virtual tables based on SQL queries.",
            "uses": "Simplifies complex logic, security, reusable queries.",
            "Real-Time Uses": "Business layers, data abstraction, reporting."

        },

        "Topic 18: STORED PROCEDURES": {

            "definition": "Stored procedures are reusable SQL routines on the server.",
            "uses": "Encapsulate logic, boost performance, reduce code duplication.",
            "Real-Time Uses": "Complex business logic, multi-statement operations."

        },

        "Topic 19: JOINS": {

            "definition": "JOINS combine rows from two or more tables based on related columns between them.",
            "uses": "Retrieve related data from multiple tables in a single query.",
            "Real-Time Uses": "Whenever data relationships exist between multiple tables in a relational database."

        },

        "Topic 20: CASE Statements or Expressions": {

            "definition": "CASE is a conditional expression in SQL that returns specific values based on conditions, similar to if-else logic.",
            "uses": "Used to perform conditional logic inside SQL queries, especially to transform data or derive new columns.",
            "Real-Time Uses": "Useful for categorizing data, flagging conditions, creating dynamic columns, or building decision logic directly into SQL SELECT, WHERE, ORDER BY, and other clauses."

        }


    }



    # Create a Dictionary : ( To Retrieve "Topic-Wise" Questions, Query & Output Results )
    # -------------------------------------------------------------------------------------

    topics = {

    "Topic 1: WHERE": [
        ("Customers in India", "SELECT CustomerName, Country FROM Customers WHERE Country = 'India'"),
        ("Contacts preferring phone contact", "SELECT FullName, PreferredContactMethod FROM Contacts WHERE PreferredContactMethod = 'Phone'"),
        ("Active contracts", "SELECT ContractID, ContractType, Status FROM Contracts WHERE Status = 'Active'"),
        ("Products with auto-renew enabled", "SELECT SubscriptionID, ProductName FROM ProductsSubscribed WHERE IsAutoRenewed = 'Yes'"),
        ("Open high priority support tickets", "SELECT TicketID, IssueCategory, IssueDescription FROM SupportTickets WHERE Status = 'Open' AND Priority = 'High'")
    ],

    "Topic 2: BETWEEN": [
        ("Customers with IDs between 10 and 20", "SELECT CustomerID, CustomerName FROM Customers WHERE CustomerID BETWEEN 10 AND 20"),
        ("Contacts with ContactID between 5 and 15", "SELECT ContactID, FullName FROM Contacts WHERE ContactID BETWEEN 5 AND 15"),
        ("Contracts valued between 100000 and 300000", "SELECT ContractID, ContractValue FROM Contracts WHERE ContractValue BETWEEN 100000 AND 300000"),
        ("ProductsSubscribed between 2022-01-01 and 2022-12-31", "SELECT SubscriptionID, SubscriptionDate FROM ProductsSubscribed WHERE SubscriptionDate BETWEEN '2022-01-01' AND '2022-12-31'"),
        ("Support tickets logged between 2023-01-01 and 2023-06-30", "SELECT TicketID, DateLogged FROM SupportTickets WHERE DateLogged BETWEEN '2023-01-01' AND '2023-06-30'")
    ],

    "Topic 3: AND": [
        ("Active customers in India", "SELECT CustomerName FROM Customers WHERE Country = 'India' AND IsActive = 'Yes'"),
        ("Contacts who prefer email AND have phone numbers", "SELECT FullName, PhoneNumber FROM Contacts WHERE PreferredContactMethod = 'Email' AND PhoneNumber IS NOT NULL"),
        ("Active annual contracts", "SELECT ContractID, ContractValue FROM Contracts WHERE Status = 'Active' AND ContractType = 'Annual'"),
        ("Auto-renewed CRM subscriptions", "SELECT SubscriptionID FROM ProductsSubscribed WHERE ProductName = 'CRM' AND IsAutoRenewed = 'Yes'"),
        ("Open and high priority support tickets", "SELECT TicketID, IssueCategory, IssueDescription FROM SupportTickets WHERE Status = 'Open' AND Priority = 'High'")
    ],

    "Topic 4: OR": [
        ("Customers from India or USA", "SELECT CustomerName, Country FROM Customers WHERE Country = 'India' OR Country = 'USA'"),
        ("Contacts preferring phone OR in-person", "SELECT FullName, PreferredContactMethod FROM Contacts WHERE PreferredContactMethod = 'Phone' OR PreferredContactMethod = 'In-Person'"),
        ("Contracts active OR expired", "SELECT ContractID, Contractvalue, Status FROM Contracts WHERE Status = 'Active' OR Status = 'Expired'"),
        ("Products of type ERP OR Analytics", "SELECT SubscriptionID, ProductName FROM ProductsSubscribed WHERE ProductName = 'ERP' OR ProductName = 'Analytics'"),
        ("Support tickets with priority High OR Medium", "SELECT TicketID, IssueCategory, IssueDescription, Priority FROM SupportTickets WHERE Priority = 'High' OR Priority = 'Medium'")
    ],

    "Topic 5: NOT / != / <>": [
        ("Customers not from India", "SELECT CustomerName, Country FROM Customers WHERE Country <> 'India'"),
        ("Contacts not preferring In-Person", "SELECT FullName, PreferredContactMethod FROM Contacts WHERE PreferredContactMethod != 'In-Person'"),
        ("Contracts not Active and not Expired", "SELECT ContractID, ContractValue, Status FROM Contracts WHERE Status <> 'Active' AND Status <> 'Expired'"),
        ("Products not auto-renewed", "SELECT SubscriptionID, ProductName FROM ProductsSubscribed WHERE IsAutoRenewed <> 'Yes'"),
        ("Support tickets not Closed", "SELECT TicketID, IssueCategory, IssueDescription, Status FROM SupportTickets WHERE Status != 'Closed'")
    ],

    "Topic 6: IN": [
        ("Customers from India, USA, or UK", "SELECT CustomerName, Country FROM Customers WHERE Country IN ('India', 'USA', 'UK')"),
        ("Contacts preferring Phone or Email", "SELECT FullName, PreferredContactMethod FROM Contacts WHERE PreferredContactMethod IN ('Phone', 'Email')"),
        ("Contracts with statuses Active or Pending", "SELECT ContractID, Status FROM Contracts WHERE Status IN ('Active', 'Pending')"),
        ("Subscriptions for CRM or ERP", "SELECT SubscriptionID, ProductName FROM ProductsSubscribed WHERE ProductName IN ('CRM', 'ERP')"),
        ("Support tickets with priorities High or Medium", "SELECT TicketID, IssueCategory, IssueDescription, Priority FROM SupportTickets WHERE Priority IN ('High', 'Medium')")
    ],

    "Topic 7: NOT IN": [
        ("Customers not from India or USA", "SELECT CustomerName, Country FROM Customers WHERE Country NOT IN ('India', 'USA')"),
        ("Contacts not preferring Phone or Email", "SELECT FullName, PreferredContactMethod FROM Contacts WHERE PreferredContactMethod NOT IN ('Phone', 'Email')"),
        ("Contracts not Active or Pending", "SELECT ContractID, Status FROM Contracts WHERE Status NOT IN ('Active', 'Pending')"),
        ("Products not CRM or ERP", "SELECT SubscriptionID, ProductName FROM ProductsSubscribed WHERE ProductName NOT IN ('CRM', 'ERP')"),
        ("Support tickets not High or Medium priority", "SELECT TicketID, IssueCategory, IssueDescription, Priority FROM SupportTickets WHERE Priority NOT IN ('High', 'Medium')")
    ],

    "Topic 8: LIKE": [
        ("Customers whose name starts with F", "SELECT CustomerName, Country FROM Customers WHERE CustomerName LIKE 'F%'"),
        ("Contacts whose name ends with ar", "SELECT FullName FROM Contacts WHERE FullName LIKE '%ar'"),
        ("Contracts whose ContractType contains Annual", "SELECT ContractID, ContractType, Status FROM Contracts WHERE ContractType LIKE '%Annual%'"),
        ("Products whose name ends with s", "SELECT SubscriptionID, ProductName FROM ProductsSubscribed WHERE ProductName LIKE '%s'"),
        ("Support ticket issue category 2nd letter e", "SELECT TicketID, IssueCategory FROM SupportTickets WHERE IssueCategory LIKE '_e%'")
    ],

    "Topic 9: LIMIT": [
        ("First 5 customers", "SELECT * FROM Customers LIMIT 5"),
        ("First 10 contacts", "SELECT * FROM Contacts LIMIT 10"),
        ("First 3 contracts", "SELECT * FROM Contracts LIMIT 3"),
        ("First 5 product subscriptions", "SELECT * FROM ProductsSubscribed LIMIT 5"),
        ("First 7 support tickets", "SELECT * FROM SupportTickets LIMIT 7")
    ],

    "Topic 10: OFFSET": [
        ("Show 5 customers skipping first 5", "SELECT * FROM Customers ORDER BY CustomerID LIMIT 5 OFFSET 5"),
        ("Get contacts skip first 10 next 5", "SELECT * FROM Contacts ORDER BY ContactID LIMIT 5 OFFSET 10"),
        ("List contracts skip first 2 next 3", "SELECT * FROM Contracts ORDER BY ContractID LIMIT 3 OFFSET 2"),
        ("Show 10 products skip first 20", "SELECT * FROM ProductsSubscribed ORDER BY SubscriptionID LIMIT 10 OFFSET 20"),
        ("Get support tickets skip first 15", "SELECT * FROM SupportTickets ORDER BY TicketID LIMIT 10 OFFSET 15")
    ],

    "Topic 11: DISTINCT": [
        ("List unique customer countries", "SELECT DISTINCT Country FROM Customers"),
        ("Unique preferred contact methods", "SELECT DISTINCT PreferredContactMethod FROM Contacts"),
        ("Distinct contract types", "SELECT DISTINCT ContractType FROM Contracts"),
        ("Distinct product names", "SELECT DISTINCT ProductName FROM ProductsSubscribed"),
        ("Distinct ticket priorities", "SELECT DISTINCT Priority FROM SupportTickets")
    ],

    "Topic 12: ORDER BY": [
        ("Customers ordered by name ascending", "SELECT CustomerID, CustomerName FROM Customers ORDER BY CustomerName ASC"),
        ("Contacts ordered by FullName descending", "SELECT ContactID, FullName FROM Contacts ORDER BY FullName DESC"),
        ("Contracts ordered by ContractValue descending", "SELECT ContractID, ContractValue FROM Contracts ORDER BY ContractValue DESC"),
        ("Products ordered by SubscriptionDate ascending", "SELECT SubscriptionID, SubscriptionDate FROM ProductsSubscribed ORDER BY SubscriptionDate ASC"),
        ("Support tickets ordered by DateLogged descending", "SELECT TicketID, DateLogged FROM SupportTickets ORDER BY DateLogged DESC")
    ],

    "Topic 13: GROUP BY": [
        ("Count customers per country", "SELECT Country, COUNT(*) AS TotalCustomers FROM Customers GROUP BY Country"),
        ("Count contacts by preferred method", "SELECT PreferredContactMethod, COUNT(*) AS TotalContacts FROM Contacts GROUP BY PreferredContactMethod"),
        ("Total contract value per type", "SELECT ContractType, SUM(ContractValue) AS TotalValue FROM Contracts GROUP BY ContractType"),
        ("Subscriptions per product", "SELECT ProductName, COUNT(*) AS SubscriptionCount FROM ProductsSubscribed GROUP BY ProductName"),
        ("Tickets count per priority", "SELECT Priority, COUNT(*) AS TicketCount FROM SupportTickets GROUP BY Priority")
    ],

    "Topic 14: HAVING": [
        ("Countries with less than 10 customers", "SELECT Country, COUNT(*) AS TotalCustomers FROM Customers GROUP BY Country HAVING COUNT(*) < 10"),
        ("Contact methods with more than 15 contacts", "SELECT PreferredContactMethod, COUNT(*) AS ContactCount FROM Contacts GROUP BY PreferredContactMethod HAVING COUNT(*) > 15"),
        ("Contract types with total value below 5 million", "SELECT ContractType, SUM(ContractValue) AS TotalValue FROM Contracts GROUP BY ContractType HAVING SUM(ContractValue) < 5000000"),
        ("Products with more than 7 subscriptions", "SELECT ProductName, COUNT(*) AS SubscriptionCount FROM ProductsSubscribed GROUP BY ProductName HAVING COUNT(*) > 7"),
        ("Ticket priorities with less than or equal to 15 tickets", "SELECT Priority, COUNT(*) AS TicketCount FROM SupportTickets GROUP BY Priority HAVING COUNT(*) <= 15")
    ],

    "Topic 15: AGGREGATE Functions": [
        ("Total number of customers", "SELECT COUNT(*) AS TotalCustomers FROM Customers"),
        ("Average contract value", "SELECT AVG(ContractValue) AS AvgContractValue FROM Contracts"),
        ("Maximum contract value", "SELECT MAX(ContractValue) AS MaxContractValue FROM Contracts"),
        ("Minimum contract value", "SELECT MIN(ContractValue) AS MinContractValue FROM Contracts"),
        ("Total contract value", "SELECT SUM(ContractValue) AS TotalContractValue FROM Contracts")
    ],

    "Topic 16: DATE Functions": [
        ("Extend a contract end date by 30 days", "SELECT ContractID, ContractEndDate, DATE_ADD(ContractEndDate, INTERVAL 30 DAY) AS ExtendedEndDate FROM Contracts"),
        ("Warranty expiry by adding 2 years", "SELECT SubscriptionID, ProductName, SubscriptionDate, DATE_ADD(SubscriptionDate, INTERVAL 2 YEAR) AS WarrantyExpiry FROM ProductsSubscribed"),
        ("Membership started 2 months ago", "SELECT CustomerID, CustomerName, DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AS TwoMonthsAgo FROM Customers"),
        ("Number of days between contract start and end", "SELECT ContractID, ContractStartDate, ContractEndDate, DATEDIFF(ContractEndDate, ContractStartDate) AS Contracted_Days_In_Numbers FROM Contracts"),
        ("Extract year/month/day from subscription", "SELECT SubscriptionID, ProductName, SubscriptionDate, EXTRACT(YEAR FROM SubscriptionDate) AS SubscriptionYear, EXTRACT(MONTH FROM SubscriptionDate) AS SubscriptionMonth, EXTRACT(DAY FROM SubscriptionDate) AS SubscriptionDay FROM ProductsSubscribed")
    ],

    "Topic 17: VIEWS": [
        ("View active customers", "SELECT * FROM ActiveCustomers"),
        ("View contracts < 1 lakh", "SELECT * FROM LessThan1LakhsValueContracts"),
        ("View product subscription counts", "SELECT * FROM ProductSubscriptionCount"),
        ("View In Progress tickets", "SELECT * FROM OpenTickets"),
        ("View contacts with gmail", "SELECT * FROM GmailContacts")
    ],

    "Topic 18: STORED PROCEDURES": [
        ("Call: GetCustomersFromIndia", "CALL GetCustomersFromIndia()"),
        ("Call: GetLowValueContracts", "CALL GetLowValueContracts()"),
        ("Call: GetHighPriorityTickets", "CALL GetHighPriorityTickets()"),
        ("Call: ListRecentProducts", "CALL ListRecentProducts()")
    ],

    "Topic 19: JOINS": [

            (
                "Customer names, industry, and contact details",
                """
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
                """
            ),

            (
                "List of all customers and their contracts, even those without contracts",
                """
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
                """
            ),

            (
                "All product subscriptions with corresponding customer details",
                """
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
                """
            ),

            (
                "All customers and their support tickets, even if no tickets raised",
                """
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
                """
            ),

            (
                "Pairs of customers from same country but different industries",
                """
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
                    c1.Country = c2.Country
                    AND c1.Industry <> c2.Industry
                    AND c1.CustomerID < c2.CustomerID;
                """

            )

        ],

    "Topic 20: CASE Statements or Expressions": [
        ("Categorize Customers by Type", 
        """SELECT 
                CustomerID,
                CustomerName,
                CustomerType,
                CASE 
                    WHEN CustomerType = 'Enterprise' THEN 'Large'
                    WHEN CustomerType IN ('SMB', 'Government') THEN 'Medium'
                    ELSE 'Small'
                END AS CustomerSizeCategory
            FROM Customers"""
        ),

        ("Contacts Preferred Communication Flag", 
        """SELECT 
                ContactID,
                FullName,
                PreferredContactMethod,
                CASE 
                    WHEN PreferredContactMethod IN ('Email', 'Phone') THEN 'Remote Friendly'
                    ELSE 'Needs In-Person'
                END AS CommunicationType
            FROM Contacts"""
        ),

        ("Contract Duration Category", 
        """SELECT 
                ContractID,
                ContractStartDate,
                ContractEndDate,
                DATEDIFF(ContractEndDate, ContractStartDate) AS DurationDays,
                CASE 
                    WHEN DATEDIFF(ContractEndDate, ContractStartDate) > 365 THEN 'Long-Term'
                    WHEN DATEDIFF(ContractEndDate, ContractStartDate) BETWEEN 181 AND 365 THEN 'Mid-Term'
                    ELSE 'Short-Term'
                END AS ContractLengthCategory
            FROM Contracts"""
        ),

        ("Auto Renewal Status for Subscriptions", 
        """SELECT 
                SubscriptionID,
                ProductName,
                IsAutoRenewed,
                CASE 
                    WHEN IsAutoRenewed = 'Yes' THEN 'Will Renew'
                    ELSE 'Needs Attention'
                END AS RenewalStatus
            FROM ProductsSubscribed"""
        ),

        ("Ticket Priority Response Plan", 
        """SELECT 
                TicketID,
                IssueCategory,
                Priority,
                CASE 
                    WHEN Priority = 'High' THEN 'Immediate Response Required'
                    WHEN Priority = 'Medium' THEN 'Respond within EOD'
                    ELSE 'Respond within 2 Days'
                END AS ActionPlan
            FROM SupportTickets"""
        )
    ]
}


    cols = st.columns(6)

    topic_list = list(topics.keys())


    for idx, col in enumerate(cols * (len(topic_list)//6 + 1)):


        if idx >= len(topic_list):

            break

        topic_name = topic_list[idx]


        if col.button(topic_name):

            st.session_state['selected_topic'] = topic_name



    selected_topic = st.session_state.get('selected_topic', None)



    if selected_topic:


        exp = topic_explanations[selected_topic]


        st.markdown(

            f"""
            <div style="background-color:#F0F4C3; padding:15px; border-radius:10px;">
            <h3 style="color:#827717; text-align:center;">{selected_topic}</h3>
            <ul style="font-size:16px;">
                <li><b>Definition:</b> {exp['definition']}</li>
                <li><b>Uses:</b> {exp['uses']}</li>
                <li><b>Real Time Uses:</b> {exp['Real-Time Uses']}</li>
            </ul>
            <p style="text-align:center;font-size:16px;">
            Select a question below to run its query and view results with visualization.
            </p>
            </div>
            """,
            unsafe_allow_html=True

        )


        questions = topics[selected_topic]

        question_labels = [q[0] for q in questions]

        selected_question = st.selectbox("Choose a question", ["-- Select --"] + question_labels)


        if selected_question != "-- Select --":

            sql_query = dict(questions)[selected_question]

            st.write(f"**Question**: {selected_question}")

            st.code(sql_query, language="sql")


            try:

                with get_connection() as conn:

                    df = pd.read_sql(sql_query, conn)

                    st.dataframe(df, use_container_width=True)


            except Exception as e:

                st.error(f"Error: {e}")


        st.markdown(

            """
            <div style="background-color:#FFF3E0; padding:10px; border-radius:8px;margin-top:10px;">
            <p style="font-size:14px; color:#BF360C;">
            For other topics, please click their respective buttons above to view more queries.
            </p>
            </div>
            """,
            unsafe_allow_html=True

        )


# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 9  :  ( Tab -> 5 )

# ----------------------------------------------------------------------------------------------------------------------------


with tab5:      #  ( Project Conclusions & Final Results )

    st.markdown(

        """
        <div style="background-color:#FFFDE7; padding:20px; border-radius:12px;">
            <h2 style="
                color:#F57F17;
                text-align:center;
                font-weight:700;
                font-size:28px;">
                ✅ Project Conclusions & Final Results
            </h2>
            <br>
            <h3 style="color:#4E342E; font-size:24px; font-weight:600;">
                📌 Steps Involved in the Project
            </h3>
            <ul style="font-size:18px; color:#3E2723;">
                <li><b>1. Requirement Analysis:</b> Understanding the client’s needs, the required data points, and the business objectives behind creating the customer profile database.</li>
                <li><b>2. Database Design:</b> Building relational schemas for tables such as Customers, ProductsSubscribed, and SupportTickets, applying correct primary and foreign keys, and defining constraints to maintain data integrity.</li>
                <li><b>3. Data Collection:</b> Gathering sample data for customers, product subscriptions, and support tickets to simulate realistic enterprise scenarios.</li>
                <li><b>4. Data Insertion:</b> Populating the database with bulk INSERT statements, ensuring data consistency and respecting validation rules and constraints.</li>
                <li><b>5. Query Development:</b> Writing SQL queries including SELECT, JOINs, aggregate functions, and other techniques to demonstrate how business teams can retrieve actionable insights.</li>
                <li><b>6. Streamlit Integration:</b> Creating an interactive front-end with Streamlit, connecting to the MySQL database using mysql.connector, and providing a user-friendly interface for data exploration.</li>
                <li><b>7. Testing & Debugging:</b> Verifying data correctness, query outputs, and checking error handling for smooth execution of the application.</li>
                <li><b>8. Documentation:</b> Adding proper comments, code explanations, and Streamlit markdown elements to make the project readable and maintainable.</li>
            </ul>
            <br>
            <h3 style="color:#4E342E; font-size:24px; font-weight:600;">
                🚀 Future Enhancements
            </h3>
            <ul style="font-size:18px; color:#3E2723;">
                <li><b>Role-Based Access Control (RBAC):</b> Adding user login with permissions to secure sensitive data.</li>
                <li><b>Advanced Analytics:</b> Integrating Python machine learning models for customer churn prediction and sentiment analysis on support tickets.</li>
                <li><b>Automated Data Pipelines:</b> Scheduling ETL jobs to keep the data warehouse continuously updated in near real time.</li>
                <li><b>Cloud Deployment:</b> Moving the Streamlit app and MySQL to a cloud platform (like AWS or GCP) for scalability and high availability.</li>
                <li><b>Visualization Enhancements:</b> Incorporating advanced charts and dashboards using Plotly or Power BI for richer data storytelling.</li>
            </ul>
            <br>
            <h3 style="color:#4E342E; font-size:24px; font-weight:600;">
                🏁 Final Conclusion
            </h3>
            <p style="font-size:18px; color:#3E2723;">
                This project successfully demonstrates how to build a robust enterprise customer profile database using MySQL, 
                integrate it with a Streamlit front-end, and query data efficiently for business insights. 
                With planned future enhancements, this application has the potential to evolve into a full-fledged, production-ready CRM and analytics platform.
            </p>
        </div>
        """,
        unsafe_allow_html=True

    )

# ----------------------------------------------------------------------------------------------------------------------------

#                                                 Step - 10  :  ( Footer )

# ----------------------------------------------------------------------------------------------------------------------------

st.markdown("---")

st.caption("Developed the Mysql Project (code) by using python modules like pandas, mysql.connector & streamlit")

# ----------------------------------------------------------------------------------------------------------------------------