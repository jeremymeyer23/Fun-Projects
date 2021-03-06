# Function for module UI
hello_worldUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(2, textInput(ns("TI_username"), label = NULL, placeholder = "your name")),
      column(2, actionButton(ns("AB_hello"), label = "Hello !"))
    ),
    hr(),
    fluidRow(
      column(12, textOutput(ns("TO_Hello_user")))
    )
  )
  
}

# Function for module server logic
hello_world <- function(input, output, session) {
  
  # When user clicks on "Hello" button : Update reactive variable "name"
  name <- eventReactive(input$AB_hello, {
    return(input$TI_username)
  })
  
  # Show greetings
  output$TO_Hello_user <- renderText({
    if (name() %in% "") {
      return("Hello world !")
    } else {
      return(paste("Hello", name(), "!"))
    }
  })
  
}