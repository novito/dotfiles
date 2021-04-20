# dotfiles
My dotfiles using dotbot 

In order to make NVM work with fish, one must do:

```
git clone https://github.com/edc/bass.git
cd bass
make install
```

Open ```~/.config/fish/config.fish``` and add

```
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
```
