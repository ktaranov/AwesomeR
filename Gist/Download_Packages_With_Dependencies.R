# https://stackoverflow.com/a/15650828/2298061

getPackages <- function(packs) {
  packages <- unlist(
    tools::package_dependencies(
      packs,
      available.packages(),
      which = c("Depends", "Imports"),
      recursive = TRUE
    )
  )
  packages <- union(packs, packages)
  packages
}

packages <- getPackages(c(
  "dplyr",
  "data.table",
  "shiny",
  "DT",
  "lp_solve",
  "readxls",
  "openxlsx",
  "RODBC",
  "odbc",
  "leaflet",
  "logging"
))

download.packages(packages,
                  destdir = getwd(),
                  type    = "win.binary")
