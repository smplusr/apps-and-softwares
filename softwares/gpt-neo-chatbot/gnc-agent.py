class GNC_Agent:
    def __init__(self, length):
      self.result = ""
      self.memory = ""
      self.length = 0
      self.max_length = length

    def CountWords(self, input):
      self.length = 0
      word_list = input.split()
      for i in word_list:
        self.length += 1
      return self.length

    def Generate(self, input):
      if self.Guard(input) == True: return

      self.memory += input
      self.CountWords(self.memory)
      
      res = generate(self.memory, max_length = self.length + self.max_length, do_sample = True, temperature = 0.9, pad_token_id = 50256)
      self.result = res[0]["generated_text"]
      
      self.result = self.result.replace(self.memory, "")
      self.result = self.result.replace(input, "")
      self.result = self.result.replace("\n", "")
      
      self.memory += self.result
      return self.result, self.memory

    def Guard(self, input):
      if input[0] == ',':
        input = input.replace(',', 'self.')
        eval(input)
        return True

    def ReadMemory (self, file):
      self.memory = ""
      with open(file, 'r') as content:
        self.memory += content.read()
        content.close()

    def WriteMemory(self, file):
      with open(file, 'w') as content:
        content.write(self.memory)
        content.close()

    def Undo(self):
      self.memory = self.memory.replace(self.result, "")
