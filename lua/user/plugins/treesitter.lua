return {
	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
        version = false,
		build = ":TSUpdate",
	},
	"p00f/nvim-ts-rainbow",
	"windwp/nvim-autopairs",
	"JoosepAlviste/nvim-ts-context-commentstring",
}
