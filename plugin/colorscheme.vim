if has('termguicolors')
  set termguicolors
endif
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme base16-tomorrow-night

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_tomorrow'
