# Some tips


## No driver for your GPU
To turn of GPU, add `amdgpu.runpm=0` to `/etc/default/grub` like this:
`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.runpm=0"`
```bash
sudo update-grub
```


## Black screen after sleep
Make sure, that no `radeon.runpm=0` in  `/etc/default/grub`


## Audio not working
```bash
lspci | grep -i audio
dmesg
```
If in dmesg will be records like:
>snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535

than put in `/etc/modprobe.d/whatever.conf` next lines:
```
options snd-hda-intel single_cmd=1
options snd-hda-intel probe_mask=1
```


## Virtualenvwrapper
```bash
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.zshrc
WD=/path/to/project/
cd $WD
export DJANGO_SETTINGS_MODULE=config.settings.dev
export PYTHONPATH="$WD/somepythonpath"
```


## Alias for server. Copy into `~/.ssh/config`
```
Host somehost
   HostName www.somehost.com
   User egor
   IdentityFile ~/.ssh/keys/somehost_private_key
```
Now you cat access to the server by typing `ssh somehost`.
Not forget to add your public key to the host first.


## Some postgres tips
```bash
# login as postgres user
sudo -u postgres psql
# when locale error
sudo locale-gen ru_RU.UTF-8
```
```sql
CREATE USER user WITH ENCRYPTED PASSWORD 'password' CREATEDB;
CREATE DATABASE user WITH ENCODING 'UTF-8' OWNER "user";
GRANT ALL PRIVILEGES ON DATABASE user TO user;

ALTER USER egor WITH SUPERUSER;
ALTER USER egor WITH PASSWORD 'new_password';
```


## Setup user dirs in `~/.config/user-dirs.dirs`


## No dropbox icon xfce
Insert into `/usr/bin/dropbox` next code:
```python
os.environ['DBUS_SESSION_BUS_ADDRESS'] = ""
```


## Remap Caps Lock
```bash
# with ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"
# with escape
/usr/bin/setxkbmap -option "caps:swapescape"
```

## Install python3.6 package
```bash
sudo add-apt-repository ppa:jonathonf/python-3.6
curl https://bootstrap.pypa.io/get-pip.py | python3.6
python3.6 -m pip install <package>
```

## Change name of Ubuntu relese
Sometimes installation scripts (e.g. docker, nodejs) use your codename from `/etc/lsb-release`
to add right repository. But some distributives (like Linux Mint) have their own code.
To prevent errors, you may edit the config file and fix the problem

## Mysql
- fuction `convert_tz` returns `NULL` (in django's ExtractYear): load timezone table into mysql: `mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p mysql`
- problems with encodig:
Paste into `[mysqld]` section of `/etc/mysql/mysql.conf.d/mysqld.cnf`:
```ini
character-set-server=utf8
collation-server=utf8_general_ci
```

## Pantheon hangs up on login
``` bash
# fix get-distro-upgrade.py is absent
sudo apt install packagekit-backend-aptcc
# fix Application 'at-spi-dbus-bus.desktop' failed to register before timeout
sudo mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.desktop.deleted
```

## Turn of hdd heads parking
``` bash
sudo hdparm -B 254 /dev/sda
```
or in `/etc/hdparm.conf
```
apm = 254
apm_battery = 254
```

## Disable Ctrl+Alt+L
```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "[]"
```

## Generate random string
```bash
pwgen -s 16 1
```

## Virtual Memory settings in `/etc/sysctl.conf`
```
vm.swappiness = 10
fs.inotify.max_user_watches=524288
vm.dirty_ratio = 10
vm.dirty_background_ratio = 5
```

## Compiz (windows can't handle focus, have no headers)
```
dconf reset -f /org/compiz/
window-manager-launcher
```

## Spectre / Meltdown
```
grep . /sys/devices/system/cpu/vulnerabilities/*
```
To turn patch off put `spectre_v2=off pti=off` into `/etc/default/grub`

## SSD on linux
First of all make sure that your SSD supports trim:
```
sudo hdparm -I /dev/sda | grep TRIM
```
Run `fstrim -v <mountpoint>` periodically or add `discard` and `relatime` flags to `/etc/fstab/`:
```
/dev/mapper/mint--vg-root / ext4 relatime,discard,errors=remount-ro 0 1
```

## Redshift doesn't work with geoclue provider
Manually set lat:lng
```
redshift -l 55:37
```
