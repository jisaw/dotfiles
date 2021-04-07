lua require("jisaw")

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>cm <cmd>Telescope git_commits<cr>
nnoremap <leader>ps :lua require('telescope').extensions.fzf_writer.staged_grep()<CR>

"nnoremap <C-p> :Files<CR>
"nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>cm :Commits<CR>


