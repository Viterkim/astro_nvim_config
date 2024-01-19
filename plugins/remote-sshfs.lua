return {
  {
    "nosduco/remote-sshfs.nvim",
    config = function()
      local api = require('remote-sshfs.api')

      require('remote-sshfs').setup({
        ui = {
          confirm = {
            connect = false, -- prompt y/n when host is selected to connect to
            change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
          },
        },
        handlers = {
            on_connect = {
              change_dir = true, -- when connected change vim working directory to mount point
            },
            on_disconnect = {
              clean_mount_folders = true, -- remove mount point folder on disconnect/unmount
            },
          },
      })

      -- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
      local builtin = require("telescope.builtin")
      local connections = require("remote-sshfs.connections")
      vim.keymap.set("n", "<leader>ff", function()
        if connections.is_connected then
          api.find_files()
        else
          builtin.find_files()
        end
      end, {})
      vim.keymap.set("n", "<leader>fg", function()
        if connections.is_connected then
          api.live_grep()
        else
          builtin.live_grep()
        end
      end, {})
    end,
  }
}
