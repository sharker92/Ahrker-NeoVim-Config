return {
    {
        'morhetz/gruvbox',
        config = function()
            vim.o.background = 'light'
            vim.g.gruvbox_contrast_dark = 'hard'
            vim.g.gruvbox_contrast_light = 'hard'
            vim.cmd('colorscheme gruvbox')
        end
    }
}
