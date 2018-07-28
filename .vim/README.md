<!-- Link to the files. -->
[auto-commands.vim]: auto-commands.vim
[functions.vim]: functions.vim
[mappings.vim]: mappings.vim
[neovim.vim]: neovim.vim
[options.vim]: options.vim
[theme.vim]: theme.vim
[tmux.vim]: tmux.vim

# `.vim` Lonefiles Folder.

| Vim File Name       | Info / Documentation / Purpose |
| :-----------------: | :----------------------------: |
| [auto-commands.vim] |                                |
| [functions.vim]     |                                |
| [mappings.vim]      |                                |
| [neovim.vim]        |                                |
| [options.vim]       |                                |
| [theme.vim]         |                                |
| [tmux.vim]          |                                |

# In Depth File Documentation

<details> <summary> 
## auto-commands.vim </summary> <p>
This file contains my vim autocommands according to my preference. Here is what they do:

 1) I have an autocommand that makes vim NOT automatiically comment a new opened line if
 there is a commented line before that line. This is achieved by removing `c`, `r` and `o`
 options from the formatoptions by `formatoptions-=cro`.
 More over:
    ```
    r : Automatically insert the comment symbol after hitting <Enter> in Insert mode.
    c : Auto-wrap comments using textwidth, inserting the comment symbol automatically.
    o : Automatically insert the comment symbol after hitting 'o' or 'O' in Normal mode.
    ```
---
</p> </details>

---
