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
    ylab("Gross internal space in square metres") +
    xlab("Site code") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Gross Internal Space, split by clinical and non clinical") +
    scale_fill_manual(values = setNames(cs_colours,cs_levels), name = "Dedicated floor space") +
    #scale_y_continuous(labels = scales::percent(accuracy = 1)) +
    theme(legend.position = "bottom") +
    selected_theme(hex_col = "#407EC9")
  
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
         x = "Site code",
         y = "Age profile (%)") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1),
          legend.position = "bottom") +
    selected_theme(hex_col = "#407EC9")
    
}

# GIF Age Profile ---------------------------------------------------------

Trust_gif_age_plot <- function(code_org){
  
  temp_gif_age <- GIF_Age_Profile_long %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_gif_age, aes(x = Age_group, y = Gross_internal_space, fill = Age_group)) +
    geom_bar(stat = "identity") + 
    scale_fill_manual(values = age_colours, name = "Age Groups", labels = age_levels) +
    labs(title = "Age profile of the organisation",
         caption = "Source: ERIC Publication",
         x = "Age profile",
         y = "Gross internal floor space (square metres)") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1),
          legend.position = "bottom") +
    selected_theme(hex_col = "#407EC9")
  
}

# Backlog -----------------------------------------------------------------

Trust_backlog_plot <- function(code_org){
  
  temp_backlog <- Cost_backlog_long %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_backlog, aes(x = Site_Code, y = Cost, fill = Backlog_risk)) +
    geom_bar(stat = "identity") +
    scale_fill_manual(values = backlog_colours, name = "Risk Level", labels = backlog_levels) +
    scale_y_continuous(labels = scales::dollar_format(prefix = "£")) +
    labs(title = "Total Risk backlog per site",
         caption = "Source: ERIC Publication",
         x = "Site code",
         y = "Total cost") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1),
          legend.position = "bottom") +
    selected_theme(hex_col = "#407EC9")
  
}

# Energy ------------------------------------------------------------------

Trust_energy_plot <- function(code_org){
  
  temp_energy <- Energy_consumption %>%
    filter(Trust_Code == code_org)
  
  ggplot(temp_energy, aes(x = Site_Code, y = Electricity_per_metre_squared)) +
    geom_bar(stat = "identity", fill = "#005EB8") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ylab("Consumption in kWh per metre squared") +
    xlab("Site code") +
    ggtitle("Electricity consumption in kWh per metre squared") +
    selected_theme(hex_col = "#407EC9")
  
}

# Tenure ------------------------------------------------------------------

Trust_site_plot <- function(code_org){
  
  temp_tenure <- Tenure_type %>%
    filter(Trust_Code == code_org)
  
   leaflet(data = temp_tenure) %>%
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
  
}
