return {
    'lewis6991/gitsigns.nvim',
    enabled = true,
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('gitsigns')
            .setup()
    end
}
