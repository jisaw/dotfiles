 lua require("jisaw")
" 
 nnoremap <C-p> <cmd>Telescope git_files<cr>
 nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
 nnoremap <leader>cm <cmd>Telescope git_commits<cr>
 nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

 nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
 nnoremap <leader>df :lua require('jisaw.telescope').search_dotfiles()<CR>

" nnoremap <C-p> :Files<CR>
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>cm :Commits<CR>


