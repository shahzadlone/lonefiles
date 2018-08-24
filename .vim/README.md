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

<details> <summary> <b> <font size="+4"> auto-commands.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>
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

 2) Automatically resize windows (to equal sizes) when the terminal size is changed. This
 is done by doing `<C-w>=` everytime vim is resized.

---

 3) Always jump to the last known cursor position, if a valid position is known. Don't
 do it, if inside a commit message or an event handler. This is done by doing a normal mode
 command that basically goes to the last saved position which is stored as a mark. The
 mark register in which the last cursor position is stored in is `"`. We know that to go
 to a marked register in vim we have to press `` ` `` and then enter the marked register
 we want to go to. So our final command we have becomes `` g`\" ``.

 * Note: We have to escape `"` and before doing the command we need to also check if we
 are inside a commit message or an event handler.Now even if we close the file and open
 it again, vim will jump to the last position we were at before we close the file `:)`.

---

 4) Use hybrid line numbers when I am in normal mode and absolute line numbers when I am in
 insert mode. This is done by having an autocommand that `set relativenumber` when I am in
 normal mode and when I enter insert mode `set norelativenumber`.

---

 5) An auto command to detect any file that starts with `.bash_` or `.bash-` as a bash
 file, which are also hidden files.

---

 6) Additional autocommands to help vim detect a filetype according to my preference, ONLY
 if vim fails to detect it.

 * Note: There is a difference between: set `filetype=sh` and `setfiletype sh`. The first
 one tells vim to set the filetype. The second tells vim to ONLY set the filetype, if no
 filetype was was previously detected or set.

---

 7) An autocommand to override my actual formatting mapping that indents the entire file,
 if the file is a JSON file. This new mapping uses a nice JSON file indenting tool to make
 the entire file pretty and formatted the way I like my JSON files to be formatted.

---

 8) An autocommand that changes my current directory, if I enter a file in another
 directory. The directory is changes to the new file's directory.

 * Tip: This works quite magically with TMUX, as you can open a tmux pane that is already
 in the path of the file you are working on (this helps when working with multiple files
 in multiple directories).

---

 9) Open new buffers/files in a new tab (stops piling or opening things on top of one pane).

</p> </details>

---

<details> <summary> <b> <font size="+4"> functions.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>

| Function | Info / Documentation / Purpose |
| :------: | :----------------------------: |
|          |  |

</p> </details>

---

<details> <summary> <b> <font size="+4"> mappings.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>

| Mapping | Info / Documentation / Purpose |
| :-----: | :----------------------------: |
|         |  |

</p> </details>

---

<details> <summary> <b> <font size="+4"> neovim.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>

| Vim File Name       | Info / Documentation / Purpose |
| :-----------------: | :----------------------------: |
|                     |  |

</p> </details>

---

<details> <summary> <b> <font size="+4"> options.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>

|              Option Set              |          Info / Documentation / Purpose         |
| :----------------------------------: | :---------------------------------------------: |
| `autoindent`                         | Turns vim's Auto Indentation on.                |
| `autoread`                           |                                                 |
| `autowrite`                          |                                                 |

</p> </details>

---

<details> <summary> <b> <font size="+4"> theme.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>

| Vim File Name       | Info / Documentation / Purpose |
| :-----------------: | :----------------------------: |
|                     |  |

</p> </details>

---

<details> <summary> <b> <font size="+4"> tmux.vim </font> </b>
                    <i> [Click to Expand] </i>
          </summary> <p>

| Vim File Name       | Info / Documentation / Purpose |
| :-----------------: | :----------------------------: |
|                     |  |

</p> </details>

---
