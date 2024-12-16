return {
    'mbbill/undotree',
    enabled = true,
    keys = { { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle undotree' }, },
  config = function()
        vim.g.undotree_WindowLayout = 2
  end
}

