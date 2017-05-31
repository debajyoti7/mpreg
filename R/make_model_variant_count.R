motorBookings %>%
  select(MakeName, ModelName, VariantName) %>%
  group_by(MakeName, ModelName, VariantName) %>%
  count() %>%
  arrange(freq)%>%
  tail()


motorBookings %>%
  select(MakeName, ModelName) %>%
  mutate(MakeName = tolower(MakeName), ModelName = tolower(ModelName))%>%
  group_by(MakeName, ModelName) %>%
  count() %>%
  arrange(freq) %>%
  tail(10)



motorBookings %>%
  select(MakeName) %>%
  distinct() %>%


motorBookings %>%
  select(MakeName) %>%
  mutate( MakeName = tolower(MakeName))%>%
  count() %>%
  arrange(freq) %>%
  tail(10)
