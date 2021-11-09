agent = GNC_Agent(15)       # Agent instantiation with base max length set as 15 char.

while(1):
 
  agent.Generate(input())   # Here, Inputs will be retrived from the user and sent to the Generate agent's method.
  print(f"{agent.result}")  # And here, the "result" member of the agent will be printed.
