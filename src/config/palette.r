
# Clinic_Space_palette ----------------------------------------------------

cs_levels <- c("Non clinical",
               "Clinical")

cs_colours <- c("blue",
                "lightblue")

cs_pal <- colorFactor(palette = cs_colours,
                      levels = cs_levels)

# Age_profile_palette -----------------------------------------------------

age_levels <- c("Pre-1948",
                "1948-1954",
                "1955-1964",
                "1965-1974",
                "1975-1984",
                "1985-1994",
                "1995-2004",
                "2005-2014",
                "2015-2024")

age_colours <- c("#8A1538",
                 "#DA291C",
                 "#ED8B00", 
                 "#FFB81C",
                 "#FAE100",
                 "#78BE20",
                 "#009639",
                 "#006747",
                 "#005EB8")

age_pal <- colorFactor(palette = age_colours,
                      levels = age_levels)

# Backlog_palette ---------------------------------------------------------

backlog_levels <- c("High risk",
                    "Significant risk",
                    "Moderate risk",
                    "Low risk")

backlog_colours <- c("#ff0101",
                     "#fdb239",
                     "#f0f030",
                     "#00ff00")

backlog_pal <- colorFactor(palette = backlog_colours,
                       levels = backlog_levels)

# Tenure_palette ----------------------------------------------------------

tenure_levels <- c("Leased from NHS Property Services",
                   "Leased from commercial organisation - lease greater than 99 years",
                   "Leased from commercial organisation - lease less than 99 years",
                   "Freehold",
                   "Part site - Private Finance Initiative (PFI)",
                   "SLA/lease from public sector",
                   "NA",
                   "SLA/lease from NHS",
                   "Whole site - Private Finance Initiative (PFI)",
                   "Local Investment Finance Trust (LIFT)")

tenure_colours <- c("green",
                    "blue",
                    "darkgreen",
                    "red",
                    "darkblue",
                    "yellow",
                    "orange",
                    "purple",
                    "cyan",
                    "pink")

tenure_pal <- colorFactor(palette = tenure_colours,
                   levels = tenure_levels)
