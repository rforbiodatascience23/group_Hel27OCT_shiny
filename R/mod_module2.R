#' module2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_module2_ui <- function(id){
  ns <- NS(id)
  tagList(

    sidebarLayout(
      sidebarPanel(
        textAreaInput(
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        )
      ),
      mainPanel(
        plotOutput(
          outputId = ns("abundance")
        )
      )
    )

  )
}

#' module2 Server Functions
#' @importFrom ggplot2 theme
#' @noRd
mod_module2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          centralDogma::plot_abundance() +
          ggplot2::theme(legend.position = "none")
      }
    })

  })
}

## To be copied in the UI
# mod_module2_ui("module2_1")

## To be copied in the server
# mod_module2_server("module2_1")
