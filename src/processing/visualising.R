

# Clinical Space ----------------------------------------------------------

Trust_clinical_plot <- function(R0A){
  
  temp_clinical <- Clinical_Space %>%
    filter(Trust_Code == "R0A")
  
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

Trust_backlog_plot <- function(R0A){
  
  temp_backlog <- Age_Profile %>%
    filter(Trust_Code == "R0A")
  
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

Trust_backlog_plot <- function(R0A){
  
  temp_backlog <- Cost_backlog %>%
    filter(Trust_Code == "R0A")
  
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