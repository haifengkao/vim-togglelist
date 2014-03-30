# vim-togglelist
vim-togglelist is a simple plugin that allows you to bind a key to toggle the Location List and the Quickfix List.

## Installation
I recommend using a plugin manager to do the grunt work for you.  
If for some reason, you do not want to use any of them, then unzip the contents of the .zip file to your ~/.vim directory.

## Mappings/Commands
The following commands are available by default

````
  :ToggleLL : Toggle the Location List
  :ToggleQF : Toggle the Quickfix List
````

There are no maps provided by default; you need to set them up yourselves.  

## Customization
Before performing any customization, the following code needs to be present  

``` vim
let g:ToggleList = { 'cmd': {} }
```

Then, the command to be used to open/close the Location List/Quickfix can be specified as  

``` vim
let g:ToggleList.cmd.copen  = "copen"         " Command used to open  the Quickfix
let g:ToggleList.cmd.cclose = "cclose"        " Command used to close the Quickfix
let g:ToggleList.cmd.lopen  = "lopen"         " Command used to open  the Location List
let g:ToggleList.cmd.lclose = "lclose"        " Command used to close the Location List
```

Use `g:ToggleList.quiet` to specify if you want to see errors when trying to open an empty Location List.  

``` vim
let g:ToggleList.quiet = 0
```
