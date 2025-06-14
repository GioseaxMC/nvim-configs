syntax keyword swamiType int char ptr <> bool void

syntax match swamiNumber /\v\d+(\.\d+)?/
syntax keyword swamiKeyword TODO return func type struct if else while for foreach extern include macro cast as sizeof typeof lambda link
syntax match swamiString /"\v([^"\\]|\\.)*"/ 
syntax match swamiString /'\v([^'\\]|\\.)*'/
syntax match swamiComment "#.*$"

highlight link swamiString String
highlight link swamiType Type
highlight link swamiNumber Number
highlight link swamiKeyword Keyword
highlight link swamiFunction Function
highlight link swamiComment Comment
