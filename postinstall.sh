sudo add-apt-repository -y ppa:jonathonf/python-3.6

sudo apt update
sudo apt install -y vim \
	git \
	mercurial \
	virtualenv \
	virtualenvwrapper \
	python3.6 \
	python3.6-dev \
	zsh \
	postgresql-9.5 \
	postgresql-server-dev-9.5 \
	postgresql-client-9.5 \
	libxml2-dev \
	libxslt-dev \
	python-dev \
	chromium-browser \
	chromium-chromedriver \
	build-essential \
	libssl-dev 

sudo usermod -s /bin/zsh `whoami`
# echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

