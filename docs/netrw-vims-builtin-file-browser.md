netrw - Vim's Built-in File Browser
===================================

To launch netrw:

* Run `vim` with a directory as the command-line argument
* `:edit <path/to/a/directory` (or `:e <path/to/a/directory`)
* `:e .` to open the current working directory
* `:Explore` opens netrw in the directory of the current file
* `:E`
* `:Sexplore` or `:Sex` launches netrw in a new split window below the current
  window
  (`:split .` or `:sp .` will do the same, but open the current working
  directory instead of the directory of the current file)
* `:Vexplore` or `:Vex` launches netrw in a new split window left of the current
  window
  (`:vsplit .` or `:vs .` will do the same, but open the current working
  directory instead of the directory of the current file, and to the right
  instead of to the left for some reason)
* `-` Opens netrw in the directory of the current file, with the cursor on the
  current file. `-` again goes up one directory

You can use all the normal vim movement commands to move around within a netrw
buffer, including search! And you `Enter` to open the file or directory under
the cursor.

The initial `-` shortcut is actually provided by Tim Pope's vim-vinegar plugin:
<https://github.com/tpope/vim-vinegar>.

Vinegar also:

* Turns off a lot of the documentation that netrw normally displays
  at the top of the window. Press `I` to toggle it back on.

* Changes netrw's default sort order to a suffix-based one

* Hides files matching `wildignore` in netrw.

* Vinegar seems to hide the `../` entry for going up to the next directory too,
  use `-` instead.

* Adds the `.` shortcut to prepulate the filename at the end of a command, or
  `!` to prepulate it at the end of a `!` command.

* Adds the `y.` shortcut to yank the absolute path to the file under the cursor.

* Adds the `~` shortcut to go to your home dir.

Other netrw commands:

* `%` creates a new file (not saved to the filesystem until you save it)
* `d` creates a new directory (immediately)
* See netrw's quick help menu (`I`) for deleting and renaming files

## See Also

* Vimcasts on netrw: http://vimcasts.org/episodes/the-file-explorer/
* Vimcasts "oil and vinegar" post about why netrw works in normal vim buffers
  instead of in a sidebar or project drawer: http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
