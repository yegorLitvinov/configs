sudo add-apt-repository -y ppa:jonathonf/python-3.6
# Node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt update
sudo apt install -y \ 
	# utils
	vim \
	htop \
	iotop \
	zsh \
	terminator \
	chromium-browser \
	indicator-cpufreq \
	# code
	git \
	mercurial \
	tortoisehg \
	python-iniparse \
	virtualenv \
	virtualenvwrapper \
	php \
	nodejs \
	sqlite3 \
	sqliteman \
	# for work
	python3.6 \
	python3.6-dev \
	postgresql-9.5 \
	postgresql-server-dev-9.5 \
	postgresql-client-9.5 \
	libxml2-dev \
	libxslt-dev \
	python-dev \
	chromium-chromedriver \
	build-essential \
	libssl-dev 

sudo usermod -s /bin/zsh `whoami`
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo npm install -g yarn

# set default cpu strategy
echo 'GOVERNOR="powersave"' | sudo tee /etc/default/cpufrequtils

git config --global push.default simple
git config --global core.editor vim

