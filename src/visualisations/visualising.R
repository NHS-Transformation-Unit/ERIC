# Sites -------------------------------------------------------------------

Trust_sites <- function(code_org){
  
  temp_sites <- Report_sites %>%
    filter(Trust_Code == code_org) %>%
    select(Site_Code,
           Site_Name) %>%
    dplyr::rename("Site code" = 1,
                  "Site Name" = 2)
}

# Clinical Space ----------------------------------------------------------

Trust_clinical_plot <- function(code_org){
  
  temp_clinical <- Clinical_Space %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_clinical, aes(x = Site_Code)) +
    geom_bar(aes(y = Non_CS, fill = "Non clinical"), stat = "identity") +
    geom_bar(aes(y = CS_Other, fill = "Clinical"), stat = "identity") +
    #scale_y_continuous(labels = scales::comma()) +
    ylab("Gross internal space in metres squared") +
    xlab("Site name") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Gross Internal Space, split by clinical and non clinical") +
    scale_fill_manual(values = setNames(cs_colours,cs_levels), name = "Dedicated floor space")
  
}

# Age Profile -------------------------------------------------------------

Trust_age_plot <- function(code_org){
  
  temp_age <- Age_Profile_long %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_age, aes(x = Site_Code, y = Percentage, fill = Age_group)) +
    geom_bar(stat = "identity") + 
    scale_fill_manual(values = age_colours, name = "Age Groups", labels = age_levels) +
    labs(title = "Age profile per site",
         caption = "Source: ERIC Publication",
         x = "Site name",
         y = "Age profile (%)") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1))
    
}

# Backlog -----------------------------------------------------------------

Trust_backlog_plot <- function(code_org){
  
  temp_backlog <- Cost_backlog_long %>%
    filter(Trust_Code == "R0A")
  
  ggplot(temp_backlog, aes(x = Site_Code, y = Cost, fill = Backlog_risk)) +
    geom_bar(stat = "identity") +
    scale_fill_manual(values = backlog_colours, name = "Risk Level", labels = backlog_levels) +
    scale_y_continuous(labels = scales::dollar_format(prefix = "£")) +
    labs(title = "Total Risk backlog per site",
         caption = "Source: ERIC Publication",
         x = "Site name",
         y = "Total cost") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) 
  
}

# Energy ------------------------------------------------------------------

Trust_energy_plot <- function(code_org){
  
  temp_energy <- Energy_consumption %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_energy, aes(x = Site_Code, y = Electricity_per_metre_squared)) +
    geom_bar(stat = "identity", fill = "#005EB8") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ylab("Consumption in kWh per metre squared") +
    xlab("Site name") +
    ggtitle("Electricity consumption in kWh per metre squared")
  
}

# Tenure ------------------------------------------------------------------

Trust_site_plot <- function(code_org){
  
  temp_tenure <- Tenure_type %>%
    filter(Trust_Code == code_org) %>%
    filter(!is.na(Longitude_1m) & !is.na(Latitude_1m)) %>%
    filter(between(Latitude_1m, -90, 90) & between(Longitude_1m, -180, 180))
  
   Tenure_map <- leaflet(data = temp_tenure) %>%
    addProviderTiles(provider = "CartoDB.Positron") %>%
    addCircleMarkers(
      ~Longitude_1m, ~Latitude_1m,
      popup = ~paste("Site name: ", Site_Name, "<br>Tenure: ", Tenure),
      color = ~tenure_pal(Tenure),
      radius = 5,
      fillOpacity = 1.0,
      label = ~as.character(Site_Name)
    ) %>%
    addLegend(values = temp_tenure$Tenure,
              pal = tenure_pal)

  print(Tenure_map) 
  
}
