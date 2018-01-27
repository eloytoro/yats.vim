"Syntax in the JavaScript code

" String
syntax match   typescriptASCII                 contained /\\\d\d\d/

syntax region  typescriptTemplateSubstitution matchgroup=typescriptTemplateSB
  \ start=/\${/ end=/}/
  \ contains=@typescriptExpression
  \ contained

syntax region  typescriptString
  \ start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/
  \ nextgroup=@typescriptSymbols
  \ skipwhite skipempty

" From vim runtime
" <https://github.com/vim/vim/blob/master/runtime/syntax/javascript.vim#L48>
syntax region  typescriptRegexpString          start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gimuy]\{0,5\}\s*$+ end=+/[gimuy]\{0,5\}\s*[;.,)\]}]+me=e-1 nextgroup=typescriptDotNotation oneline

syntax region  typescriptTemplate matchgroup=typescriptTemplateTag
  \ start=/\k*`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/
  \ contains=typescriptTemplateSubstitution
  \ nextgroup=@typescriptSymbols
  \ skipwhite skipempty

"Array
syntax region  typescriptArray matchgroup=typescriptBraces
  \ start=/\[/ end=/]/
  \ contains=@typescriptValue,typescriptForComprehension,@typescriptComments
  \ nextgroup=@typescriptSymbols,typescriptDotNotation
  \ skipwhite skipempty

" Number
syntax match typescriptNumber /\<0[bB][01][01_]*\>/        nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\<0[oO][0-7][0-7_]*\>/       nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\<0[xX][0-9a-fA-F][0-9a-fA-F_]*\>/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /[+-]\=\%(\d[0-9_]*\.\d[0-9_]*\|\d[0-9_]*\|\.\d[0-9]*\)\%([eE][+-]\=\d[0-9]*\)\=\>/
  \ nextgroup=@typescriptSymbols skipwhite skipempty
