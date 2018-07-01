fugitive.vim
============

Links
-----

* <https://github.com/tpope/vim-fugitive>
* [Vimcasts series on fugitive](http://vimcasts.org/blog/2011/05/the-fugitive-series/)

git blame
---------

<kbd>:Gblame</kbd> will do a `git blame` on the file in the currently active
window and open up `git blame` output in a split window to the right of the
current window.

The git blame window is **scroll bound**: the scroll position of the blame
window is synced to that of the original window, so that the blame lines are
always aligned with the correct source lines.

* <kbd>q</kbd> in a git blame window closes it, returning to just the source
  window

Pressing <kbd>Enter</kbd> on a line in the blame window closes the blame window
and opens the git commit for the line in the original source window.

* <kbd>o</kbd> and <kbd>O</kbd> open commits in horizontal splits or in tabs
  instead.
* I don't think there's any special controls available in the git commit buffers,
  other than that hitting <kbd>Enter</kbd>, <kbd>o</kbd> or <kbd>O</kbd> on a line
  with a parent commit or treee sha on it will open that commit or tree.
* <kbd><kbd>Ctrl</kbd>+<kbd>6</kbd></kbd> in a git commit window will go back
  to the original source window, and remove the git commit buffer from the
  buffer list. (Any other normal buffer-changing command in a commit buffer will
  do the same, e.g. <kbd>:buffer 2</kbd>.)
* I don't think there's any way to get the git blame output back after going to
  a git commit window, other than <kbd><kbd>Ctrl</kbd>+<kbd>6</kbd></kbd>
  and then <kbd>:GBlame</kbd> again.
