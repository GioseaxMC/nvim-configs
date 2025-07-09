vim.cmd [[packadd packer.nvim]]

require('packer').startup( function(use)
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    -- use 'nvim-treesitter/nvim-treesitter'
    use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'
    use 'blazkowolf/gruber-darker.nvim'
    use 'nvim-lualine/lualine.nvim'
    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
end)

-- local cmp = require("cmp")

-- local function get_buffer_name(bufnr)
--   local name = vim.api.nvim_buf_get_name(bufnr)
--   return vim.fn.fnamemodify(name, ":t")  -- get tail (filename only)
-- end
-- 
-- local function find_first_line(bufnr, word)
--   local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
--   for _, line in ipairs(lines) do
--     if line:find(vim.pesc(word), 1, true) then
--       return line
--     end
--   end
--   return nil
-- end

-- cmp.setup({
--   formatting = {
--     format = function(entry, vim_item)
--       if entry.source.name == "buffer" then
--         local word = entry:get_completion_item().word or entry:get_completion_item().label
--         for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--           if vim.api.nvim_buf_is_loaded(bufnr) then
--             local line = find_first_line(bufnr, word)
--             if line then
--               local bufname = get_buffer_name(bufnr)
--               vim_item.menu = string.format("[%s] %s", bufname, line)
--               return vim_item
--             end
--           end
--         end
--         vim_item.menu = "[buffer]"
--       end
--       return vim_item
--     end,
--   },
    
--     mapping = cmp.mapping.preset.insert({
--         ['<C-o>'] = cmp.mapping.complete(),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }),
--         ['<Tab>'] = cmp.mapping.select_next_item(),
--         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     }),
-- 
--   sources = {
--     {
--       name = "buffer",
--       max_item_count = 6,
--       option = {
--         get_bufnrs = function()
--           return vim.api.nvim_list_bufs()
--         end,
--       },
--     },
--   },
-- })
 
require('lualine').setup {}

require('gruber-darker').setup {
    italic = {
        comments = 0,
        strings = 0,
        folds = 0,
    }
}

-- require('telescope').setup{}

local ok, _ = pcall(vim.cmd, 'colorscheme gruber-darker')

vim.cmd([[
  autocmd BufRead,BufNewFile *.sw set filetype=swami
  autocmd BufRead,BufNewFile *.ll set filetype=llvm
]])

if not ok then
    vim.cmd[[colorscheme gruvbox]]
end

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.virtualedit = "onemore"

vim.opt.cursorline = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true
  end,
})

vim.g.netrw_winsize = 80
vim.g.netrw_browse_split = 2
vim.g.netrw_change_dir = 1

vim.o.guicursor = "n-v-c:block-blinkon500-blinkoff500-blinkwait500,i-ci-ve:ver25-blinkon500-blinkoff500-blinkwait500"



vim.keymap.set('t', '<C-w>h', "<C-\\><C-n><C-w>h",{silent = true})
vim.keymap.set('t', '<C-Space>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true })

vim.cmd [[noremap  <M-j>  :m+1<CR>]]
vim.cmd [[noremap  <M-k>  :m-2<CR>]]
vim.cmd [[inoremap <M-j>  <Esc>:m+1<CR>a]]
vim.cmd [[inoremap <M-k>  <Esc>:m-2<CR>a]]
vim.cmd [[xnoremap <M-k>  :'<,'>m'<-2<CR>gv=gv]]
vim.cmd [[xnoremap <M-j>  :'<,'>m'>+1<CR>gv=gv]]

-- vim.cmd [[xnoremap <C-d> :<C-u>'<,'>t'> | normal! gv<CR>]]
vim.cmd [[noremap  <C-d>  :t.<CR>]]
vim.cmd [[inoremap <C-d>  <Esc>:t.<CR>a]]
vim.cmd [[xnoremap <C-d>  :'<,'>t'><CR>]]

vim.cmd [[noremap  <C-a>  gg0VG$]]
vim.cmd [[inoremap <C-a>  <Esc>gg0VG$]]

vim.cmd [[noremap  <M-BS> :normal db<CR>]]
vim.cmd [[inoremap <M-BS> <Esc>l:normal db<CR>i]]

vim.cmd [[noremap  <F5>   :w<CR>]]
vim.cmd [[inoremap <F5>   <Esc>:w<CR>a]]

vim.cmd [[noremap  <F1>   :Telescope<CR>]]
