motorBookings %>%
  select(-MobileNo)%>%
  as.data.frame() %>%
  write.csv("data/input/policydetails_motor.xlsx",row.names = FALSE)


motorBookings %>%
  select(InsurerMakeName, SupplierName
         , ChasisNumber, EngineNumber
         , PolicyNo, RegistrationDate) %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  Clean_names() %>%
  write.csv("data/output/mpsubset_cleanMakeNames.csv",row.names = FALSE)


motorBookings %>%
  dplyr::select(SupplierName) %>%
  unique()


df %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  Clean_names() %>%
  write.csv("data/output/allsubset_cleanMakeNames.csv",row.names = FALSE)


df %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  Clean_names() %>%
  mutate(nc_E = nchar(EngineNumber)
         , nc_C = nchar(ChasisNumber)
         , nc_P= nchar(PolicyNo)) %>%
  write.csv("data/output/allsubset_cleanMakeNames_counts.csv",row.names = FALSE)
