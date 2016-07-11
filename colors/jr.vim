hi clear
set bg=dark
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'jr'

function s:attrs(s)
  let s = a:s
  let s = substitute(s, '\<B\>', 'bold',      'g')
  let s = substitute(s, '\<U\>', 'underline', 'g')
  let s = substitute(s, '\<C\>', 'undercurl', 'g')
  let s = substitute(s, '\<R\>', 'reverse',   'g')
  let s = substitute(s, '\<I\>', 'italic',    'g')
  let s = substitute(s, '\<S\>', 'standout',  'g')
  let s = substitute(s, '\<N\>', 'NONE',      'g')
  return s
endf

function s:colour(s)
  return a:s =~# '^\d\+$' ? '#'.g:c256#values[a:s] : a:s
endfunction

function Hi(...)
  let [group, fg, bg, term; _] = a:000 + ['', '', '']
  let cmd = 'hi '.group
  if has('gui_running')
    let cmd .= fg   !~# '^-\=$' ? ' guifg='.s:colour(fg) : ''
    let cmd .= bg   !~# '^-\=$' ? ' guibg='.s:colour(bg) : ''
    let cmd .= term !~# '^-\=$' ? ' gui='.s:attrs(term) : ''
  el
    let cmd .= fg   !~# '^-\=$' ? ' ctermfg='.fg : ''
    let cmd .= bg   !~# '^-\=$' ? ' ctermbg='.bg : ''
    let cmd .= term !~# '^-\=$' ? ' cterm='.s:attrs(term) : ''
  en
  exe cmd
endfunction
com! -nargs=+ Hi cal Hi(<f-args>)

hi Normal guifg=#ffffff guibg=#000000

Hi NonText               4
Hi LineNr                4
Hi Folded                4 NONE   N
Hi VertSplit             4 232    N
Hi SpecialKey            234 NONE N
Hi StatusLine            4 232    N
Hi StatusLineNC          4 232    N
Hi Visual                15 4     N
Hi MatchParen            14 NONE  N
Hi CursorLine            - 234    N
Hi CursorColumn          - 234    N
Hi SignColumn            - 0
Hi Search                - - B

Hi Boring                4

Hi Comment               145
Hi Constant              13
Hi Delimiter             12
Hi Special               161
Hi Identifier            14 - B
Hi Statement             11
Hi PreProc               12
Hi Type                  10
Hi Underlined            12 - U
Hi Ignore                0

Hi vimBracket            1
Hi vimSynType            222
Hi vimGroupName          197 - B
Hi vimHLGroup            203 - B
Hi vimGroup              203 - B
Hi vimStringDelimiter    5
Hi vimGroupSpecial       9

Hi treePart              4
Hi treeClosable          4
Hi treeOpenable          4
Hi treePartFile          4
Hi treeUp                4
Hi treeBookmark          9

Hi htmlTag               30
Hi htmlEndTag            30
Hi htmlTagName           14
Hi htmlSpecialTagName    14

Hi xmlTag                30
Hi xmlEndTag             30
Hi xmlTagName            14
Hi xmlEqual              23
Hi xmlNamespace          37

Hi diffAdded             15 22
Hi diffRemoved           15 52
Hi diffFile              180

Hi javaCommentTitle      250
Hi javaDocParam          109
Hi javaDocSeeTagParam    152
Hi javaDocTags           95
Hi javaStringDelimiter   5

Hi rubyStringDelimiter   5

Hi hamlId                35
Hi hamlIdChar            29
Hi hamlClassChar         121
Hi hamlTag               24

Hi sassIdChar            43
Hi sassVariable          203
Hi sassClassChar         121

Hi coffeeParen           12
Hi coffeeBracket         12
Hi coffeeCurly           12
Hi coffeeSpecialOp       12
Hi coffeeExtendedOp      12
Hi coffeeObjAssign       13

Hi pythonStringDelimiter 5
Hi pythonSpaceError      - 1

Hi NERDTreePart          24
Hi NERDTreePartFile      24
Hi NERDTreeOpenable      24
Hi NERDTreeClosable      24
Hi NERDTreeDirSlash      24
Hi NERDTreeCWD           24
Hi NERDTreeUp            24

Hi hsDelimiter           12

Hi markdownH1            184
Hi markdownH2            179
Hi markdownHeadingRule   215
Hi markdownCodeBlock     229
Hi markdownLinkTextDelimiter 8
Hi markdownLinkDelimiter     8

Hi jadeIdChar            168
Hi jadeId                204
Hi jadeClassChar         173
Hi jadeClass             173
Hi jadeBlockExpansionChar 61

Hi kNumberSpecial        127

Hi cOperator             14 - N
Hi cDoctest              208

Hi aplL0                 197
Hi aplL1                 208
Hi aplL2                 165
Hi aplL3                 160
Hi aplL4                 167
Hi aplL5                 164
Hi aplL6                 161
Hi aplL7                 62
Hi aplL8                 165
Hi aplL9                 168
Hi aplqid                151
Hi aplvrb                14 - N

Hi nasmHexMarker         53

let g:blame_max_authors = 4
let g:blame_max_commits = 5
Hi blame00 196
Hi blame01 160
Hi blame02 124
Hi blame03  88
Hi blame04  52
Hi blame10  21
Hi blame11  20
Hi blame12  19
Hi blame13  18
Hi blame14  17
Hi blame20  46
Hi blame21  40
Hi blame22  34
Hi blame23  28
Hi blame24  22
Hi blame30 226
Hi blame31 220
Hi blame32 184
Hi blame33 142
Hi blame34  58

delc Hi
delf Hi
delf s:attrs
delf s:colour
