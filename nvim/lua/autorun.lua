--Inspired by Youtube video by TJ DeVries

local attach_to_buffer = function(output_bufnr, command)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("AutosaveTest", { clear = true }),
    -- pattern = pattern, -- if pattern is passed as an additional input parameter
    pattern = {"*.py"},
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
      end
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end,
  })
end

vim.api.nvim_create_user_command("AutoRun",
  function()
    -- local pattern = vim.fn.input "Pattern: "
    local command = vim.split(vim.fn.input "Command: ", " ")
    vim.cmd('vnew')
    local bufnr = vim.api.nvim_get_current_buf()
    attach_to_buffer(bufnr, command)
    vim.cmd('wincmd h')
  end,
  {}
)
