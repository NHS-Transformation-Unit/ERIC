
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

Age_Profile <- Cleansed_eric_site