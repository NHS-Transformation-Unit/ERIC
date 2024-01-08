# Organisation code selection ---------------------------------------------

code_org <- "RNA"



# Clinical Space ----------------------------------------------------------

Trust_clinical_plot <- function(RNA){
  
  temp_clinical <- Clinical_Space %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_clinical, aes(x = Site_Name)) +
    geom_bar(aes(y = Non_CS, fill = "Non clinical"), stat = "identity") +
    geom_bar(aes(y = CS_Other, fill = "Clinical"), stat = "identity") +
    #scale_y_continuous(labels = scales::comma()) +
    ylab("Gross internal space in metres squared") +
    xlab("Site name") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Gross Internal Space, split by clinical and non clinical") +
    scale_fill_manual(values = c("blue", "lightblue"), name = "Dedicated floor space")
  
}

Trust_clinical_plot("Test")



# Age Profile -------------------------------------------------------------

Trust_backlog_plot <- function(RNA){
  
  temp_backlog <- Age_Profile %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_backlog, aes(x = Site_Name)) +
    geom_bar(aes(y = Age_pre_1948, fill = "Pre-1948"), stat = "identity") +
    geom_bar(aes(y = Age_1948_1954, fill = "1948-1954"), stat = "identity") +
    geom_bar(aes(y = Age_1955_1964, fill = "1955-1964"), stat = "identity") +
    geom_bar(aes(y = Age_1965_1974, fill = "1965-1974"), stat = "identity") +
    geom_bar(aes(y = Age_1975_1984, fill = "1975-1984"), stat = "identity") +
    geom_bar(aes(y = Age_1985_1994, fill = "1985-1994"), stat = "identity") +
    geom_bar(aes(y = Age_1995_2004, fill = "1995-2004"), stat = "identity") +
    geom_bar(aes(y = Age_2005_2014, fill = "2005-2014"), stat = "identity") +
    geom_bar(aes(y = Age_2015_2024, fill = "2015-2024"), stat = "identity") +
    ylab("Age profile (%)") +
    xlab("Site name") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Age profile per site") +
    scale_fill_manual(values = c(
      "#8A1538", "#DA291C", "#ED8B00", "#FFB81C",
      "#FAE100", "#78BE20", "#009639", "#006747", "#005EB8"
    ), name = "Age Groups")
  
}

Trust_backlog_plot("Test")



# Backlog -----------------------------------------------------------------

Trust_backlog_plot <- function(RNA){
  
  temp_backlog <- Cost_backlog %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_backlog, aes(x = Site_Name)) +
    geom_bar(aes(y = High_risk_backlog, fill = "High Risk"), stat = "identity") +
    geom_bar(aes(y = Significant_risk_backlog, fill = "Significant Risk"), stat = "identity") +
    geom_bar(aes(y = Moderate_risk_backlog, fill = "Moderate Risk"), stat = "identity") +
    geom_bar(aes(y = Low_risk_backlog, fill = "Low Risk"), stat = "identity") +
    scale_y_continuous(labels = scales::dollar_format(prefix = "£")) +
    ylab("Total backlog by risk") +
    xlab("Site name") +
    #lab(values = c("High risk" = "#FF0101", "Significant risk" = "#FDB239", "Moderate risk" = "#F0F030", "Low risk" = "#00FF00"),
    #                  name = "Risk category") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Total Risk backlog per site") +
    scale_fill_manual(values = c("#ff0101", "#fdb239", "#f0f030", "#00ff00"), name = "Risk Backlog")
  
}

Trust_backlog_plot("Test")



# Energy ------------------------------------------------------------------

Trust_energy_plot <- function(RNA){
  
  temp_energy <- Energy_consumption %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_energy, aes(x = Site_Name, y = Electricity_per_metre_squared)) +
    geom_bar(stat = "identity", fill = "#005EB8") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ylab("Consumption in kWh per metre squared") +
    xlab("Site name") +
    ggtitle("Electricity consumption in kWh per metre squared")
  
}

Trust_energy_plot("Test")



# Tenure ------------------------------------------------------------------

Trust_site_plot <- function(RNA){
  
  temp_tenure <- Tenure_type %>%
    filter(Trust_Code == code_org) %>%
    #mutate(map_colour = case_when(Tenure == "Leased from NHS Property Services" ~ "green",
    #                              Tenure == "Leased from commercial organisation - lease greater than 99 years" ~ "blue",
    #                              Tenure == "Leased from commercial organisation - lease less than 99 years" ~ "darkgreen",
    #                              Tenure == "Freehold" ~ "red",
    #                              Tenure == "Part site - Private Finance Initiative (PFI)" ~ "darkblue",
    #                              Tenure == "SLA/lease from public sector" ~ "yellow",
    #                              Tenure == "NA" ~ "orange",
    #                              Tenure == "SLA/lease from NHS" ~ "purple",
    #                              Tenure == "Whole site - Private Finance Initiative (PFI)" ~ "cyan",
    #                              Tenure == "Local Investment Finance Trust (LIFT))" ~ "pink",
    #                              TRUE ~ "black"))
  
  pal_levels <- c("Leased from NHS Property Services",
                  "Leased from commercial organisation - lease greater than 99 years",
                  "Leased from commercial organisation - lease less than 99 years",
                  "Freehold",
                  "Part site - Private Finance Initiative (PFI)",
                  "SLA/lease from public sector",
                  "NA",
                  "SLA/lease from NHS",
                  "Whole site - Private Finance Initiative (PFI)",
                  "Local Investment Finance Trust (LIFT))")
  
  pal_colours <- c("green",
                   "blue",
                   "darkgreen",
                   "red",
                   "darkblue",
                   "yellow",
                   "orange",
                   "purple",
                   "cyan",
                   "pink")
  
  pal <- colorFactor(palette = pal_colours,
                     levels = pal_levels)
 
  Tenure_map <- leaflet(data = temp_tenure) %>%
    addProviderTiles(provider = "CartoDB.Positron") %>%
    addCircleMarkers(
      ~Longitude_1m, ~Latitude_1m,
      popup = ~paste("Site name: ", Site_Name, "<br>Tenure: ", Tenure),
      color = ~pal(Tenure),
      radius = 5,
      fillOpacity = 1.0,
      label = ~as.character(Site_Name)
    ) %>%
    addLegend(values = temp_tenure$Tenure,
              pal = pal)

  print(Tenure_map) 
  
}

Trust_site_plot("Test")

