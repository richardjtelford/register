#' Plot qrcode with access code
#' @param url url to make into a QR code
#' @param col colours for the qrcode
#' @param main Plot title
#' @param code_text Access code title
#' @param accesscode accesscode
#' @importFrom graphics par image mtext
#' @importFrom glue glue
#' @export

plot_qrcode <- function(url, col = c("white", "black"),
                        main = "title", code_text = "Access code", accesscode) {
  x <- qr_code(url)
  z <- t(x)[, rev(seq_len(ncol(x)))]
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE, after = FALSE)
  par(mar = rep(1.1, 4))
  image(z, asp = 1, col = col, axes = FALSE, main = main)
  if (!missing(accesscode)) {
    mtext(glue("{code_text}: {accesscode}"), side = 1, line = 0, cex = 1.5)
  }
}
