SELECT location, MAX(cast(total_deaths as int)) as total_deathCount
from dbo.CovidDeaths
where continent is not NULL
group by location 
order by total_deathCount desc

EXEC sp_help CovidDeaths
