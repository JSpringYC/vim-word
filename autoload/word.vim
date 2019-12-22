" Word.vim
"
" 字数统计相关
"
" ********************
" ***** 函数定义 *****
" ********************
"
" 行字数统计
function WordCountLine()
    echom "WordCountLine"
endfunc

" 总字数统计
function WordCountAll()
    echom "WordCountAll"
endfunc

" ********************
" ***** 命令导出 *****
" ********************
"
" 命令导出: WordCountLine
command -bar WordCountLine word#WordCountLine()
"
" 命令导出: WordCountAll
command -bar WordCountAll word#WordCountAll()
