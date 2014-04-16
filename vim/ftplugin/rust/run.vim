

" Autorun rust scripts with F5.

nmap <f5> <Esc>:w<CR>:!clear;rustc % -o a && ./a && rm a <CR>

imap <f5> <Esc>:w<CR>:!clear;rustc % -o a && ./a && rn a <CR>

