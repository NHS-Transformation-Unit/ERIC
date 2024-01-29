# Sites -------------------------------------------------------------------

Report_sites <- Merged_eric_site %>%
  select(c(Trust_Code,
           Site_Code,
           Site_Name))

# Tenure ------------------------------------------------------------------

Tenure_type <- Merged_eric_site %>%
  select(c(ICB,
           Trust_Code,
           Site_Code,
           Site_Name,
           Tenure,
           Latitude_1m,
           Longitude_1m))

# Clinical Space ----------------------------------------------------------

Clinical_Space <- Merged_eric_site %>%
  select(c(ICB,
           Trust_Code,
           Site_Code,
           Site_Name,
           Gross_internal_floor_space,
           CS_Other)) %>%
  mutate(CS_Other = as.numeric(CS_Other),
         "Non_CS" = Gross_internal_floor_space - CS_Other,
         "Proportion_clinical_space" = CS_Other / Gross_internal_floor_space,
         "Proportion_non_clinical_space" = Non_CS / Gross_internal_floor_space)

# Age Profile -------------------------------------------------------------

Age_Profile <- Merged_eric_site %>%
  select (c(ICB,
           Trust_Code,
           Site_Code,
           Site_Name,
           Age_pre_1948,
           Age_1948_1954,
           Age_1955_1964,
           Age_1965_1974,
           Age_1975_1984,
           Age_1985_1994,
           Age_1995_2004,
           Age_2005_2014,
           Age_2015_2024)) 

Age_Profile_long <- Age_Profile %>%
  gather(key = "Age_group",
         value = "Percentage",
         -c(1:4)) %>%
  mutate(Age_group = factor(Age_group, levels = c("Age_pre_1948",
                                                  "Age_1948_1954",
                                                  "Age_1955_1964",
                                                  "Age_1965_1974",
                                                  "Age_1975_1984",
                                                  "Age_1985_1994",
                                                  "Age_1995_2004",
                                                  "Age_2005_2014",
                                                  "Age_2015_2024")))

# Backlog -----------------------------------------------------------------

Cost_backlog <- Merged_eric_site %>%
  select (c(ICB,
            Trust_Code,
            Site_Code,
            Site_Name,
            High_risk_backlog,
            Significant_risk_backlog,
            Moderate_risk_backlog,
            Low_risk_backlog)) %>%
  mutate(High_risk_backlog = as.numeric(High_risk_backlog),
         Significant_risk_backlog = as.numeric(Significant_risk_backlog),
         Moderate_risk_backlog = as.numeric(Moderate_risk_backlog),
         Low_risk_backlog = as.numeric(Low_risk_backlog))
 
Cost_backlog_long <- Cost_backlog %>%
  gather(key = "Backlog_risk",
         value = "Cost",
         -c(1:4)) %>%
  mutate(Backlog_risk = factor(Backlog_risk, levels = c("High_risk_backlog",
                                                        "Significant_risk_backlog",
                                                        "Moderate_risk_backlog",
                                                        "Low_risk_backlog")))

# Incidents from risk -----------------------------------------------------

Incident_risk <- Merged_eric_site %>%
  select (c(ICB,
            Trust_Code,
            Site_Code,
            Site_Name,
            Clinical_incidents_from_critical_infrastructure_risk,
            Clinical_incidents_from_noncritical_infrastructure_risk,
            Clinical_incidents_from_other_failure,
            Estates_incidents_from_critical_infrastructure_risk,
            Estates_incidents_from_noncritical_infrastructure_risk))

# Energy ------------------------------------------------------------------

Energy_consumption <- Merged_eric_site %>%
  select(c(ICB,
           Trust_Code,
           Site_Code,
           Site_Name,
           Green_electricity,
           Trust_owned_solar_electricity,
           Third_party_solar_electricity,
           Other_renewable_electricity,
           Other_electricity,
           Gas,
           Oil,
           Renewable_non_fossil_fuel,
           Gross_internal_floor_space))%>%
  mutate(Green_electricity = as.numeric(Green_electricity),
         Trust_owned_solar_electricity = as.numeric(Trust_owned_solar_electricity),
         Third_party_solar_electricity = as.numeric(Third_party_solar_electricity),
         Other_renewable_electricity = as.numeric(Other_renewable_electricity),
         Other_electricity = as.numeric(Other_electricity),
         Gas = as.numeric(Gas),
         Oil = as.numeric(Oil),
         Renewable_non_fossil_fuel = as.numeric(Renewable_non_fossil_fuel),
         "Total_electricity" = Green_electricity + Trust_owned_solar_electricity + Third_party_solar_electricity + Other_renewable_electricity + Other_electricity,
         "Total_energy" = Total_electricity + Gas + Oil + Renewable_non_fossil_fuel,
         "Electricity_per_metre_squared" = Total_electricity / Gross_internal_floor_space,
         "Total_energy_per_metre_squared" = Total_energy / Gross_internal_floor_space)
