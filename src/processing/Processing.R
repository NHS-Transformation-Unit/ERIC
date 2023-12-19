
# Tenure ------------------------------------------------------------------

Tenure_type <- Cleansed_eric_site %>%
  select(c(ICB, Trust_Code, Site_Code, Site_Name, Tenure))


# Clinical Space ----------------------------------------------------------

Clinical_Space <- Cleansed_eric_site %>%
  select(c(ICB,
           Trust_Code,
           Site_Code,
           Site_Name,
           Gross_internal_floor_space,
           CS_Other)) %>%
  mutate(CS_Other = as.numeric(CS_Other),
         "Proportion_clinical_space" = CS_Other / Gross_internal_floor_space)
  

# Age Profile -------------------------------------------------------------

Age_Profile <- Cleansed_eric_site %>%
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



# Backlog -----------------------------------------------------------------

Cost_backlog <- Cleansed_eric_site %>%
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
         Low_risk_backlog = as.numeric(Low_risk_backlog),
         "Total_backlog" = High_risk_backlog + Significant_risk_backlog + Moderate_risk_backlog + Low_risk_backlog,
         "Proportion_high" = High_risk_backlog / Total_backlog,
         "Proportion_significant" = Significant_risk_backlog / Total_backlog,
         "Proportion_moderate" = Moderate_risk_backlog / Total_backlog,
         "Proportion_low" = Low_risk_backlog / Total_backlog)

str(Cost_backlog)


