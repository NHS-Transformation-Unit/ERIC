# Cleansing ERIC_Sites ----------------------------------------------------

colnames(eric_site)

Cleansed_eric_site <- eric_site

colnames(Cleansed_eric_site)[c(1,
                        2,
                        5,
                        6,
                        8,
                        28,
                        35,
                        71,
                        72,
                        73,
                        74,
                        82,
                        83,
                        84,
                        85,
                        86,
                        87,
                        88,
                        89,
                        90)] <- c("Trust_Code",
                                "Trust_Name",
                                "Site_Code",
                                "Site_Name",
                                "ICB",
                                "Gross_internal_floor_space",
                                "CS_Other",
                                "High_risk_backlog",
                                "Significant_risk_backlog",
                                "Moderate_risk_backlog",
                                "Low_risk_backlog",
                                "Age_2015_2024",
                                "Age_2005_2014",
                                "Age_1995_2004",
                                "Age_1985_1994",
                                "Age_1975_1984",
                                "Age_1965_1974",
                                "Age_1955_1964",
                                "Age_1948_1954",
                                "Age_pre_1948")

colnames(Cleansed_eric_site)
