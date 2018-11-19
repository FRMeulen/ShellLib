Shell-functions
===============

## Setup

1. Download repository.
2. Open .bashrc in home folder in your text editor of choice.
3. Add the following code to .bashrc:


`for file in '[path]'/*.sh; do`  
` ‏‏‎  ‏‏‎  ‏‏‎  ‏‏‎ source "$file"`  
`done`

__*note: [path] is the path you downloaded this repository to.__