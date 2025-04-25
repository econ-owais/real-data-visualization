📊 Wage Analysis - Mid Term Applied Regression Project
Welcome to my Mid-Term project repository for Applied Regression Analysis (2025). This project focuses on exploring how education, experience, and tenure affect wages using statistical modeling in R.

📁 Dataset
The dataset (Mid Term Applied 2025.xlsx) contains wage-related data of workers with the following variables:


Variable	Description
wage	: Monthly wage of the worker
educ	Years of education
exper	Years of job experience
tenure	Years of current job tenure
🔍 Objective
Understand the relationship between wages and predictors like education, experience, and tenure.

Build two regression models:

Model 1: Linear Regression

Model 2: Log-linear Regression (log(wage) as the dependent variable)

Predict wage for a given profile.

Visualize trends using interactive plotly graphs.

📈 Models Used
r
Copy
Edit
# Model 1: Linear Regression
model1 <- lm(wage ~ educ + exper + tenure, data = df)

# Model 2: Log-Linear Regression
model2 <- lm(log(wage) ~ educ + exper + tenure, data = df)
📉 Prediction Example
Predict wage for:

Education = 16 years

Experience = 10 years

Tenure = 5 years

r
Copy
Edit
new_data <- data.frame(educ = 16, exper = 10, tenure = 5)
predicted_log_wage <- predict(model2, newdata = new_data)
predicted_wage <- exp(predicted_log_wage)
📊 Visualizations
All graphs are interactive and saved as HTML:

Wage vs Education (colored by Experience)

Wage vs Tenure with Regression Line

3D Wage ~ Education + Experience

These visuals help interpret the relationship between wage and each predictor variable.

🚀 How to Run
Open the project in RStudio.

Install required libraries:

r
Copy
Edit
install. packages(c("plotly", "ggplot2", "htmlwidgets", "readxl"))
Load the dataset and run the R scripts.

Open the HTML files in your browser to explore the interactive graphs.

💡 Author
[OWAIS_ALI _SHAH]
📧owais.ali.shah.econ@gmail.com
🎓 Applied Regression - Mid Term Project (2025)# real-data-visualization
real wage and educational data 
