" execute pathogen#infect()

source ~/.vimrc_common

" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:UltiSnipsExpandTrigger = '<tab>'
" function! g:UltiSnips_Complete()
"     call UltiSnips_ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips_JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction
" 
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" 
" " let g:ycm_key_list_select_completion = ['<s-cr>']

set nocompatible
"filetype off  " required!
"set rtp+=~/.vim/vundle.git/
"call vundle#rc()
"filetype plugin indent on " required!

"" Bundles {
"    " Use local bundles if available {
"        if filereadable(expand("~/.vimrc.bundles.local"))
"            source ~/.vimrc.bundles.local
"        endif
"    " }
"" }


" ==========================================
" Met en surbrillance des lignes et colonnes
" ==========================================
" set cursorline " highlight current line
" set cursorcolumn " highlight current column
set colorcolumn=78
hi cursorline guibg=#3a3a3a " highlight bg color of current line
hi cursorcolumn guibg=#3a3a3a " highlight cursor
hi ColorColumn guibg=#2e2e2e
hi ExtraWhitespace guibg=#550000
hi SpecialKey term=bold ctermfg=DarkCyan guifg=#555555


" =============
" Environnement
" =============
set backspace=indent,eol,start " backspace for dummys
set showmatch " show matching brackets/parenthesis
set wildmenu
set wildmode=list:longest,full " comand <tab> completion, list matches and complete the longest common part, then, cycle through the matches
set shortmess+=filmnrxoOtT " abbrev. of messages (avoids 'hit enter')
set showmode " display the current mode
" set spell " spell checking on
set relativenumber " Relative line numbers on
set tabpagemax=15 " only show 15 tabs
set guitablabel=%N/\ %t\ %M " affiche le numero de l'onglet, le fichier, et un "+" si le contenu de l'onglet a ete modifie
autocmd BufNew * if winnr('$') == 1 | tabmove999 | endif " open new tabs at the end
set incsearch " find as you type search
set hlsearch " highlight search terms
set modeline " mesure de securite
set ttyfast " Accélère le rendu graphique dans les terminaux véloces
if version >= 500
    filetype plugin indent on " Automatically detect file types.
endif
" remap le raccourci :x car trop proche de :w
ca x w


" ==========
" Formatting
" ==========
set wrap " wrap long lines
set autoindent smartindent " indent at the same level of the previous line
set shiftwidth=4 ts=4 sts=4 " use indents of 4 spaces
set shiftround " arrondit l'indentation
set expandtab " tabs are tabs, not spaces
set matchpairs+=<:> " match, to be used with %
set pastetoggle=<f12> " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
"set foldenable " auto fold code
"set foldmethod=marker " type of folding
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


" ======
" Coding
" ======
" setlocal omnifunc=syntaxcomplete#Complete " activate autocomplete (intellisense)
" set cot+=menuone " show preview of function prototype
set completeopt=longest,menuone


" ============
" Comportement
" ============
set mousemodel=popup " Le clic droit ouvre un menu
set wildchar=<Tab> " Use <Tab> to complete
set ignorecase smartcase incsearch " Smart search
set history=20 " history in cmd
set nohidden " Don't hide buffers without closing them
" echange ' et ` pour le rappel de markers
nnoremap ' `
nnoremap ` '
 " preciseJump
map - _f
" je deteste le mode Ex
noremap Q <Esc>
let mapleader = "," " <leader> sera ,
" visually select a search result (cf. http://superuser.com/questions/224865/vim-select-text-highlighted-by-search)
nnoremap g/ //e<CR>v??<CR>
nnoremap g? ??b<CR>v//e<CR>
set scrolloff=3 " lignes de contexte autour du curseur
set fileformats=unix,dos,mac " File formats
if version >= 500
    set enc=utf-8 fenc=utf-8
    set foldmethod=manual
    set foldmarker:{,}
    let php_sql_query = 1
    let php_htmlInStrings = 1
    let php_asp_tags = 1
    let php_parent_error_close = 1
    let php_parent_error_open = 1
    " let php_folding = 2
    set mps+=(:),{:},[:],<:>
    " Omni-completion avec CTRL-X O, completion locale + includes avec CTRL-n
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html source $VIM/runtime/indent/html.vim
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType php setlocal iskeyword-=$
    autocmd FileType php normal zR
    autocmd FileType c set omnifunc=ccomplete#Complete
endif
" Récupérer la position du curseur entre 2 ouvertures de fichiers
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
" Afficher les espaces superflus et les tabulations
:match ExtraWhitespace /\s\+$\|\t/
" Suppression automatique des espaces superflu
" autocmd BufWritePre * :%s/\s\+$//e
" Se place dans le répertoire du fichier éditer
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
" Affiche la limite de 160 caractères
" autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>160v.\+', -1)

" remap hjkl en ijkl et reporte le i sur le h
" map i <Up>
" map j <Left>
" map k <Down>
" noremap h i
" noremap H I


" ===============================
" GVIM- (here instead of .gvimrc)
" ===============================
if has('gui_running')
    set guifont=Monaco:h14 " Police pour gVim
    " set guifont=Monospace\ Bold\ 13 " Police pour gVim
    " set guifont=Courier\ New\ Bold\ 13 " Police pour gVim
    " set lines=40 " 40 lines of text instead of 24,
"     set guioptions+=T " show the toolbar
"     " Ajout d'icones personnalisees dans la ToolBar pour split
"     :aunmenu ToolBar.EnregTout
"     :aunmenu ToolBar.Imprimer
"     :aunmenu ToolBar.Annuler
"     :aunmenu ToolBar.Refaire
"     :aunmenu ToolBar.Couper
"     :aunmenu ToolBar.Copier
"     :aunmenu ToolBar.Coller
"     :aunmenu ToolBar.Remplacer
"     :aunmenu ToolBar.CherchSuiv
"     :aunmenu ToolBar.CherchPrec
"     :aunmenu ToolBar.OuvrirSess
"     :aunmenu ToolBar.EnregSess
"     :aunmenu ToolBar.LancScript
"     :aunmenu ToolBar.CréerEtiqu
"     :aunmenu ToolBar.AllerEtiqu
"     :aunmenu ToolBar.Aide
"     :aunmenu ToolBar.CherchAide
"     :aunmenu ToolBar.Make
"     :aunmenu ToolBar.-sep1-
"     :aunmenu ToolBar.-sep2-
"     :aunmenu ToolBar.-sep3-
"     :aunmenu ToolBar.-sep5-
"     :aunmenu ToolBar.-sep6-
"     :aunmenu ToolBar.-sep7-
"     " Separateur
"     :amenu ToolBar.-sep_1- :
"     " HSplit
"     ":amenu icon=/usr/share/icons/gnome/22x22/actions/object-flip-vertical.png ToolBar.Split :split<cr>
"     ":tmenu ToolBar.Split Sépare la fenêtre horizontalement
"     " Vsplit
"     ":amenu icon=/usr/share/icons/gnome/22x22/actions/object-flip-horizontal.png ToolBar.VSplit :vsplit<cr>
"     ":tmenu ToolBar.VSplit Sépare la fenêtre verticalement
"     " NERDTreeMirrorToggle
"     :amenu icon=/usr/share/icons/gnome/22x22/actions/go-first.png ToolBar.NERDTreeMirrorToggle :NERDTreeMirrorToggle<cr>
"     :tmenu ToolBar.NERDTreeMirrorToggle Toggle Tree pane
"     " ResyncSyntax
"     :amenu icon=/usr/share/icons/gnome/22x22/actions/format-justify-left.png ToolBar.ResyncSyntax :syntax sync fromstart<cr>
"     :tmenu ToolBar.ResyncSyntax Resynchronize syntax highlighting from start
"     " SyntasticToggleMode
"     :amenu icon=/usr/share/icons/gnome/22x22/actions/gtk-spell-check.png ToolBar.SyntasticToggleMode :SyntasticToggleMod<cr>
"     :tmenu ToolBar.SyntasticToggleMode Toggle syntax check
"     " Separateur
"     :amenu ToolBar.-sep_2- :
"     " Close tab
"     :amenu icon=/usr/share/icons/gnome/22x22/actions/gtk-close.png ToolBar.Close :close<cr>
"     :tmenu ToolBar.Close Close current window
endif


" =================================
" Statusline personnalisee (deluxe)
" =================================
if has('statusline')
  " set statusline=[%n]\ %<%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ %P
    set statusline=[%n]\ %<%F\ \ %=%-19(\LINE\ %3l[%02c%03V]/%3L%)\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ %P
    set laststatus=2 " Statusline on all windows
    set ruler " Where am I
    set ch=4 " Make command line two lines high
    set shm="aAI" " What will be shown on the commandline
    set showcmd " show partial commands in status line and selected characters/lines in visual mode
endif


" ==========================
" Fichiers de backup et swap
" ==========================
set nobackup " insecure on production servers, and problematic with NFS
" Swapdir dans ~/.vim/swap
if filewritable(expand("~/.vim/swap/.vim/swap")) == 2
else
    if has("unix") || has("win32unix")
        " call system("ln -s /dev/shm $HOME/.vim/swap")
    endif
endif
call system("mkdir -p $HOME/.vim/swap && chmod 700 $HOME/.vim/swap")
set dir=$HOME/.vim/swap
" Persistent undo
"if filewritable(expand("~/.vim/undodir/.vim/undodir")) == 2
"else
    "if has("unix") || has("win32unix")
        "call system("ln -s /Volumes/ramdisk $HOME/.vim/undodir")
    "endif
"endif
"try
    "call system("mkdir -p $HOME/.vim/undodir && chmod 700 $HOME/.vim/undodir")
    "set undodir=$HOME/.vim/undodir
    "set undofile
"catch
"endtry
if filewritable(expand("~/.vim/undodir")) == 2
else
    if has("unix") || has("win32unix")
        call system("mkdir -p $HOME/.vim/undodir")
    endif
endif
try
    call system("mkdir -p $HOME/.vim/undodir && chmod 700 $HOME/.vim/undodir")
    set undodir=$HOME/.vim/undodir
    set undofile
catch
endtry


" =====================================
" CORRECTION ORTHOGRAPHIQUE EN FRANCAIS
" =====================================
" if version >= 500
"   if filereadable(expand("/usr/share/vim/vimcurrent/spell/fr.utf-8.spl"))
"   else
"     mkspell /tmp/fr /usr/share/dict/french
"     call system("sudo /bin/mv /tmp/fr.utf-8.spl /usr/share/vim/vimcurrent/spell/")
"   endif
" endif
" desactive pour eviter les faux positifs lors des comparaisons !
" setlocal spell spelllang=fr
set nospell " spell checking off


" autocompletion

" =======
" Plugins
" =======
" pour PhpDoc : Ctrl+P en mode insert génère le docblock d'une fonction...
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
" pour ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra' " the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" tagbar
nmap <F8> :TagbarToggle<CR>


" ========================
" Commandes personnalisees
" ========================
if version >= 500
    " necessite : sudo apt-get install php-xsl php-pear
    " necessite : sudo pear install php_beautifier
    " ... voire : sudo pear install channel://pear.php.net/php_beautifier-0.1.14
    " ... ou    : sudo pear install PHP_Beautifier-0.1.14
    " command Validate :%s/<?=\(.?*[^;]*\) *?>/<?php echo \1; ?>/g
    function! Validate()
        :%s/<?\//<?php\//g
        :%s/<?php */<? /gi
        :%s/<?=\(.?*[^;]*\)[\n ]* *?>/<? echo \1; ?>/g
        :%s/<? /<?php /g
        :%s/<?$/<?php/g
        :%!php_beautifier
        :%s/  *$//g
        :set et
        :retab
        gg=G
    endfunction
    " reformatte le code PHP avec <C-I>
    map <C-I> :%! php_beautifier --filters "ArrayNested() Lowercase() Pear(newline_class=true,newline_function=true,switch_without_indent=false) NewLines(before=if:switch:T_COMMENT)" 2>/dev/null <CR>
    " save as root
    cmap w!! %!sudo tee > /dev/null %

    " format PHP code with php-auto-indent
    func! PHPAutoIndent(mode) range
        :set ff=unix
        if (a:mode == 'visual')
            :exe "'<,'>!php-auto-indent -"
        else
            :exe "%!php-auto-indent -"
        endif
    endfunc
    noremap <c-b> :call PHPAutoIndent('normal')<CR>
    vnoremap <c-b> :call PHPAutoIndent('visual')<CR>

    "--------------------
    " Function: Open tag under cursor in new tab
    " Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
    "--------------------
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

endif

" Touche TAB améliorée
" map Control + F10 to Vtree
map <c-f10> <esc>:vsp<cr>:VTree<cr>
" retours a la ligne DOS => UNIX
noremap <C-f1> mt:%s/$//g<CR>`t
inoremap <C-f1> <ESC>mt:%s/$//g<CR>`ta
noremap <C-f5> :w<CR>:!wmctrl -a Iceweasel && sleep 0.1 && xdotool key "ctrl+F5" && wmctrl -a GVIM<CR><CR>
inoremap <C-f5> <ESC>:w<CR>:!wmctrl -a Iceweasel && sleep 0.1 && xdotool key "ctrl+F5" && wmctrl -a GVIM<CR><CR>
" space+l = <a href> avec clipboard (source. http://robertnyman.com/2014/10/16/getting-started-with-understanding-the-power-of-vim/)
vmap <Space>l c<a href="<C-r>+"><C-r>"</a>

" Pour aller plus loin : http://amix.dk/vim/vimrc.html

function CheckSpam() range
  echo system('postcat -q '.shellescape(join(getline(a:firstchar, a:lastchar), "\n")).' | spamc -c ')
endfunction


" Plugin Taglist
" nmap <S-F4> :TlistToggle<cr>
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" let Tlist_WinWidth = 40
" let Tlist_Process_File_Always = 1

" Plugin Tagbar avec phpctags
let g:tagbar_phpctags_bin="$HOME/.vim/bundle/phpctags/phpctags"
let g:tagbar_phpctags_memory_limit = '512M'
nmap <F8> :TagbarToggle<CR>

" NerdTree
" autocmd VimEnter * NERDTree
" autocmd BufAdd * NERDTreeMirror
" autocmd BufEnter * NERDTreeMirror
" autocmd BufNewFile * edit .
" let g:NERDTreeWinPos = "right"
let g:NERDTreeMouseMode = 3 " single click
let g:nerdtree_tabs_open_on_gui_startup = 0 " start closed

" Syntastic
" let g:syntastic_phpcs_disable = 1
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_tidy_ignore_errors=[ " proprietary attribute \"ng-", "<ons-", "discarding unexpected </ons-" ]


" phpErrorMarker
" let g:phpErrorMarker#automake = 1
" let g:phpErrorMarker#openQuickfix = 1

" php man pages
" # sudo pear install doc.php.net/pman
set keywordprg=pman

autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
" highlight! link DiffText MatchParen




" ==============
" Autocompletion
" ==============
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

runtime! macros/matchit.vim
