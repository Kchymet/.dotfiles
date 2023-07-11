-- configure wsl clipboard IFF we're on WSL without tmux.
if vim.fn.has("wsl") and not os.getenv("TMUX") then
    vim.g.clipboard = {
         name = 'wslClipboard',
         copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
          },
         paste = {
             ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
             ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
         },
         cache_enabled = 1,
       }
end
