# Bellabeat Smart Device Analysis


## **ASK**


### **Task**

Analyze smart device usage data to gain insights into how consumers use non-Bellabeat smart devices. Apply these insights to one Bellabeat product in the presentation.


**Key Questions:**

1. What are some trends in smart device usage?

2. How could these trends apply to Bellabeat customers?

3. How could these trends help influence Bellabeat's marketing strategy?


### **Guiding Questions**

- **What is the problem you are trying to solve?**  

  Srsen wants to grow Bellabeat, but the team is unsure about the smartest choice for their next steps toward growth.


- **How can your insights drive business decisions?**  

  By understanding how users implement Bellabeat products and comparing this data with non-Bellabeat smart device usage, we can identify patterns and opportunities for Bellabeat. Insights may reveal features to highlight or new ones to develop, potentially driving growth and customer engagement.


### **Business Task**

- Gather and analyze FitBit data.  

- Clean and prepare the data for analysis.  

- Visualize findings and compare FitBit data with Bellabeat data to identify actionable insights.


---


## **PREPARE**


### **Data Gathering**

1. Downloaded FitBit datasets from Kaggle.

2. Unzipped and converted datasets to CSV format for compatibility.

3. Renamed files for consistent naming conventions, improving workflow organization.


### **Data Preparation**

1. Imported datasets into Google Sheets to inspect the data.  

2. Adjusted date formats (`M/DD/YYYY H:MM:SS PM` → `YYYY-MM-DD`) for BigQuery compatibility.  

3. Fixed column issues (e.g., AM/PM column detection).  

4. Uploaded the wide-format datasets to BigQuery for easier analysis.


---


## **PROCESS**


### **Data Cleaning**

- Removed rows with missing or null values.

- Verified data integrity post-cleaning.

- Standardized date formats for seamless analysis.


---


## **Ideas**


### **Insights for Growth**

1. **Tracking Correlation:**  

   Users who track their daily activity are more likely to achieve their fitness goals, which could encourage them to buy additional products for enhanced tracking.

2. **Marketing Strategies:**  

   Focus on:

   - Weight log data  

   - Sleep data  

   - Calories burned data  

3. **Behavioral Patterns:**  

   - Identify the most tracked metrics.

   - Analyze activity trends by day of the week (e.g., more active on weekends?).

   - Compare data for users with higher activity levels to others.

---


## **ANALYZE**


### **Queries and Results**


1. **Distinct Users in `daily_activity` Dataset:**

   ```sql

   SELECT

       COUNT(DISTINCT Id) AS distinct_user_count

   FROM

       my-data-project-388104.fitbit_data.daily_activity


### **Result: 33 distinct users**

Entries per User in daily_activity:

- I used the following query to find out how many entries  each user had within the daily_activity dataset.

```sql

SELECT

    Id,

    COUNT(*) AS user_entry_count

FROM

    my-data-project-388104.fitbit_data.daily_activity

GROUP BY Id

```

### **Result: User entry counts ranged from 4 to 31 entries.**


3. Average Steps and Calories of Least Frequent User:


```sql 

SELECT

    AVG(TotalSteps) AS avg_steps,

    AVG(Calories) AS avg_calories

FROM

    my-data-project-388104.fitbit_data.daily_activity

WHERE

    Id = 4057192912

```


Result:


Average Steps: 3,838

Average Calories: 1,973.75


### **4. Average Steps and Calories of Most Frequent User:**


```sql

SELECT

    AVG(TotalSteps) AS avg_steps,

    AVG(Calories) AS avg_calories

FROM

    my-data-project-388104.fitbit_data.daily_activity

WHERE

    Id = 4445114986
```

Result:


Average Steps: 4,796.55

Average Calories: 2,186.19


Analysis

The most frequent user walked 20% more steps and burned 10% more calories daily compared to the least frequent user.


![bar chart](./assets/bellabeat%20viz%201.png)

![bar chart 2](./assets/bellabeat%20viz%202.png)
s
### **Share**

In this analysis, I utilized R programming to create compelling data visualizations that provide insights into the dataset. R's robust suite of libraries, such as **ggplot2** for plotting and **dplyr** for data manipulation, allowed me to effectively clean, analyze, and graphically represent the data. By leveraging R's capabilities, I was able to transform raw data into meaningful visual narratives that highlight patterns, trends, and correlations. These visualizations serve as a powerful tool to communicate findings in a clear and impactful way, making complex data accessible and actionable. Please refer to the **script.R** file for the code used in this process.

### **Conclusion**
This analysis aimed to compare the activity levels of two users: one who logged their data consistently and another who logged less frequently. The results showed that the user who tracked their performance more regularly walked significantly more steps. This highlights an important insight: consistently logging and tracking health data allows users to organize their goals, monitor progress, and maintain accountability, which leads to improved consistency and long-term success in their health journeys.

To capitalize on this insight, my marketing recommendation for Bellabeat is to create campaigns showcasing women achieving their health goals with the help of Bellabeat’s smart devices. By focusing on how easy and efficient health tracking drives better results, the brand can connect with its audience and inspire them to see Bellabeat as a key tool for their success. This approach not only highlights the product’s value but is also likely to increase sales by resonating with the target audience's aspirations.
