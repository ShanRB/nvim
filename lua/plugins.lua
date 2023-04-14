local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here

    -- basics
    use 'lewis6991/impatient.nvim' -- increase loading speed
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins
    use "numToStr/Comment.nvim"  -- comments
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use "folke/which-key.nvim"
    use "rcarriga/nvim-notify"

    -- File Explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Terminal
    use { "akinsho/toggleterm.nvim" }

    -- Project
    use "ahmedkhalf/project.nvim"

    -- appearance
    use 'folke/tokyonight.nvim'
    use { 'nvim-lualine/lualine.nvim' }
    use "goolord/alpha-nvim" -- welcome page

    -- cmp plugins
    use "hrsh7th/nvim-cmp"       -- The completion plugin
    use "hrsh7th/cmp-buffer"     -- buffer completions
    use "hrsh7th/cmp-path"       -- path completions
    use "hrsh7th/cmp-cmdline"    -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"   --lsp completions

    -- snippets
    use "L3MON4D3/LuaSnip"           --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use { "williamboman/mason.nvim", run = ":MasonUpdate" }
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"         -- enable LSP
    use "jay-babu/mason-null-ls.nvim"  -- mason extension for null-ls
    use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions
    use "RRethy/vim-illuminate"

    -- Debugger
    use "mfussenegger/nvim-dap"
    use "jay-babu/mason-nvim-dap.nvim"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Fuzzy finder
    use { "nvim-telescope/telescope.nvim", tag = "0.1.1" }
    use { "nvim-telescope/telescope-media-files.nvim" }

    -- Tree sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "p00f/nvim-ts-rainbow"
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- git
    use { 'lewis6991/gitsigns.nvim' }

    -- markdown
    --[[ use {'iamcco/markdown-preview.nvim'} ]]
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
