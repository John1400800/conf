return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  capabilities = {
    experimental = {
      serverStatusNotification = true,
    },
  },
  -- settings = {
  --   ["rust-analyzer"] = {
  --     -- Add any rust-analyzer specific settings here.
  --   },
  -- },
  before_init = function(init_params, config)
    -- Pass settings as initialization options.
    if config.settings and config.settings["rust-analyzer"] then
      init_params.initializationOptions = config.settings["rust-analyzer"]
    end
  end,
}
