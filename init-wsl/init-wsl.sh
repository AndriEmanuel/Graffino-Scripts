# Firstly, do an update
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# Install git
sudo apt install -y git 
# Install build-essential(containc gcc, make and some other useful stuff)
sudo apt install -y build-essential
# Install N for node version managing
curl -L https://git.io/n-install | bash
# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y yarn
# Install php and it's extensions
sudo add-apt-repository -y ppa:ondrej/php
sudo apt -y update -y && sudo apt -y upgrade
sudo apt-get install -y php7.2-cli php7.2 php7.2-curl php7.2-xml php7.2-mbstring php7.2-gd php7.2-sqlite3 php7.2-mysql php7.2-zip
# Install composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
# Install laravel
composer global require "laravel/installer"
# Install mariadb
sudo apt install -y mariadb-server
sudo service mysql start
sudo mysql -e "CREATE USER '$USER' IDENTIFIED BY '';"
# Install midnight commander(a GUI for exploring folders)
sudo apt install -y mc
# Install ngrok for HTTP tunneling
npm i -g ngrok
# Install zsh and oh-my-zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
# Add apps installed with composer to path
echo "export PATH=$PATH:$HOME/.composer/vendor/bin" >> .zshrc
