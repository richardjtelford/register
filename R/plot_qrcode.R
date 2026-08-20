#' Plot qrcode with access code
#' @param url url to make into a QR code
#' @param col colours for the qrcode
#' @param main Plot title
#' @param code_text Access code title
#' @param accesscode accesscode
#' @importFrom graphics par image mtext strwidth
#' @importFrom grDevices dev.off png
#' @importFrom glue glue
#' @export

plot_qrcode <- function(url, col = c("white", "black"),
                        main = "title", code_text = "Access code", accesscode) {

  # make qrcode
  x <- qr_code(url)
  z <- t(x)[, rev(seq_len(ncol(x)))]

  # temp file
  tmp <- tempfile(fileext = ".png")

  # plot qrcode
  width <- 800
  res <- 200
  png(tmp, width = width, height = 800, res = res)
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE, after = FALSE)

  par(mar = c(1.5, rep(1.1, 3)))
  image(z, asp = 1, col = col, axes = FALSE, main = main)
  if (!missing(accesscode)) {
    code <- glue("{code_text}: {accesscode}")
    mtext(code, side = 1, line = 0, cex = max_cex(code))
  }
  dev.off()

  # show qrcode
  system(paste("open", tmp))
}


#' @importFrom graphics par strwidth
max_cex <- function(str, mx = 2) {
  #work out string width max
  maxcex <- par('pin')[1]/strwidth(str,'inches')
  min(maxcex, mx)
}
