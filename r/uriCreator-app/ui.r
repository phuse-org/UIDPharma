###############################################################################
# FILE: /scripts/r/ui.r
# DESC: Example Study URI creator
# IN  : 
# OUT : 
# REQ : 
# NOTE: 
# TODO: 
#       
###############################################################################
navbarPage("TTL File Query",
    theme = "spacelab.css",
    tabPanel("Query",
        wellPanel(
            column(6, fileInput('fileTTL', '.TTL File', accept=c('.ttl'))),
            column(6, fileInput('fileRQ',   'OPTIONAL: .RQ Query File')),
            fluidRow(
                textAreaInput(inputId="query", "SPARQL Query", rows=10, width='90%', 
"# To Visualize, results must be ?s ?p ?o
SELECT ?s ?p ?o 
WHERE{
    ?s ?p ?o
}"),
            actionButton(inputId = "runQuery", label="Run query")
        )
    ),
    fluidRow(
        HTML('<br><label for="endpoint">Query Result:</label>'),
        dataTableOutput("queryresult")
    )
    ),
    tabPanel("QC Check",
        uiOutput("ui")
    ),
    tabPanel("Visualize",
        visNetworkOutput("network",height = '900px')
    )
)