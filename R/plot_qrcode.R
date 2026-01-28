#' Plot qrcode with passcode
#' @param x qrcode
#' @param col colours for the qrcode
#' @param main Plot title
#' @param passcode passcode
#' @importFrom graphics par image mtext
#' @importFrom glue glue
#' @export

plot_qrcode <- function(x, col = c("white", "black"),
                        main = "title", passcode) {
  z <- t(x)[, rev(seq_len(ncol(x)))]
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE, after = FALSE)
  par(mar = rep(1.1, 4))
  image(z, asp = 1, col = col, axes = FALSE, main = main)
  if (!missing(passcode)) {
    mtext(glue("passcode: {passcode}"), side = 1, line = 0, cex = 1.5)
  }
}
