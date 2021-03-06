##
##  n m . R  Nelder-Mead and Subplex
##


neldermead <-
function(x0, fn, lower = NULL, upper = NULL,
                 nl.info = FALSE, control = list(), ...)
{
    opts <- nl.opts(control)
    opts["algorithm"] <- "NLOPT_LN_NELDERMEAD"

    fun <- match.fun(fn)
    fn <- function(x) fun(x, ...)

    S0 <- nloptr(x0, fn, lb = lower, ub = upper,
                opts = opts)

    if (nl.info) print(S0)
    S1 <- list(par = S0$solution, value = S0$objective, iter = S0$iterations,
                convergence = S0$status, message = S0$message)
    return(S1)
}


sbplx <-
function(x0, fn, lower = NULL, upper = NULL,
                 nl.info = FALSE, control = list(), ...)
{
    opts <- nl.opts(control)
    opts["algorithm"] <- "NLOPT_LN_SBPLX"

    fun <- match.fun(fn)
    fn <- function(x) fun(x, ...)

    S0 <- nloptr(x0, fn, lb = lower, ub = upper,
                opts = opts)

    if (nl.info) print(S0)
    S1 <- list(par = S0$solution, value = S0$objective, iter = S0$iterations,
                convergence = S0$status, message = S0$message)
    return(S1)
}
