

# Backlog -----------------------------------------------------------------

Trust_backlog_plot <- function(R0A){
  
  temp_backlog <- Cost_backlog %>%
    filter(Trust_Code == "R0A")
  
  ggplot(temp_backlog, aes(x = Site_Name)) +
    geom_bar(aes(y = High_risk_backlog, fill = "#005EB8"),stat = "identity") +
    geom_bar(aes(y = significant_risk_backlog, fill = "#3BF162"), stat = "identity") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("High and significant Risk Backlog")
  
}

Trust_backlog_plot("Test")


# Energy ------------------------------------------------------------------

Trust_energy_plot <- function(R0A){
  
  temp_energy <- Energy_consumption %>%
    filter(Trust_Code == "R0A")
  
  ggplot(temp_energy, aes(x = Site_Name, y = Electricity_per_metre_squared)) +
    geom_bar(stat = "identity", fill = "#005EB8") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Electricity consumption in kWh per metre squared")
  
}

Trust_energy_plot("Test")