📊 Real Data Visualization – Wage Analysis (Applied Regression Mid-Term Project 2025)
Welcome to my project repository for Applied Regression Analysis (2025).
This project explores how education, experience, and tenure influence monthly wages through statistical modeling and visualization in R.

📁 Dataset
The dataset (Mid Term Applied 2025.xlsx) contains wage-related information for workers, with the following variables:


Variable	Description
wage	Monthly wage of the worker
educ	Years of education
exper	Years of job experience
tenure	Years of current job tenure
🔍 Objective
Analyze the relationship between wage and predictors like education, experience, and tenure.

Build and compare two regression models:

Model 1: Linear Regression

Model 2: Log-Linear Regression (log(wage) as the dependent variable)

Predict wages for given worker profiles.

Visualize key trends using interactive Plotly graphs.

📈 Models Used
r
Copy
Edit
# Model 1: Linear Regression
model1 <- lm(wage ~ educ + exper + tenure, data = df)

# Model 2: Log-Linear Regression
model2 <- lm(log(wage) ~ educ + exper + tenure, data = df)
📉 Prediction Example
Profile:

Education = 16 years

Experience = 10 years

Tenure = 5 years

Prediction in R:

r
Copy
Edit
new_data <- data.frame(educ = 16, exper = 10, tenure = 5)
predicted_log_wage <- predict(model2, newdata = new_data)
predicted_wage <- exp(predicted_log_wage)
📊 Visualizations
All visualizations are interactive and saved as HTML files:

Wage vs Education (colored by Experience)

Wage vs Tenure with Regression Line

3D Wage ~ Education + Experience Plot

These visuals help interpret how each factor affects wages.

🚀 How to Run
Open the project in RStudio.

Install required libraries:

r
Copy
Edit
install.packages(c("plotly", "ggplot2", "htmlwidgets", "readxl"))
Load the dataset and run the R scripts.

Open the generated HTML files to explore interactive graphs.

💡 Author
Owais Ali Shah
📧 owais.ali.shah.econ@gmail.com
🎓 Applied Regression - Mid Term Project (2025)
