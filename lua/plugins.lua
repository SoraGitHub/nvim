local packer = require("packer")

packer.startup(
  function(use)
   -- Packer 可以管理自己本身
   use 'wbthomason/packer.nvim'
   -- 你的插件列表 - plugins
   --
    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -------------------------------------------------------

    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")

    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    --------------------- LSP --------------------
    use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })

    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

    -- ui
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    use("tami5/lspsaga.nvim" )

    -- JSON 增强
    use "b0o/schemastore.nvim"

    -- nvim-autopairs
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
      end
    }

    -- Comment
    use("numToStr/Comment.nvim")

    -- surround
    use("ur4ltz/surround.nvim")
end)


-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
