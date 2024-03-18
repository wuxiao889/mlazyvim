local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons

local ui_diagnostics = {
  "diagnostics",
  symbols = {
    error = icons.diagnostics.Error,
    warn = icons.diagnostics.Warn,
    info = icons.diagnostics.Info,
    hint = icons.diagnostics.Hint,
  },
}

local ui_diff = {
  "diff",
  symbols = {
    added = icons.git.added,
    modified = icons.git.modified,
    removed = icons.git.removed,
  },
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
}

local show = function()
  local max_width = vim.o.columns
  local current_width = vim.api.nvim_win_get_width(0)
  return current_width > max_width / 2
end

local ui_filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  newfile_status = false, -- Display new file status (new file means no write after created)
  path = 0, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- 3: Absolute path, with tilde as the home directory
  -- 4: Filename and parent dir, with tilde as the home directory

  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
    newfile = "[New]", -- Text to show for newly created file before first write
  },
}

local ui_lsp = function()
  local original_bufnr = vim.api.nvim_get_current_buf()
  local buf_clients = vim.lsp.get_active_clients({ bufnr = original_bufnr })
  if next(buf_clients) == nil then
    return ""
  else
    return tostring(buf_clients[1].name)
  end
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          theme = "auto",
          globalstatus = false,
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "alpha",
              "starter",
            },
          },
          -- always be drawn as inactive statusline
          ignore_focus = {
            "help",
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { ui_diff, { "branch" , cond = show} },
          lualine_c = {
            ui_filename,
          },
          lualine_x = {
            -- -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = Util.ui.fg("Statement"),
            -- },
            -- -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.mode.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            --   color = Util.ui.fg("Constant"),
            -- },
            -- for nvim-dap
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = Util.ui.fg("Debug"),
            },
            ui_diagnostics,
            { "fileformat", cond = show },
            { "encoding", cond = show },
            { ui_lsp, cond = show },
            { "filetype", icon_only = false },
          },
          lualine_y = {
            { "progress", separator = " " },
          },
          lualine_z = {
            { "location" },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
