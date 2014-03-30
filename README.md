# vim-togglelist
vim-togglelist is a simple plugin that allows you to bind a key to toggle the `Location List` and the `Quickfix List`.

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
You can specify which command you want to use to open a quickfix list(in case you are using some plugin) by copying the
`g:ToggleList` dictionary to your vimrc and editing it as required

``` vim
let g:ToggleList = {
  \ 'command': {
  \   'copen'  : "copen",
  \   'cclose' : "cclose",
  \   'lopen'  : "lopen",
  \   'lclose' : "lclose"
  \ },
  \ 'quiet': 1,
  \}
```

Change `g:ToggleList.quiet` to 0 if you want to see errors such as when trying to open an empty Location List

``` vim
let g:ToggleList.quiet = 0
```
