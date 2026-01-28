## code to prepare `adjective_noun` dataset goes here

adjective_noun <- list()
adjective_noun$norsk <- list(
  adjective = c(
    "viktig", "stor", "sent", "liten", "kort", "vakker", "sterk", "varm",
    "kaldt", "enkel", "ny", "gammel", "stille", "ung", "flott", "tidlig", "gul",
    "svart", "rosa", "lilla", "hvit", "brun", "lys", "glad", "snill", "sulten",
    "fin", "rik", "rolig", "trist", "morsom", "rask", "ren", "skitten", "smart",
    "modig", "pen", "sjelden", "sunn", "fargerik", "klar", "lat", "full", "tom",
    "kraftig", "frisk", "lystig", "dyr", "billig", "lang"
  ),
  noun = c(
    "Piggsvin", "Villsvin", "Moskusfe", "Hjort", "Elg", "Rein", "Hvithval",
    "Narhval", "Nise", "Spekkhogger", "Grindhval", "Finnhval", "Gaupe", "Ulv",
    "Fjellrev", "Jerv", "Grevling", "Oter", "Hvalross", "Kanin", "Hare",
    "Ekorn", "Bever", "Lemen", "Ringsel", "Stokkand", "Ringand", "Fjellrype",
    "Orrfugl", "Storfugl", "Storlom", "Havhest", "Havsule", "Trane", "Tjeld",
    "Vipe", "Storjo", "Krykkje", "Lomvi", "Alke", "Lunde", "Hubro", "Kattugle",
    "Isfugl", "Svarttrost", "Spettmeis", "Ravn", "Bokfink", "Gulspurv",
    "Dompap"
  ) |> tolower()
)

adjective_noun$english <- list(
  adjective = c(
    "happy", "red", "blue", "pink", "green", "white", "black", "dirty", "sad",
    "funny", "cheap", "clean", "fast", "slow", "dark", "kind", "hungry", "wise",
    "old", "new", "young", "rich", "purple", "clever", "smart", "strong",
    "warm", "cold", "nice", "good", "clear", "tall", "short", "long", "rare",
    "violet", "round", "small", "large", "light", "bald", "gentle", "jolly",
    "itchy", "lazy", "fancy", "silly", "brave", "lively", "eager", "tiny"
  ),
  noun = c(
    "elk", "puffin", "leming", "heron", "swan", "goose", "hippo", "otter",
    "lion", "owl", "cat", "lynx", "fox", "jackel", "crow", "whale", "dog",
    "eagle", "cod", "seal", "coot", "penguin", "rat", "bear", "robin", "wren",
    "shark", "pike", "trout", "salmon", "orca", "bat", "snake", "adder", "frog",
    "newt", "duck", "lizard", "mouse", "badger", "oak", "pine", "spruce",
    "lime", "ash", "beech", "birch", "willow", "aspen", "hazel"
  )
)

# check for duplicates
adjective_noun |>
  purrr::flatten() |>
  purrr::map(duplicated) |>
  purrr::map(any) |>
  unlist()

adjective_noun |>
  purrr::flatten() |>
  purrr::map(length) |>
  unlist()

usethis::use_data(adjective_noun, overwrite = TRUE)
