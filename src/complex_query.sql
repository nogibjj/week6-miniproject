SELECT Country.Continent, Country.Name, Country.LifeExpectancy, City.Name AS CapitalCity
FROM Country
JOIN (
    SELECT Continent, MAX(LifeExpectancy) AS MaxLifeExpectancy
    FROM Country
    GROUP BY Continent
) MaxLifeExpectancyByContinent
ON Country.Continent = MaxLifeExpectancyByContinent.Continent
    AND Country.LifeExpectancy = MaxLifeExpectancyByContinent.MaxLifeExpectancy
JOIN City
ON Country.Capital = City.ID
ORDER BY LifeExpectancy DESC;