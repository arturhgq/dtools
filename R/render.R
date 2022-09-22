#' @title Render quarto documents in pdf, html and docx formats
#' @description `r lifecycle::badge('stable')`
#'
#' This function renders quarto documents in pdf, html and docx formats
#' @param .quarto_doc Quarto document that will be rendered
#' @export
render_quarto <- function(.quarto_doc) {
  quarto::quarto_render(
    .quarto_doc,
    output_format = c("pdf", "html", "docx")
  )
}
