# ?Quotes -- details of different quote types
# end-of-line: \n (new line - LF) versus \r (carriage return - CR)

x <- "text\nother" # line feed 
y <- "text\rother" # carriage return 
writeLines(x)
writeLines(y)

# number format
options("digits" = 8) # base R
formatC(x, format = "f", digits = 2) # change correlation matrix x to matrix of characters

# stringi
stri_read_lines() # best for pure text documents

# stringr
  # all functions start with str_
str_length() ~ nchar() # return character length of factor labels
str_c() # replaces paste0() # important in missing value handling

x <- c(1:3, NA, 5:10)
paste("Participant", x) # not handle missing value
str_c("Participant", x) # handle missing value -- detect and return NA

  # vector reclying
str_c() # warning if lengths of two things combined together may not have the same length

str_sub(string, start, end) # cannot go backwards
str_sub("ABCDEF", 2, 3)
str_sub("ABCDEF", -3, 3) # do not work because it does not go backwards, not recycle the string 

# pattern matching
str_detect()
str_extract()
str_match()
str_count()
str_view()

data(sentences)
str_view(sentences, "man") 
str_extract(sentences, ".man")[!is.na(str_extract(sentences, ".man"))] # . = any character ; space? = optional

str_trim() # trim whitespace
str_to_lower() # important for natural language processing

# rebus package -- use or not use? Can be confusing
one_or_more(ANY_CHAR) # = [.]+ instead of .+
one_or_more(ANY_CHAR, char_class = F) # = .+

# regexone.com -- lesson notes
# regex = (\d\d\d\d) or (\d{4})

# backreferences

enframe(string)
