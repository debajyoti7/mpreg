
## subset data
motorBookings %>%
  select(InsurerMakeName, SupplierName
         , ChasisNumber, EngineNumber
         , PolicyNo) %>%
  dim()


df <- motorBookings %>%
  select(InsurerMakeName, MakeName
         , ModelName, InsurerModelName
         , SupplierName
         , ChasisNumber, EngineNumber
         , PolicyNo)

###for Engine
dfeng <- df %>%
  select(InsurerMakeName, EngineNumber)

###for chasis
dfchasis <- df %>%
  select(InsurerMakeName, MakeName
         , InsurerModelName, ModelName
         , ChasisNumber)


#generate clean keys
dfeng %>%
  select(InsurerMakeName) %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  unique() %>%
  write.csv("data/output/dirty_makeName.csv", row.names=FALSE)


dfchasis %>%
  select(InsurerMakeName) %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  unique() %>%
  write.csv("data/output/dirtyChasis_makeName.csv", row.names=FALSE)


df %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  unique() %>%
  write.csv("data/output/cleaned_allset.csv", row.names=FALSE)



#generate keywords
dfeng %>%
  select(InsurerMakeName) %>%
  String_to_words() %>%
  unique() %>%
  write.csv("data/output/makeName_keywords.csv", row.names = FALSE)

dfeng_clean <- dfeng %>%
  mutate(InsurerMakeName = Clean_String(InsurerMakeName))%>%
  Clean_names()

dfeng_clean %>%
  select(InsurerMakeName) %>%
  unique()%>%
  nrow()

dfeng_clean %>%
  mutate(nc = nchar(EngineNumber)) %>%
  group_by(InsurerMakeName) %>%
  mutate(k = n_distinct(nc)) %>%
  select(k) %>%
  unique()

