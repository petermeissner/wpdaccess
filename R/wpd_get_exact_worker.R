wpd_get_exact_worker <-
  function(page, lang){
    # generate file path
    file_path <-
      file.path(
        wpd_dump_path(),
        sprintf("%s.db", lang)
      )

    # establish connection to database
    con <-
      DBI::dbConnect(
        RSQLite::SQLite(),
        dbname = file_path
      )

    # query database


  }