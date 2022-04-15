@ECHO off

del ~\AppData\Local\nvim
copy windowsNvim ~\AppData\Local\nvim
git clone https://github.com/dracula/vim.git dracula ~\AppData\Local\nvim\pack\themes\start
