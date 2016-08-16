" Caesar Kabalan
" Critical Stuff {{{
	" Enabled vim's new features over vi. Technical Pointless in a user vimrc.
	set nocompatible
	" Load Plugins
	execute pathogen#infect()
	execute pathogen#helptags()
	" Enable Mouse support
	set mouse=a
	" Make Backspace work like most other applications
	set backspace=2
	" Set the vim command history length
	set history=1000
" }}}
" Visual Settings {{{
	" Enable Syntax Highlight
	syntax on
	" Enable 256 Colors in vim
	set t_Co=256
	" Set the colorscheme
	colorscheme molokai
	" Change the encoding so font show correctly
	set encoding=utf-8
	" If we're using gVim
	if has("gui_running")
		" Set the font to Consolas, Size 10, Bold
		set guifont=Consolas:h10:b:cANSI
		" Maximize the window
		au GUIEnter * simalt ~x
	endif
" }}}
" General Shortcuts {{{
	" Set <Leader> to ,
	let mapleader=","
	" Shortcut - Change Tabs
	map <C-t><up> :tabr<cr>
	map <C-t><down> :tabl<cr>
	map <C-t><left> :tabp<cr>
	map <C-t><right> :tabn<cr>
	" Shortcut - Undo
	map <C-z> :undo
	" Move vertically by visual line
	nnoremap j gj
	nnoremap k gk
	inoremap jk <esc>
	" Map <Leader>u to undo tree
	nnoremap <leader>u :GundoToggle<CR>
" }}}
" Text Editing {{{
	" Set up Tabs
	set tabstop=4
	set ts=4
	set autoindent
	set smartindent
	set shiftwidth=4
	set scrolloff=10
	" Automatically insert the comment leader on new line (o/O)
	autocmd FileType * setlocal fo-=r fo-=o
" }}}
" Folding {{{
	set foldenable
	set foldlevelstart=10
	set foldnestmax=10
	set foldmethod=indent
	" Comment this out if you're security concious
	" This setting forces modeline on for root
	set modeline
" }}}
" Line Numbers {{{
	set number
	set relativenumber
" }}}
" EasyMotion {{{
	" EasyMotion defaults to <Leader><Leader>motion (\\w), this changes it back to
	" <Leader>motion (\w)
	map <Leader> <Plug>(easymotion-prefix)
	" EasyMotion for hjkl movement
	map <Leader>l <Plug>(easymotion-lineforward)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	map <Leader>h <Plug>(easymotion-linebackward)
	" keep cursor column when JK motion
	let g:EasyMotion_startofline = 0 
	" EasyMotion <Leader>/ for search
	map <Leader>/ <Plug>(easymotion-sn)
	omap <Leader>/ <Plug>(easymotion-sn)
	map n <Plug>(easymotion-next)	" EasyMotion next in search
	map N <Plug>(easymotion-prev)	" EasyMotion prev in search
" }}}
" NERDTree {{{
	" Automatically open NERDTree with specific settings
	let g:nerdtree_tabs_open_on_console_startup=1
	let g:NERDTreeDirArrows=0
	let g:NERDTreeShowHidden=1
	autocmd VimEnter *
		\	if !argc()
		\ |		Startify
		\ |		NERDTree
		\ |		wincmd w
		\ |		execute "normal \<C-U>"
		\ |	endif
" }}}
" Airline {{{
	" Enable Airline's Tab Bar
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='molokai'
" }}}
" Startify {{{
	highlight StartifyHeader ctermfg=10
	let g:startify_list_order = [
		\ ['   Bookmarks'], 'bookmarks',
		\ ['   Most Recently Used Files'], 'files',
		\ ['   Recently Modified In Current Directory'], 'dir',
		\ ['   Commands'], 'commands',
		\ ['   Sessions'], 'sessions']
	let g:startify_bookmarks=['~/.bashrc', '~/.vim/vimrc']
	function! s:filter_header(lines) abort
		let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
		let centered_lines = map(copy(a:lines),
			\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
		return centered_lines
	endfunction
	let g:ascii_header_plaintext = s:filter_header([
		\ '                                                                               ',
		\ '                                                                               ',
		\ '                                     .%(##                                     ',
		\ '        %@@@@@@@@@@@@@@@@@@@@@@@@@   %***###      @@@@@@@@@@@@@@@@@@@@@@@@@    ',
		\ '        @%%%%%%%%%%%%%%%%%%%%%%%%.*  ******###   @%%%%%%%%%%%%%%%%%%%%%%%%(/   ',
		\ '        @%%%%%%%%%%%%%%%%%%%%%%%%.*  ********##  @%%%%%%%%%%%%%%%%%%%%%%%% /   ',
		\ '        %///* %%%%%%%%%%%%%%//////   **********   &///%%%%%%%%%%%%%%%%%%.//    ',
		\ '            @ %%%%%%%%%%%%%%//,    *************,   &@@%%%%%%%%%%%%%%%*//      ',
		\ '            @ %%%%%%%%%%%%%%//,  ***************  &@@%%%%%%%%%%%%%%%(//        ',
		\ '            @ %%%%%%%%%%%%%%//,  *************  (@@#%%%%%%%%%%%%%%%//          ',
		\ '            @ %%%%%%%%%%%%%%//,  **********,  &@@(%%%%%%%%%%%%%%%//            ',
		\ '            @ %%%%%%%%%%%%%%//,  *********  #@@/%%%%%%%%%%%%%%%//              ',
		\ '            @ %%%%%%%%%%%%%%//,  *******  &@@*%%%%%%%%%%%%%%%//                ',
		\ '            @ %%%%%%%%%%%%%%//,  ****,  #@@,%%%%%%%%%%%%%%%//                  ',
		\ '            @ %%%%%%%%%%%%%%//,  **,  @@@.%%%%%%%%%%%%%%%//   *##(             ',
		\ '            @ %%%%%%%%%%%%%%//,     @@@.%%%%%%%%%%%%%%%//   *****###           ',
		\ '            @ %%%%%%%%%%%%%%//,   @@@ %%%%%%%%%%%%%%%,/.  ,********##(         ',
		\ '       ,%%  @ %%%%%%%%%%%%%%//, @@@ %%%%%%%%%%%%%%%,/,  *************###       ',
		\ '      %%,*  @ %%%%%%%%%%%%%%// @@.%%%%%%%%%%%%%%% /*  .****************##(     ',
		\ '   ,%%****  @ %%%%%%%%%%%%%%/*@.%%%%%%%%%%%%%%% //  .********************###   ',
		\ '   ,,,****  @ %%%%%%%%%%%%%%/,%%%%%%%%%%%%%%% //   ********************** ,.   ',
		\ '     ,,,**  @ %%%%%%%%%%%%%%%%%%%%%%%%%%%%% //   ********************** ,.     ',
		\ '       ,,,  @ %%%%%%%%%%%%%%%%%%%%%%%%%%       ********************** ,.       ',
		\ '         ,  @ %%%%%%%%%%%%%%%%%%%%%%%%% %%%%% ********************* ,.         ',
		\ '            @ %%%%%%%%%%%%%%%%%%%%%%%% .%%%% .******************* ,.           ',
		\ '            @ %%%%%%%%%%%%%%%%%%%%%%//   ********************** ,.             ',
		\ '            @ %%%%%%%%%%%%%%%%%%%%.         **       ****      .               ',
		\ '            @ %%%%%%%%%%%%%%%%%%// %%%%%%% ,* %%%%%%%    %%%%%%   %%%%%%%      ',
		\ '            @ %%%%%%%%%%%%%%%%//   * %%%%% *** %%%%%%%%%%%%%%%%%%%%%%%%%       ',
		\ '            @ %%%%%%%%%%%%%%//   ** %%%%% ***, %%%%      %%%%      %%%%%       ',
		\ '            @ %%%%%%%%%%%%//   *** #%%%% ,*** %%%% .* , %%%%%      %%%%        ',
		\ '            @ %%%%%%%%%%*/   ****. %%%%# *** #%%%%  ,,  %%%%      %%%%/        ',
		\ '            @ %%%%%%%%./   ,,.*** %%%%% ***. %%%% ,.   %%%%,     %%%%%         ',
		\ '            @ %%%%%% /       ,,. %%%%%  *** %%%%.      %%%%      %%%%          ',
		\ '             @//////             %%%%%%* * %%%%%%     %%%%%*    %%%%%%         ',
		\ '                                 ,,,******* ,.                                 ',
		\ '                                   ,,.*** ,.                                   ',
		\ '                                     ,,.,.                                     ',
		\ '                                       ,                                       '])

	let g:ascii_header_shading = s:filter_header([
		\ '                                                                                ',
		\ '                                        ▄                                       ',
		\ '                                     ,▄▀██▄                                     ',
		\ '       ▄█████████████████████████████▀░░▓▒▀█▄   ▄████████████████████████████▄  ',
		\ '      ██▀¿ªªªªªªªªªªªªªªªªªªªªªªª≡▄███▓▓▓▓▓▒▒█▄███ ªªªªªªªªªªªªªªªªªªªªªªªΣ,██▌ ',
		\ '      ██.▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╣███▓▓▓▓▓▓▓▒▒███]▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌██▌ ',
		\ '      ██▄╙▄▄▄@░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓▓▓╗╢███▓▓▓▓▓▓▓▓▓███ ▒▓▓▄░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╣██▌ ',
		\ '       ▀█████ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓██████▓▓▓▓▓▓▓▓▓▓▓█████▀ ║▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▓╢███▀  ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▀ ,ª░▒▒▒▒▒▒▒▒▒▒▒▒░▄▓╢███     ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓▓▓▓▓███▀ ,▒░▒▒▒▒▒▒▒▒▒▒▒▒░▄▓╢██▀       ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓▓▓███  ╓▒░▒▒▒▒▒▒▒▒▒▒▒▒░g╣▄██▀         ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓▓▓▓██▀  ╒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░╣╢███▀           ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓▓▓███▀  ╔▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╣███▀             ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓▓▓███▀  f▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╢███▀█▄             ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓███▓███▀ ,ª░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╢███▓▓▓▒▒█▄           ',
		\ '         ▄██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓█████  ,▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▄▓╢███▓▓▓▓▓▓▓▒▒█▄         ',
		\ '       ▄█░██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓██▀  ╓▒░▒▒▒▒▒▒▒▒▒▒▒▒░▄▓▄███▓▓▓▓▓▓▓▓▓▓▓▒▒██▄      ',
		\ '    ,▄▀░░▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓▀  ╒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░@▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▀█▄    ',
		\ '  ▄█▀░░▓▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▀ ╔▒▒▒▒▒▒▒▒▒▒▒▒▒▒░@╣████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▀█▄  ',
		\ " '██▓█▓▓▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓φ▒▒▒▒▒▒▒▒▒▒▒▒▒▒░╣╢████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████` ",
		\ '    ▀█▓▓▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒░╣╢████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█▀`   ',
		\ '      ▀█▓▓██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄█▀▀▀▀█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▀      ',
		\ '        ▀███▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▀        ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▓██▄▄▄██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▀          ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▄▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▀            ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░g▓█▀▀▀▀▀▀▀██▓█▀▀▀▀▀▀█████▀▀▀▀▀███▄▀▀▀▀▀▀█      ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░@╢█████▒▒▒▒██▓▓██░▒▒▒▒▒░░░░▒▒▒▒▒░░░░▒▒▒▒▒▒█▌     ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒▒▒░▓╢████▓█░▒▒▒░█▓▓▓█▌▒▒▒░██████▒▒▒▒██████░▒▒▒▐█      ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒▒▒░▓╢████▓▓█░▒▒▒░█▓▓▓██░▒▒░█▓▓███░▒▒▒▐▌   █░▒▒▒░█       ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▒▒░▓╢███▓▓▓▓█▌▒▒▒▒██▓▓▓█░▒▒▒██████▌▒▒▒░█   ▐█▒▒▒▒█▌       ',
		\ '          ██▌ ░▒▒▒▒▒▒▒▄▓▄███▓▓▓▓▓██▒▒▒▒██▓▓▓█░▒▒▒▐█▓████▒▒▒░█   ,█░▒▒▒▐█        ',
		\ '          ██▌ ░▒▒▒▒▒▄▓███▀  ▀█▓▓██░▒▒▒░██▓▓█▌▒▒▒░██▀` █░▒▒▒██▄  █░▒▒▒░█▄        ',
		\ '          ▀████████████▀      ▀██▄▄▄▄▄▄▄█▓▓█▄▄▄▄▄██  ▐█▄▄▄▄▄█  ▐█▄▄▄▄▄▄█        ',
		\ '             ▀▀▀▀▀▀▀▀▀          ▀██▓▓▓▓▓▓▓▓████▀                                ',
		\ "                                  '██▓▓▓▓████▀                                  ",
		\ '                                     ▀█▓███                                     ',
		\ '                                       ▀▀                                       '])
	let g:startify_custom_header = g:ascii_header_shading
" }}}
" vim:foldmethod=marker:foldlevel=0
