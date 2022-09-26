@ECHO off

echo "Please cd to %userprofile%\AppData\Local\nvim and comment out lua requires, and uncomment source lines"
del %userprofile%\AppData\Local\nvim
copy windowsNvim %userprofile%\AppData\Local\nvim
git clone https://github.com/dracula/vim.git %userprofile%\AppData\Local\nvim\pack\themes\start
