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
sudo -u postgres psql
```
```sql
create user egor with password '1234';
create database egor owner egor;
create database project_dev owner egor;
ALTER USER myuser WITH SUPERUSER;
ALTER USER "user_name" WITH PASSWORD 'new_password';
```

## Setup user dirs in `~/.config/user-dirs.dirs`

## No dropbox icon xfce
Insert into `/usr/bin/dropbox` next code:
```python
os.environ['DBUS_SESSION_BUS_ADDRESS'] = ""
```

## Remap caps to escape
```bash
/usr/bin/setxkbmap -option "caps:swapescape"
```
