
# Enterprise CRM SQL Query Interface Using MySQL & Python Modules

---

## 🧠 Table of Contents

- [📌 Overview](#-overview)
- [🎯 Motivation](#-motivation)
- [🚀 Goals](#-goals)
- [🛠 Tech Stack](#-tech-stack)
- [✨ Features](#-features)
- [📊 Data Description](#-data-description)
- [⚙️ Installation](#️-installation)
- [💡 Usage](#-usage)
- [📈 Results](#-results)
- [🔮 Future Work](#-future-work)
- [📬 Contact](#-contact)

---

## 📌 Overview 

This project is an interactive Streamlit-based web application that connects to a MySQL relational database containing customer relationship data (CRM). The app provides a multi-tab interface where users can:

- Explore database schema and tables,
- Run topic-wise predefined SQL queries,
- View real-time query results with pandas DataFrames,
- Gain instant business insights from customer, subscription, and support ticket data.

---

## 🎯 Motivation

Many organizations rely on CRM systems for managing customers, products, and support workflows. However, accessing and analyzing data from these systems often requires SQL expertise and backend access. This project solves that by:

- Offering a user-friendly front-end for data access.
- Empowering analysts and managers to run ready-made SQL queries by topic and use case.
- Reducing technical dependency for data-driven decision-making.

---

## 🚀 Goals

- Create a modular and scalable CRM data viewer using Streamlit.
- Integrate with a MySQL database to pull real-time data.
- Enable topic-wise SQL learning and execution.
- Build a visually appealing and explanation-rich interface.
- Simulate enterprise-level CRM insights through JOINs, aggregates, CASE logic, and date functions.

---

## 🛠 Tech Stack

| Component              | Description                                     |
|------------------------|-------------------------------------------------|
| Python                 | Core scripting and logic                        |
| Streamlit              | Interactive front-end and UI                   |
| MySQL                  | Backend RDBMS for storing structured CRM data  |
| pandas                 | Data manipulation and tabular visualization    |
| mysql-connector-python | MySQL connector for Python                     |

---

## ✨ Features

- 🔍 **Topic-wise SQL Query Runner:** Choose from 20+ SQL concepts like WHERE, JOIN, GROUP BY, CASE, etc.
- 🗂 **Table Explorer:** Browse table structures and column definitions.
- 📋 **Query Execution with Results Viewer:** Execute predefined queries and explore results directly.
- 📈 **SQL Education-Enhanced UI:** See definitions, usage, and real-world applications of each SQL concept.
- 🧠 **Business Scenario Simulation:** Simulate enterprise operations via CRM datasets.

---

## 📊 Data Description

| Table              | Description                                                           |
|--------------------|-----------------------------------------------------------------------|
| Customers          | Stores customer info like name, country, industry, and type.         |
| Contacts           | Stores contact person details associated with customers.             |
| Contracts          | Maintains contract records including status, value, and duration.    |
| ProductsSubscribed | Records subscriptions to products like CRM, ERP with renewal info.   |
| SupportTickets     | Tracks support issues, categories, status, and priorities.           |

---

## ⚙️ Installation

### Prerequisites:

- Python 3.8+
- MySQL Server
- IDE with Streamlit support (e.g., VSCode)

### Steps:

```bash

# Install required packages
pip install streamlit pandas mysql-connector-python

# Run the Streamlit app
streamlit run your_file_name.py
```
---

🛑 **Important:** Update your MySQL credentials in the `get_connection()` function in `your_file_name.py`.

---

## 💡 Usage

- Start the MySQL server and ensure the ECPD database is active.
- Launch the Streamlit app.
- 
- Navigate between tabs:
  
  - 📊 **Project Overview:** Understand the project goals.
  - 📂 **Table Explorer:** View table structures.
  - 🔎 **Table Records & Query Runner:** Run custom SELECT queries.
  - 📝 **Topic-wise Query Runner:** Explore categorized SQL topics and visualize query outputs.
  - 🏁 **Final Overview:** Read project summary and learnings.

---

## 📈 Results

This application demonstrates:

- Full-stack data flow from MySQL to Streamlit.
- Effective modular design for expanding query sets.
- Clear UI explanations for SQL learners.
- Clean and structured data exploration workflows for enterprise use.

---

## 🔮 Future Work

- 🔐 Role-Based Access Control (RBAC) for user logins and permissions.
- ☁️ Cloud Hosting with AWS RDS and Streamlit Cloud/GCP.
- 📊 Advanced Visualizations using Plotly or Altair.
- 🤖 Predictive Analytics: Churn prediction, contract renewals, etc.
- 🔄 Automated Data Pipelines for periodic ETL operations.

---

## 📬 Contact

Feel free to connect for feedback, contributions, or collaborations:

- 📧 Email: hariyogeshram882@gmail.com

---
