# Import AI model from gpt-neo

print("Available models:  ")
print("     -> gpt-neo-2.7B")
print("     -> gpt-neo-1.3B")
print("     -> gpt-neo-350M")
print("     -> gpt-neo-125M")
print("")
from transformers import pipelines

model = input("please choose a model: ")
generate = pipelines.pipeline('text-generation', model=f'EleutherAI/{model}')
