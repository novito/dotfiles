echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "Joan Roig Arderiu"
git config --global user.email roigarderiu@gmail.com

echo "Installing some brew stuff"
brew install node

echo "Installing Fish shell"
brew install fish

# Install this too https://github.com/jorgebucaran/hydro

echo "Installing nvim (unstable release)"
brew install --HEAD nvim

echo "Installing chezmoi"
brew install chezmoi

echo "Installing tmux"
brew install tmux

echo "Initialize chezmoi with dotfiles (this might not be idempotent, gotta check")
chezmoi init git@github.com:novito/dotfiles.git

echo "Installing Hack Nerd Font (needed for proper UI in nvim - Remember to set it in iterm2)"
brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font

# UI Apps
apps=(
  firefox
  google-chrome
  spotify
  iterm2
  zoomus
  onepassword
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
brew install --appdir="/Applications" ${apps[@]}

brew cleanup

# Setup Fish as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

echo "Done!"
