# Cleansing ERIC_Sites ----------------------------------------------------

colnames(eric_site)

Cleansed_eric_site <- eric_site %>%
  dplyr::rename("Trust_Code" = 1,
                "Trust_Name" = 2,
                "Site_Code" = 5,
                "Site_Name" = 6,
                "ICB" = 8,
                "Gross_internal_floor_space" = 28,
                "CS_Other" = 35,
                "High_risk_backlog" = 71,
                "Significant_risk_backlog" = 72,
                "Moderate_risk_backlog" = 73,
                "Low_risk_backlog" = 74,
                "Age_2015_2024" = 82,
                "Age_2005_2014" = 83,
                "Age_1995_2004" = 84,
                "Age_1985_1994" = 85,
                "Age_1975_1984" = 86,
                "Age_1965_1974" = 87,
                "Age_1955_1964" = 88,
                "Age_1948_1954" = 89,
                "Age_pre_1948" = 90,
                "Green_electricity" = 97,
                "Trust_owned_solar_electricity" = 99,
                "3rd_party_solar_electricity" = 101,
                "Other_renewable_electricity" = 103,
                "Other_electricity" = 105,
                "Gas" = 107,
                "Oil" = 109,
                "Renewable_non_fossil_fuel" = 111,
                "Clinical_incidents_from_critical_infrastructure_risk" = 185,
                "Clinical_incidents_from_noncritical_infrastructure_risk" = 186,
                "Clinical_incidents_from_other_failure" = 187,
                "Estates_incidents_from_critical_infrastructure_risk" = 188,
                "Estates_incidents_from_noncritical_infrastructure_risk" = 189)

colnames(Cleansed_eric_site)
