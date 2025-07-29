SELECT 
    location,
    date,
    population,
    total_cases,
    
    CASE 
        WHEN ISNUMERIC(total_cases) = 1 AND ISNUMERIC(population) = 1 AND CAST(population AS FLOAT) > 0
        THEN ROUND((CAST(total_cases AS FLOAT) / CAST(population AS FLOAT)) * 100, 2)
        ELSE NULL
    END AS Percentage_of_Population_infected
FROM 
    dbo.CovidDeaths
WHERE 
    location LIKE '%united kingdom%'
    AND continent IS NOT NULL
ORDER BY 
    1, 2;