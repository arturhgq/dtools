#' @title Render quarto documents in pdf, html and docx formats
#' @description `r lifecycle::badge('stable')`
#'
#' This function renders quarto documents in pdf, html and docx formats
#' @param .quarto_doc Quarto document that will be rendered
#' @param .params A list of named parameters
#' @export
render_quarto <- function(.quarto_doc, .params) {
  quarto::quarto_render(
    .quarto_doc,
    execute_params = .params,
  )
}
