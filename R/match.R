#' @title Argument matching with formals
#' @description `r lifecycle::badge('stable')`
#'
#' This function returns a list of a function's arguments and their values, including the default values
#' @examples
#' f = function(x = 1, y = 2) match_call()
#' f(x = 3)
#' f = function(x = 1, y = 2, ...) match_call()
#' f(x = 3, dots = 13)
#' @references
#' https://stackoverflow.com/questions/14397364/match-call-with-default-arguments
#' @export
match_call = function() {
  call_args = evalq(match.call(expand.dots = TRUE), parent.frame(1))
  formal_args = as.list(evalq(formals(), parent.frame(1)))
  if ("..." %in% names(formal_args)) {
    formal_args = within(formal_args, rm("..."))
  }

  for(i in setdiff(names(formal_args), names(call_args)))
    call_args[i] = list( formal_args[[i]] )

  as.list(call_args)[-1]
}

