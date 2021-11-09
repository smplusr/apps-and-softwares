# apps-and-sofwares
This repository constains all the finished and polished projects that can be classified as softwares or apps (including homebrews and hacks)

Inside the software directory can be found unix systems apps and softwares such as ssh clients.
Unix-like projects are marked with the unix prefix inside their name.
In opposite, windows apps will have win as prefix.
Homebrews apps are hack that run on custom firmware.
those homebrews, like softwares, have their target machine in the starting of their name.
for example: 3ds-ssh2-cli is a ssh client made using libssh2, that targets the 3ds (and 2ds, OLD/NEW models) systems.
The following parts of this readme is dedicaced to all the sofwares apps and homebrew projects contained in this apps-and-software repository:

------------------------------------------------------------------------------------------------

# Unix-ssh2-cli:

This software is a basic ssh client made with the libssh2 library (depending on openssh).
In order to compile it, you must specify the ssh2 library like so:
```
gcc -o <target output> main.c -lssh2
```
In order to use it, you have to enter the host address, username and password when launching the app.
For example:
```
./a.out 192.168.0.0 username password
```
Otherwise, the sofware will notify you to do so.
Thanks to Ivan Tretyakov for their work on the SmallSimpleSSH.c project, which helped me designing this one and understanding
the libssh2 library. The link to their project can be found below:

Link: https://www.libssh2.org/mail/libssh2-devel-archive-2018-10/att-0013/SmallSimpleSSH_2.c

------------------------------------------------------------------------------------------------

# GNC - Chat - Agent 

This Utility is the Google Colab version of the one available here:
  - https://github.com/smplusr

This tool contains 3 mains parts:
  - The install mechanism, written in BASH
  - The model setup script, written in Python
  - The actual agent, also written in Python

You only need to run the installer the first time you launch the software.
After that, dependancies will be resolved.

The python scripts will need to be ran in python3. The setup needs to be launched BEFORE the chatbot agent. Once that is done, you can run the agent script.

BE CAREFUL, you might have to do these steps again as soon as you close you python console. Downloads will still persist but the pipeline importation and generation will require to be executed again.

also, GPT-NEO, as one of the most powerful pretrained transformer model that synthetize high quality human native language REQUIRES A REALLY POWERFUL HOST.
The 1.3B version requires at least 11GB of RAM, barely running inside Google Colab free sessions and the 2.7B needing more that 16GB !
CPU and GPU are also really important ! Without some good hardware, simple text generation might take A LOT of time to be completed and it may even crash or damage hardware ! BE CAREFUL !

the GNC-Agent, or GPT-Neo Chatbot Agent is aimed to run on very little function calls. The class comes with 7 prebuild functions, including the init constructor function. List of functions in the source code.

Here is a example of functions that can be ran in a python3 GPT session.

  - agent = GNC_Agent(15)
 
  - agent.Generate(input())

  - print(f"{agent.result}")
  - print(f"{agent.memory}")
  
  - agent.Guard(",max_length = 30")
  - agent.Undo()

  - agent.ReadMemory("file.txt")
  - agent.WriteMemory("file.txt")

The result member of the agent will be the most recent string formated output of the AI. This result can be undone leading to one undo possible on the actual agent's memory. This memory will be built on all the inputs from the user and the AI, leading to actual conversations or context simulation.

There is a built-in debug / sandbox mode allowing to call the agent's inner function from the input prompt. In order to use it, just write a comma: ',' as the first character of a paragraph, then you can unter a method and event parameters. Those are cumulable ! (Example: ",WriteMemory("file.txt") ,Undo()")

Of course, the most important function, from which the debug inputs can be entered is: the Generate method. Though, the Guard (debug method) can be accessed directly.


 -> Huge thanks to EleutherAI and their amazing work on GPT-Neo
