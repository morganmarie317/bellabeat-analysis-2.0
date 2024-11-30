-- Count the number of distinct users in the dataset
SELECT
    COUNT(DISTINCT Id) AS distinct_user_count
FROM
    `my-data-project-388104.fitbit_data.daily_activity`;

-- Count the number of entries for each user
SELECT
    Id,
    COUNT(*) AS user_entry_count
FROM
    `my-data-project-388104.fitbit_data.daily_activity`
GROUP BY
    Id;

-- Calculate the average steps and calories for User ID 4057192912
SELECT
    AVG(TotalSteps) AS avg_steps,
    AVG(Calories) AS avg_calories
FROM
    `my-data-project-388104.fitbit_data.daily_activity`
WHERE
    Id = 4057192912;

-- Calculate the average steps and calories for User ID 4445114986
SELECT
    AVG(TotalSteps) AS avg_steps,
    AVG(Calories) AS avg_calories
FROM
    `my-data-project-388104.fitbit_data.daily_activity`
WHERE
    Id = 4445114986;
