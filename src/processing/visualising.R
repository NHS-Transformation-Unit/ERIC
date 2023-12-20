
# Tenure ------------------------------------------------------------------

ggplot(Energy_consumption, aes(x = Site_Name, y = Electricity_per_metre_squared)) +
  geom_bar(stat = "identity", fill = "#005EB8")
