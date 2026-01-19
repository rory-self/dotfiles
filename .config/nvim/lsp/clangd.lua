return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
  init_options = {
    fallbackFlags = { "-std=c++23" },
  },
}
