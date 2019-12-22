" Word.vim
"
" 字数统计相关
"
" ********************
" ***** 函数定义 *****
" ********************
"
" 行字数统计
function! WordCountLine()
    " 当前行
    let s:iLine = line('.')
    " 当前行的文本
    let s:sLine = getline(s:iLine)

    " 判断当前行是否为空
    let s:lenLine = strchars(s:sLine)
    if s:lenLine == 0
        echom "Current line is empty."
        return
    endif
    " 中文字符
    let s:lenChinese = 0
    " 数字
    let s:lenDigit = 0
    " 英文字符
    let s:lenLetter = 0

    for c in split(s:sLine, '\zs')
        let s:iCharNr = char2nr(c)

        if s:iCharNr >= 48 && s:iCharNr <= 57
            let s:lenDigit += 1
        elseif (s:iCharNr >= 97 && s:iCharNr <= 122) || (s:iCharNr >= 65 && s:iCharNr <= 90)
            let s:lenLetter += 1
        elseif char2nr(c) >= 0x2000
            let s:lenChinese += 1
        endif
    endfor

    echom 'Line ' . s:iLine . ' Chars: ' . s:lenLine . ', Digit: ' . s:lenDigit . ', Letter: ' . s:lenLetter . ', Chinese: ' . s:lenChinese
endfunction

" 总字数统计
function! WordCount()
    " 第一行
    let s:sLines = getline(1, '$')

    " 总的
    let s:lenTotal = 0
    " 中文字符
    let s:lenChinese = 0
    " 数字
    let s:lenDigit = 0
    " 英文字符
    let s:lenLetter = 0
    " 总行数
    let s:lenLines = len(s:sLines)

    " 循环处理
    for s:sLine in s:sLines
        " 记算总字符数
        let s:lenLine = strchars(s:sLine)
        let s:lenTotal += s:lenLine

        for c in split(s:sLine, '\zs')
            let s:iCharNr = char2nr(c)

            if s:iCharNr >= 48 && s:iCharNr <= 57
                let s:lenDigit += 1
            elseif (s:iCharNr >= 97 && s:iCharNr <= 122) || (s:iCharNr >= 65 && s:iCharNr <= 90)
                let s:lenLetter += 1
            elseif char2nr(c) >= 0x2000
                let s:lenChinese += 1
            endif
        endfor    
    endfor

    echom 'Total: ' . s:lenTotal . ', Digit: ' . s:lenDigit . ', Letter: ' . s:lenLetter . ', Chinese: ' . s:lenChinese
endfunction

" ********************
" ***** 命令导出 *****
" ********************
"
" 命令导出: WordCountLine
command! -bar WordCountLine call WordCountLine()
"
" 命令导出: WordCountAll
command! -bar WordCount call WordCount()
