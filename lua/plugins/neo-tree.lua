return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = {
      visible = true, -- This makes hidden files visible by default
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
      hide_by_name = {
        -- "node_modules"
      },
      hide_by_pattern = {
        -- "*.meta",
        -- "*/src/*/tsconfig.json",
      },
      always_show = {
        -- ".gitignored",
      },
      never_show = {
        ".DS_Store",
        "node_modules",
        -- "thumbs.db"
      },
      never_show_by_pattern = {
        -- ".null-ls_*",
      },
    }

    -- Add the new 'open_with_finder' command
    opts.commands = opts.commands or {}
    opts.commands.open_with_finder = function(state)
      local node = state.tree:get_node()
      if node then
        local path = node:get_id()
        vim.fn.jobstart({ "open", "-R", path }, { detach = true })
      end
    end

    -- Add the new mapping
    opts.window = opts.window or {}
    opts.window.mappings = vim.tbl_deep_extend("force", opts.window.mappings or {}, {
      ["O"] = "open_with_finder",
    })

    return opts
  end,
}
