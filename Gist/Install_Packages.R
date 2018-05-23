filePath <- paste0(getwd(), "/")

installPath <-
  paste0(paste0("c:/Program Files/R/R-", paste0(
    paste0(version$major, "."), version$minor
  )), "/library/")

files <- list.files(path = filePath, pattern = "\\.zip$")

# lp_solve depends on Rccp
files <- sort(x = files, decreasing = TRUE)

for (f in files) {
  install.packages(paste0(filePath, f), lib = installPath, repos = NULL)
}
