library(readxl)
# part 01---- 
df <- read_excel("C:/Users/Pakistan/Desktop/owais_ali_shah__mid-term_2025/Mid Term Applied 2025.xlsx")
View(df)

# Show the first few rows
head(df)

# part 01 (B)----
# Summary statistics
summary(df)

# Standard deviation
sapply(df[, c("wage", "educ", "exper", "tenure")], sd)

# part 02 ----

# Run OLS regression
model1 <- lm(wage ~ educ + exper + tenure, data = df)

# View regression output
summary(model1)


# part 03 ----(a) Run the regression with log(wage):)----

# Add log wage column
df$log_wage <- log(df$wage)

# Run log-linear regression
model2 <- lm(log_wage ~ educ + exper + tenure, data = df)

# View the summary
summary(model2)

# part 4(Residual Analysis)----
# Plot residuals vs fitted values
# Load necessary library
library(plotly)
library(htmlwidgets)

# Create a plotly scatter plot for residuals vs fitted values
p <- plot_ly(
  x = model1$fitted.values,
  y = model1$residuals,
  type = "scatter",
  mode = "markers",
  marker = list(color = 'blue'),
  name = "Residuals"
) %>%
  layout(
    title = "Residuals vs Fitted",
    xaxis = list(title = "Fitted Values"),
    yaxis = list(title = "Residuals"),
    shapes = list(
      list(
        type = "line",
        x0 = min(model1$fitted.values),
        x1 = max(model1$fitted.values),
        y0 = 0,
        y1 = 0,
        line = list(color = "red", dash = "dash")
      )
    )
  )

# Save the plot as an HTML file
saveWidget(p, "residuals_vs_fitted.html")

# (b)hiistogram of residuals
hist(model1$residuals, breaks = 20,
     main = "Histogram of Residuals", xlab = "Residuals")

# (c)QQ plot of residuals
qqnorm(model1$residuals)
qqline(model1$residuals, col = "red",
        lwd = 2)

#Part 5: Multicollinearity Check----
# Load necessary library
library(car)

#b) Run VIF:
vif_model <- vif(model1)

#Part 6: Model Comparison ----
# Compare the two models
#model1 – Linear: wage ~ educ + exper + tenure
# model2 – Log-linear: log(wage) ~ educ + exper + tenure
summary(model1)$r.squared
summary(model1)$r.squared

#Part 7: Predict Wage for New Observation----
# New data for prediction
new_data <- data.frame(educ = 16, exper = 10, tenure = 5)

# Predict log(wage)
predicted_log_wage <- predict(model1, newdata = new_data)

# Convert log(wage) to wage
predicted_wage <- exp(predicted_log_wage)

predicted_wage


#1. Scatter Plot: Wage vs Education (colored by Experience)
install.packages("plotly")
install.packages("ggplot2")
install.packages("htmlwidgets")

library(plotly)
library(ggplot2)
library(htmlwidgets)

# 1️⃣ Graph 1: Wage vs Education (colored by Experience)
plot1 <- plot_ly(df, 
                 x = ~educ, 
                 y = ~wage, 
                 color = ~exper, 
                 type = "scatter", 
                 mode = "markers",
                 marker = list(size = 10,
                               colorscale = "Viridis"),
                 showscale = TRUE) %>%
  layout(title = "Wage vs Education (Colored by Experience)",
         xaxis = list(title = "Education (Years)"),
         yaxis = list(title = "Wage"))

saveWidget(plot1, "plot1_wage_vs_educ_exper.html")


# 2️⃣ Graph 2: Wage vs Tenure with Regression Line
p <- ggplot(df, aes(x = tenure, y = wage)) +
  geom_point(color = "darkblue") +
  geom_smooth(method = "lm", se = FALSE, color = "orange") +
  labs(title = "Wage vs Tenure with Fitted Line",
       x = "Tenure (Years)", y = "Wage")

plot2 <- ggplotly(p)

saveWidget(plot2, "plot2_wage_vs_tenure_line.html")


# 3️⃣ Graph 3: 3D Plot - Wage ~ Education + Experience
plot3 <- plot_ly(df, 
                 x = ~educ, 
                 y = ~exper, 
                 z = ~wage, 
                 color = ~tenure,
                 type = "scatter3d", 
                 mode = "markers",
                 marker = list(colorscale = "Plasma"),
                 showscale = TRUE) %>%
  layout(title = "3D Plot: Wage vs Education & Experience",
         scene = list(
           xaxis = list(title = "Education"),
           yaxis = list(title = "Experience"),
           zaxis = list(title = "Wage")
         ))

saveWidget(plot3, "plot3_3d_wage_plot.html")








