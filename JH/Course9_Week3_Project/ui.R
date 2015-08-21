shinyUI(pageWithSidebar(
    headerPanel("Prediction over MtCars"),
    sidebarPanel(
        h4("Input these 3 variables to calculate the estimated Miles per Galon of the car"),
        numericInput("cyl", "Number of cylinders", 4, min=4, max=8, step=2),
        numericInput('hp', 'Horse Power', 100, min=60, max=300, step=1),
        numericInput('wt', 'Car weight', 1, min=0.8, max=8, step=0.001),
        actionButton("goButton", "Calculate!")
    ),
    mainPanel(
        h4("Using linear regression over these 3 variables with the Mtcars dataset, the prediction of Miles per Galon is:"),
        verbatimTextOutput("pred")
    )
))