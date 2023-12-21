

# Clinical Space ----------------------------------------------------------

Trust_clinical_plot <- function(R0A){
  
  temp_clinical <- Clinical_Space %>%
    filter(Trust_Code == "R0A")
  
  ggplot(temp_clinical, aes(x = Site_Name)) +
    geom_bar(aes(y = Non_CS), stat = "identity", fill = "blue") +
    geom_bar(aes(y = CS_Other), stat = "identity", fill = "lightblue") +
    #scale_y_continuous(labels = scales::comma()) +
    ylab("Gross internal space in metres squared") +
    xlab("Site name") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Gross Internal Space, split by clinical and non clinical")
  
}

Trust_clinical_plot("Test")



# Backlog -----------------------------------------------------------------

Trust_backlog_plot <- function(R0A){
  
  temp_backlog <- Cost_backlog %>%
    filter(Trust_Code == "R0A")
  
  ggplot(temp_backlog, aes(x = Site_Name)) +
    geom_bar(aes(y = High_risk_backlog), stat = "identity", fill = "#FF0101") +
    geom_bar(aes(y = Significant_risk_backlog), stat = "identity", fill = "#FDB239") +
    geom_bar(aes(y = Moderate_risk_backlog), stat = "identity", fill = "#F0F030") +
    geom_bar(aes(y = Low_risk_backlog), stat = "identity", fill = "#00FF00") +
    scale_y_continuous(labels = scales::dollar_format(prefix = "£")) +
    ylab("Total backlog by risk") +
    xlab("Site name") +
    #lab(values = c("High risk" = "#FF0101", "Significant risk" = "#FDB239", "Moderate risk" = "#F0F030", "Low risk" = "#00FF00"),
    #                  name = "Risk category") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ggtitle("Total Risk backlog per site")
  
}

Trust_backlog_plot("Test")


# Energy ------------------------------------------------------------------

Trust_energy_plot <- function(R0A){
  
  temp_energy <- Energy_consumption %>%
    filter(Trust_Code == "R0A")
  
  ggplot(temp_energy, aes(x = Site_Name, y = Electricity_per_metre_squared)) +
    geom_bar(stat = "identity", fill = "#005EB8") +
    theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
    ylab("Consumption in kWh per metre squared") +
    xlab("Site name") +
    ggtitle("Electricity consumption in kWh per metre squared")
  
}

Trust_energy_plot("Test")