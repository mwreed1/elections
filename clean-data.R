library(tidyverse)
library(janitor)

students <- read_csv("data/updated_duke")
durham_hist <- read_tsv("VR_Snapshot_20211102.txt", 
                        locale = readr::locale(encoding = "UTF-16"), 
                        skip = 4110154,
                        n_max = 2045119) 
durham_hist4 <- durham_hist3 %>%
  filter(county_desc == "DURHAM")

durham_hist1 <- durham_hist

durham_hist %>%
  slice(1)

col_names <- durham_hist1 %>%
  names()

colnames(durham_hist) <- col_names

durham_hist %>%
  count(county_desc)

durham_hist3 <- rbind(durham_hist2, durham_hist)

duke_students <- durham_hist4 %>%
  filter(
    street_name %in% c("DUKE UNIVERSITY WEST CAMPUS", 
                       "DUKE UNIVERSITY EAST CAMPUS", "TOWERVIEW") |
      (street_name %in% c("BASSETT", "EPWORTH", "FEW QUAD", "GILBERT ADDOMS", 
                          "GILES", "JARVIS", "MAXWELL", "MIRECOURT", "PEGRAM", 
                          "RANDOLPH", "RANDOLPH HALL", "ROUND TABLE", 
                          "SOUTHGATE", "WAYNE MANOR", "WILSON", "WANNAMAKER") && 
         street_type_cd == "DORM") |
      (street_name == "SWIFT" & house_num == "300") |
      (street_name == "CAMPUS"  & str_detect(house_num, "13\\d\\d"))
  )

duke_select <- duke_students %>%
  select(voter_reg_num, snapshot_dt, race_desc, ethnic_desc, party_desc, sex, 
         age, registr_dt, birth_place)

write_csv(duke_students, "data/duke_2021")
write_csv(duke_select, "data/updated_duke")



