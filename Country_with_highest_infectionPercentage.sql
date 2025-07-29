SELECT
    location,
    MAX(CAST(total_cases AS FLOAT)) AS HighestInfectionCount,
    MAX(CASE
            WHEN ISNUMERIC(total_cases) = 1 AND ISNUMERIC(population) = 1 AND CAST(population AS FLOAT) > 0
            THEN ROUND((CAST(total_cases AS FLOAT) / CAST(population AS FLOAT)) * 100, 2)
            ELSE NULL
        END) AS Percent_Population_Infected_Overall
FROM
    dbo.CovidDeaths
GROUP BY
    location,population
ORDER BY
   Percent_Population_Infected_Overall desc