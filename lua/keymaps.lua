local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Leader on ,
map('n', ',', '<leader>', {})

-- Системный буфер обмена shift - Y
map('v', '<S-Y>', '"*y', default_opts)
map('n', '<S-Y>', '"*y', {noremap = true})
-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', default_opts)
map('n', '<leader>fn', '<cmd>Telescope file_browser<cr>', default_opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', default_opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', default_opts)
map('n', '<leader>fiw', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
map('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').treesitter{}<cr>]], default_opts)

-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F11> Проверка орфографии  для русского и английского языка
map('i', '<F11>', ':set spell!<CR>', {})

-- Move on windows
vim.cmd([[
map <silent> <M-h> :call WinMove('h')<CR>
map <silent> <M-j> :call WinMove('j')<CR>
map <silent> <M-k> :call WinMove('k')<CR>
map <silent> <M-l> :call WinMove('l')<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
]])
