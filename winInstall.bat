@ECHO off

del %userprofile%\AppData\Local\nvim
copy windowsNvim %userprofile%\AppData\Local\nvim
git clone https://github.com/dracula/vim.git dracula %userprofile%\AppData\Local\nvim\pack\themes\start
