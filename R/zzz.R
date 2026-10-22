.onLoad <- function(libname, pkgname) {
  # First, try loading the  if it exists


    if (file.exists("backup/harmonized_database_dynamic_backup.rds")) {
      harmonized_database_dynamic <<- readRDS("backup/harmonized_database_dynamic_backup.rds")
      packageStartupMessage("Loaded dynamic harmonization database from backup.")

    } else {
      harmonized_database_dynamic <<- readRDS(
        system.file(
          "extdata",
          "harmonized_database.rda",
          package = pkgname,
          mustWork = TRUE
        )
      )
      packageStartupMessage("No backup found. Initialized empty harmonized_database_dynamic.")
    }

}
