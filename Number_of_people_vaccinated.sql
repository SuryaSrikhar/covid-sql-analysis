SELECT  cd.continent , cd.location, cd.population, cd.date, cv.new_vaccinations ,

SUM(CONVERT(bigint , new_vaccinations)) OVER (partition by cd.location order by cd.location,cd.date) as RollingPeopleVaccinated

FROM CovidData..CovidDeaths cd

join CovidData..CovidVaccination cv
  on cd.location = cv.location
     and cd.date= cv.date
where cd.continent is not NULL
order by 2,3 

