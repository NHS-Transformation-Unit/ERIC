# Load ERIC ---------------------------------------------------------------

eric_url <- "https://files.digital.nhs.uk/F0/5A4990/ERIC%20-%202022_23%20-%20Report.xlsx"
eric_trust <- read.xlsx(eric_url, sheet = "Trust Level Data", startRow = 13)
eric_site <- read.xlsx(eric_url, sheet = "Site Level Data", startRow = 13)
ncdr_sites <- read.xlsx("data/lookups/NCDR_Site_Reference_Locations.xlsx")
