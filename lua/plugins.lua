require("packer").init({
	git = {
		cmd = 'git', -- The base command for git operations
		subcommands = {
			-- Format strings for git subcommands
			update         = 'pull --ff-only --progress --rebase=false',
			install        = 'clone --depth %i --no-single-branch --progress',
			fetch          = 'fetch --depth 999999 --progress',
			checkout       = 'checkout %s --',
			update_branch  = 'merge --ff-only @{u}',
			current_branch = 'branch --show-current',
			diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
			diff_fmt       = '%%h %%s (%%cr)',
			get_rev        = 'rev-parse --short HEAD',
			get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
			submodules     = 'submodule update --init --recursive --progress'
		},
		depth = 1,                                 -- Git clone depth
		clone_timeout = 60000,                     -- Timeout, in seconds, for git clones
		default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
	},
})

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- File Manager
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- to see file icons
		}
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- ColorScheme tokionigth
	use 'folke/tokyonight.nvim'

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}

	-- Languaje parser
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	}

	-- Git
	use('tpope/vim-fugitive')

	-- ChatGpt
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup()
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	})

	use({
		"Bryley/neoai.nvim",
		require = { "MunifTanjim/nui.nvim" },
	})


	-- Starup home screen Neovim
	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	}

	-- Editor
	-- -- Comments
	use('terrortylor/nvim-comment')
	-- -- Autoclose Tags
	-- 

	use('windwp/nvim-ts-autotag')
end)
