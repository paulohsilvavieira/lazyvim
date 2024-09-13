
return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = false,
  },  
  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
  end,
  keys={
    {
      "<leader>fp",  ":lua require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown{previewer = false})<CR>", {silent=true, desc='Find Projects'}
    }
  }

}