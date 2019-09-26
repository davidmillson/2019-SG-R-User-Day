#store the start time
start_time = Sys.time()
#calculate time elapsed
time_elapsed = reactive({
  invalidateLater(1000, session) #recalculate every second (1,000 milliseconds)
  (Sys.time() - start_time) %>% as.double(units = "secs") #store time elapsed in seconds
})
#display time elapsed
output$header = renderText({
  sprintf("Debugging in Shiny %02d:%02d",
          time_elapsed() %% 3600 %/% 60, #output minutes elapsed
          time_elapsed() %% 60 %/% 1) #output remainder seconds elapsed
})