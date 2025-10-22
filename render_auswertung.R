# Vektor mit lok-Werten erstellen
lok_abk_namen <- readRDS("lokalisationen.rds")
lok <- readRDS("lokalisationen.rds") |> 
  names()

# Benannte Liste als Input für qmd-Datei erstellen, dabei Lok-Name aus dem Vektor lok_abk_namen entnehmen
auswertungen <- 
  tibble(
    input = "auswertung_vorlage.qmd",
    output_file = str_glue("{unname(lok_abk_namen[lok])}_Auswertung_Handekzem_2005-2024"),
    execute_params = map(lok, ~list(lok = .))
  )

pwalk(auswertungen, quarto_render)
