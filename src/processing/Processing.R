
# Tenure ------------------------------------------------------------------

Tenure_type <- eric_site %>%
  select(c(Integrated.Care.Board, Trust.Code, Site.Code, Site.Name, Tenure))


# Clinical Space ----------------------------------------------------------

Clinical_Space <- eric_site %>%
  select(c(Integrated.Care.Board,Trust.Code,
           Site.Code,Site.Name,
           `Gross.internal.floor.area.(m²)`,
           `Clinical.space.-.other.(m²)`)) %>%
  mutate(`Clinical.space.-.other.(m²)` = as.numeric(`Clinical.space.-.other.(m²)`))


# Age Profile -------------------------------------------------------------

