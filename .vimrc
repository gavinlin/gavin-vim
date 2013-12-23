
" Vundle{
    set nocompatible
    set shell=/bin/sh


    filetype on
    filetype off
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()

"}

" Bundles {
    Bundle 'gmarik/vundle'
    
    Bundle 'scrooloose/nerdtree'
    map <F8> :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    let g:netrw_home='~/bak'
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

    Bundle 'nanotech/jellybeans.vim'

    Bundle 'majutsushi/tagbar'
    nmap <F9> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1

    Bundle 'Valloric/YouCompleteMe'
    "youcompleteme  默认tab  s-tab 和自动补全冲突
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

    Bundle 'scrooloose/syntastic'

    Bundle 'bling/vim-airline'
    set laststatus=2

    Bundle 'scrooloose/nerdcommenter'

    Bundle 'kien/ctrlp.vim'
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    map <leader>f :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
                \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
                \ }
    "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1

    "快速插入代码片段
    Bundle 'SirVer/ultisnips'
    "let g:UltiSnipsExpandTrigger = "<tab>"
    "let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    "定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
    let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]

    Bundle 'kien/rainbow_parentheses.vim'
    let g:rbpt_colorpairs = [
                \ ['brown',       'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['darkgray',    'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['brown',       'firebrick3'],
                \ ['gray',        'RoyalBlue3'],
                \ ['black',       'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkred',     'DarkOrchid3'],
                \ ['red',         'firebrick3'],
                \ ]
    let g:rbpt_max = 40
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces

    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'Raimondi/delimitMate'
    Bundle 'plasticboy/vim-markdown'
    Bundle 'vim-scripts/cscope.vim'
"}

" General settings{
    set background=dark
    filetype plugin indent on

    if has ("mac")
        set guifont=YaheiMonaco:h16
    else
        set guifont=YaheiMonaco\ 12
    endif

    set fenc=utf-8 
    set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 

    " exit confirm hint
    set confirm 

    syntax on
    set mouse=a
    set mousehide
    scriptencoding utf-8

    if has ('x') && has ('gui')
        set clipboard=unnamedplus
    elseif has ('gui')
        set clipboard+=unnamed
    endif


    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " To disable views add the following to your .vimrc.before.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif

        " :highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white 
        " :match OverLength '\%101v.*' 

"}

" VIM UI{
    "colorscheme"
    set t_Co=256
    colorscheme jellybeans 
    let g:jellybeans_overrides = {
                \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
                \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
                \              'attr': 'bold' },
                \}

    set tabpagemax=15
    set showmode
    
    set cursorline

    highlight clear SignColumn
    highlight clear LineNr

    set backspace=indent,eol,start
    set linespace=0
    set nu
    set showmatch
    set incsearch
    set hlsearch
    set winminheight=0
    set ignorecase
    set smartcase
    set wildmenu
    set wildmode=list:longest,full
    set whichwrap=b,s,h,l,<,>,[,]
    set scrolljump=5
    set scrolloff=3
    set nofoldenable
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    
"}

" VIM Formatting{
    set wrap
    set autoindent
    set shiftwidth=4
    set expandtab
    set tabstop=4
    set softtabstop=4
    set nojoinspaces
    set splitright
    set splitbelow
    set pastetoggle=<F12>

    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

"}


"Key Mapping{
    let mapleader = ','
    
    " Easier switching in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_
    
    noremap j gj
    noremap k gk

    " Stupid shift key fixes
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif
    
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

"}

" Functions{
    " Strip whitespace {
    function! StripTrailingWhitespace()
        " To disable the stripping of whitespace, add the following to your
        " .vimrc.local file:
        "   let g:spf13_keep_trailing_whitespace = 1
        if !exists('g:spf13_keep_trailing_whitespace')
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endif
    endfunction
    " }

        " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

"}

