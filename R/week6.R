# R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


# Data import
library(tidyverse)
citations <- stringi::stri_read_lines("../data/citations.txt")
citations_txt <- citations[!stringi::stri_isempty(citations)]
nrow(enframe(citations)) - nrow(enframe(citations_txt))

# Data cleaning
sample(citations_txt, 10)
citations_tbl <- citations_txt %>%
  enframe() %>%
  dplyr::rename(line = name,
                cite = value) %>%
  mutate(cite = str_replace_all(cite, pattern = "\"", replacement = ""),
         year = str_match(cite, pattern = "[\\(]?(\\d{4})[\\)]?")[,2], 
         # optional(OPEN_PAREN) %R% capture(DGT %R% DGT %R% DGT %R% DGT) %R% optional(CLOSE_PAREN)
         page_start = str_match(cite, pattern = "[p.]?([\\d]+)(?:-|:|\\?| )")[,2], 
         # optional("p.") %R% capture(one_or_more(DGT)) %R% or("-", ":", "\\?"," ")
         perf_ref = str_detect(cite, pattern = "performance"),
         title = str_match(cite, pattern = "\\)\\.[\\s]?(.*[\\s]?(?:.|\\?| )?)")[,2], 
         first_author = str_extract_all(cite, 
                                    pattern = "^[*]?[\\w]+(?:.|,|-| )?[\\w*]?[,]?[\\s]?[:upper:][\\.]?[\\s]?[[:upper:]]?"))
                                      # START %R% optional("*") %R% one_or_more(WRD) %R% optional(or(".", ",", "-", " ")) %R% 
                                      # optional(one_or_more(WRD)) %R% optional(",") %R% optional(SPC) %R% UPPER %R% 
                                      # optional(DOT) %R% optional(SPC) %R% optional(UPPER)))

# pattern = optional(OPEN_PAREN) %R% DGT %R% DGT %R% DGT %R% DGT %R% optional(CLOSE_PAREN)
pattern =  "^\\.*"
# enframe(stringi::stri_read_lines("../data/citations.txt"))
test <- sample(citations, 10)
str_extract(test, pattern)
str_match(test, pattern = "[\\(]?(\\d{4})[\\)]?")[,2]
citations_tbl[which(is.na(citations_tbl$first_author)),]
