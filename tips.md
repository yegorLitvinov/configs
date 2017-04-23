# Some tips

## No driver for your GPU
To turn of GPU, add `amdgpu.runpm=0` to `/etc/default/grub` like this:
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.runpm=0"
```bash
sudo update-grub
```

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

