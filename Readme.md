# DEV_HOME

My personal development environment configuration.

Generally, `tumx + vim + zsh` is the best practice for a development environment. In different platform we use different software to achieve the same practice.

# adi1090x/CustomArch
OOTB UI Experience is more imoprtant:) Manjaro is good but still needs too much tunings
### Bootstrap
- [Installation](https://github.com/adi1090x/CustomArch/blob/master/images/Installer/README.md)
- [I3 Intruduction](https://github.com/adi1090x/CustomArch/blob/master/images/i3/README.md)

### Keyboard Layout Round 1
```sh
# run command below at bash directly to enable colemak manully 1stly
# Before `Keyboard Layout Round 2` we need to run command above manually for every reboot
setxkbmap us -variant colemak &
```

### Update Mirror List
```sh
# https://wiki.archlinux.org/index.php/Mirrors

# Install rankmirrors
sudo pacman -S pacman-contrib

# No matter what u did, do a backup!
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

curl -s "https://www.archlinux.org/mirrorlist/?country=FR&country=GB&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 6 -

# then copy the result to /etc/pacman.d/mirror list

# then update
sudo pacman -Syyu

# remeber to reboot since maybe the coar has been updated
sudo systemctl reboot
```

### vmware-tools
OOTB open-vm-tools is flaky while working with vmware15.5. Also the clipboard function is not working. Use step below to reset the vmware-tools:
```sh
sudo pacman -R open-vm-tools
git clone https://github.com/rasa/vmware-tools-patches.git
cd vmware-tools-patches
sudo ./patched-open-vm-tools.sh

# support copy paste
# also for adi1090x/CustomArch need to install xf86-video-vmware
sudo pacman -Syu gtkmm3 xf86-video-vmware

# remove OOTB auto start
sudo rm /etc/xdg/autostart/vmware-user.desktop

# add below to ~/.xprofile
# initialize vmware-tools
vmware-user &

# if still not working check 'Window resolution aautofit problems' in link below:
# https://wiki.archlinux.org/index.php/VMware/Install_Arch_Linux_as_a_guest
```

### HiDPI Round 1
- Create/Edit `~/.Xresources` with the
```sh
# HiDPI
Xft.dpi: 192
Xft.autohint: 0
Xft.lcdfilter:  lcddefault
Xft.hintstyle:  hintfull
Xft.hinting: 1
Xft.antialias: 1
Xft.rgba: rgb

URxvt.font: xft:Terminus (TTF):regular:size=12
URxvt.boldFont: xft:Terminus (TTF):regular:size=12
URxvt.italicFont: xft:Terminus (TTF):regular:size=12
URxvt.boldItalicfont: xft:Terminus (TTF):regular:size=12


```

- Create/Edit `~/.xprofile` with the
```sh
# here both '.xprofile' and '.profile' works OK

# HiDPI
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export ELM_SCALE=1.5
```

### Keyboard Layout Round 2
```sh
# install xorg-xmodmap
sudo pacman -Syu xorg-xmodmap

# add below to ~/.xprofile

# Keyboard Layout
setxkbmap us -variant colemak &
xmodmap ~/.Xmodmap &

# put below at ~/.Xmodmap
clear lock
clear control
clear mod4
keycode 66 = Caps_Lock
keycode 37 = Super_L NoSymbol Super_L
keycode 133 = Control_L NoSymbol Control_L
pointer = 1 25 3 4 5 6 7 8 9 10 11 12
add lock = Caps_Lock
add control = Control_L Control_R
add mod4 = Super_L Super_R
```

### Powerline fonts & WQY
[Powerline fonts](https://github.com/powerline/fonts) is required for my term setting. For installation:
```sh
# wqy
sudo pacman -Syu wqy-microhei

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

### HiDPI Round 2
- General rule
```
# Sans: Keep existing or WenQuanYi Micro Hei 12
# Mono: Noto Mono for Powerline 12
# rofi doesn't impact by scale so * 2
```

- termite
```sh
# vim ~/.config/termite/config.i3
# vim ~/.config/termite/config
font = Noto Mono for Powerline 12
```

- .Xresources
```sh
# vim ~/.Xresources
URxvt.font: xft:Noto Mono for Powerline:regular:size=12
URxvt.boldFont: xft:Noto Mono for Powerline:regular:size=12
URxvt.italicFont: xft:Noto Mono for Powerline:regular:size=12
URxvt.boldItalicfont: xft:Noto Mono for Powerline:regular:size=12
```

- i3-config
```sh
# vim ~/.config/i3/config

# set font
font pango: Noto Sans 10

# autostart
exec --no-startup-id hsetroot -extend ~/.config/i3/wallpaper.jpg

# comment out about
# exec --no-startup-id "sleep 3 && /usr/local/bin/about.sh"

# start dmenu (a program launcher)
bindsym $super+Shift+d exec rofi -config ~/.config/rofi/themes/config.simple -show drun -display-drun 'Apps ' -drun-display-format '{name}' -padding 18 -width 30 -location 0 -lines 10 -columns 2 -show-icons -icon-theme 'Papirus' -font 'Noto Sans 36'

# Misc
bindsym $super+q exec --no-startup-id "~/.config/rofi/scripts/appsmenu.sh"

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $super+Shift+r exec --no-startup-id "hsetroot -extend ~/.config/i3/wallpaper.jpg && restart"

# panel
bar {
    ...
    position top
}
```

- dunstrc
```sh
# vim ~/.config/dunst/dunstrc.i3
font = Noto Sans 10
```

- dmenu
```sh
# vim ~/.config/rofi/themes/search-i3.rasi
# same as font pango but *2
font: "Noto Sans 20";

# vim ~/.config/rofi/themes/config.simple
same as dmenu in 13 config
rofi.font: Noto Mono for Powerline 36
```

- Misc menus
```sh
# *2 for all font char used in this file
# vim ~/.config/rofi/themes/shared/resolutions/1366x768.rasi
  text-font:                            "Comfortaa 28";
  text-font-mono:                       "RobotoMono Nerd Font Regular 28";
  icon-font:                            "Hurmit Nerd Font Mono 100";
  icon-font-small:                      "Hurmit Nerd Font Mono 48";

# add space to all symbol char below
# vim ~/.config/rofi/scripts/powermenu-i3.sh
# vim ~/.config/rofi/scripts/mpdmenu.sh
# vim ~/.config/rofi/scripts/appsmenu.sh
# vim ~/.config/rofi/scripts/scrotmenu.sh
# vim ~/.config/rofi/scripts/networkmenu.py
# vim ~/.config/rofi/scripts/i3layoutmenu.sh
```

- GTK2
```
# scssc is required
sudo pacman -Syu sassc

# set oomox theme
git clone https://github.com/themix-project/oomox.git --recursive
cd oomox
./gui.sh

# pick a theme.
# shiki-noble-dark

# below is more custom control for gtk2
vim ~/.gtkrc-2.0.mine
# https://github.com/vaeyo/dotfiles/blob/master/.themes/blujob/gtk-2.0/gtkrc.hidpi
# gtk-icon-sizes = "panel-menu=64,64:panel=64,64:gtk-menu=64,64:gtk-dialog=64,64:gtk-dnd=64,64:gtk-button=64,64:gtk-large-toolbar=64,64:gtk-small-toolbar=64,64"
gtk-icon-sizes = "panel-menu=32,32:panel=32,32:gtk-menu=32,32:gtk-dnd=32,32:gtk-large-toolbar=32,32:gtk-small-toolbar=32,32"
style "default" {
#    GtkScrollbar   ::min_slider_length = 36
#    GtkCheckButton ::indicator_size    = 36
#    GtkRadioButton ::indicator_size    = 36
    GtkTreeView    ::expander_size     = 36
    GtkExpander    ::expander_size     = 36
#    GtkScale       ::slider-length     = 80                     
}

class "GtkWidget" style "default"
class "GtkTreeView" style "default"

```

### Browser
```sh
sudo pacman -Syu chromium
```

### sound
- disable beep
```
# sudo vim /etc/modprobe.d/nobeep.conf
blacklist pcspkr
```
- vmware-sound
```
# https://forum.manjaro.org/t/no-audio-in-virtual-machine-manjaro-i3/86458
sound.autodetect = "TRUE"
sound.virtualDev = "hdaudio"
```

### bash
use OOTB fish for now

### vs code
```sh
# https://github.com/microsoft/vscode/issues/80798
# because of issue above, for now switch window.titleBarStyle=custom after install
pacman -Syu VSCode
```

### Locale (optional)
```sh
# /etc/locale.gen
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8

# then go to bash
locale-gen

# ~/.Xprofile
export LANG=en_US.UTF-8
export LANGUAGE=en_US:zh_CN

# install CJK font
git clone https://aur.archlinux.org/nerd-fonts-noto.git
makepkg -si
Switch all Fonts to "NotoSansMono Nerd Font"

# https://github.com/ryanoasis/nerd-fonts/issues/254
# fix nerd font
sudo pacman -Syu fontforge
sudo fontforge
# open /usr/share/fonts/TTF/Noto Sans Mono Condensed Nerd Font Complete.ttf
# View->Goto->U+fb01
# clear fb01 and fb02 and save(actually delete all the ff related)

```

### system backup
timeshift


## MacOS (Catalina)

### Basic setup
- Install the system correctly.

### HomeBrew
Homebrew will be the only source for 3rd party software
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Common homebrew command:

```shell
brew list
brew cask list
brew install <package>
brew uninstall <package>
```

### Windows VM
- For now windows VM is required in my practice.
- At Jan 2020, VirtualBox is trying to upgrade their video driver to VBoxSVGA, which is causing lot of display issues. So there are two options:
  - Use VirtualBox 5 verision.
  - Buy commercial product. 
  For now I am using VMWare Fusion 11.5.

### Keyboard Mapping
MacOS use `Cmd` key as equivalent setup as `Ctrl` key in windows/linux. It is very inconvenient since it is so different with common dev tool chain.

At this moment, before I know any better I approach, the principle I follow is:
- Use native configuration as much as possible, use patch software as less as possible.
- Pay effort as less as possible
- As soon as we don't use ctrl key in vim too much, we can choose to remap that

So:
#### Mac Side
- Go to Mac Keyboard setting, do mapping below:
  - Set keyboard layout as Colmak.
  - Change modifier key mapping as:
```
Capslock => Command
Control  => Capslock
Command  => Control
```

#### Windows VM Side
- Go to windows, use software `KeyTweak`:
  - Load preset colmak in my windows keymap setup.
  - Reset the 3 function key, then do:
```
LControl => LWindows
LWindows => LControl
```

#### ThinkPad Compact Bluetooth Keyboard
2 things needs to be resolved: F1-F12 and Mouse Key 3.
- On Mac, load `tpkb` on start:
```bash
brew cask install tpkb
# Run code below after restart
sudo tpkb
```
- On Windows VM (and maybe remote machine), write a small AHK script to disable mouse middle click:
```
MButton::Return
```
### Mouse Speed
Drag mouse speed to max 5. 
Use command below to set it higher:
```
defaults write -g com.apple.mouse.scaling  12.0
```

### OneDrive
If u are using default APFS disk format u can ignore this.
oneDrive on MAC is not compatible with case sensitive partition. An extra partition is needed through `Disk Utility` for using oneDrive.


### Powerline fonts
[Powerline fonts](https://github.com/powerline/fonts) is required for my term setting. For installation:
```sh
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

### VSCode
- vscode installation can also be done by brew.
- After install and load setting sync,
- Go to `Perference: Open Keyboard Shortcuts`, modify 2 key mappings:
```
Extension.vim_ctrl+r => Cmd + R
Extension.vim_ctrl+[ => Cmd + [
```

### zsh
1. `brew install zsh`

3. Insall pip by `sudo easy_install pip`.

4. Intall power-line by `pip install powline-status`.

5. Install fonts from [here](https://github.com/powerline/fonts).

6. Select a font end with `power-line`.

7. Install `oh-my-zsh`:

   ```bash
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   ```

8. run `vim ~/.zshrc`, change the theme to `agnoster`.

9. Copy `.zshrc` in repo and overwrite the `~/.zshrc`.

10. For debug zsh, use `zsh -xv`.

### Custom Script Path
Add `<repo>/macOS/bin` to the front of `$PATH` in `~/.zshrc`.

### iTerm2
`iTerm2` is the most public choice in macOS as console emulator. Install it by:

```bash
brew cask install iterm2
```

Go to menu `iTerm2->Preference->Load Preferences from a custom folder or URL`, change it to your local repo or my github location. Restart iTerm2.

*Note: For now in iTerms2 we map cmd back to ctrl which will make vim flow better also not conflict with iterms2 shortcut. I will see if I can find any better solution later.*

### Tmux

iTerm2 has split and tab function already, did not use Tmux for now.

`brew install tmux`

### Vim

1. Install VIM by `brew cask intall macvim`.

2. Install `Command Line Tools` by `xcode-select —install`.

3. Since default `vim` does not have clipboad function, install `vim` with `brew install vim`.

4. Get Vundle by either download or git pull.

5. Put ``_vimrc`` to ``$HOME``.

6. Get `Vundle` and put it to `~/.vim/Vundle.vim`:

   ```sh
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/Vundle.vim
   ```

7. Invoke vim, run ``PluginInstall``.

### Emacs (deprecated)
I use vim for org for a long time already...may revisit this topic once I switch back to Emacs

Emacs is mainly used for support `VimOrganizer` for `orgmode` currently.

1. Get emacs from Homebrew.

   ```shell
    brew cask install emacs
   ```

2. Get [SPACEMACS](http://spacemacs.org/):

   ```sh
   git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d 
   ```

3. Start emacs one time and exit.

4. Get ``.spacemacs`` and copy it to `~/`.

5. For dired-quick-sort, ``gls`` is needed from ``coreutils``.

   ```shell
   brew install coreutils
   ```

   **NOTE** For cleaning SPACEMACS, not only clean elpa folder, but also remove auto-gen var in ``.spacemacs``.

### Change Machine Name

```bash
sudo scutil --set ComputerName "newname"
sudo scutil --set LocalHostName "newname"
sudo scutil --set HostName "newname"
```

### FZF

1. Install fd:

   ```bash
   brew install fd
   ```

2. Install fzf:

   ```bash
   brew install fzf
   ```

3. Add fzf setting below to `.bashrc`:

   ```bash
   export FZF_DEFAULT_COMMAND='fd -a -j 4'
   ```

### Exa

1. Install exa:

   ```bash
   brew install exa
   ```

2. At the end of `.zshrc` add line below:

   ```bash
   alias ls="exa"
   ```

### MISC

* [amethyst](https://github.com/ianyh/Amethyst)
* [kdiff3](http://kdiff3.sourceforge.net/)
* [macpass](https://github.com/mstarke/MacPass)
* Wallpaper path: `/System/Library/Desktop Pictures`

## Windows 10 (Surface)

### Windows Update

Always update windows to latest firstly.

### VPN Related

Install VPN Client 5.8 and try to launch it in IE11. Note that Edge is not working fine.

### Thinkpad Bluetooth Keyboard with Trackpoint

- Install Lenovo Driver.
- Check `Thinkpad Scroll` at last tab.
- The reverse scroll direction is not achievable for now

### MacType

- Use [this version](sky.candy.moe/2017/11/24/mactype-20170628/) for best effect.
- The install batch may have problem in non BIG5 environment, we can do manual install by:
  - Uninstall all former mac type

  - Copy folder to `C:\Program Files\MacType`.

  - Install Fonts Manually.

  - Run corresponding registry file manually.

    ```
    _10_x64_font_link.reg
    _Services_install.reg
    NotoGothic.reg (or other fonts you like)
    ```

  - Run [System Font Size Changer](https://www.wintools.info/index.php/system-font-size-changer) to change all fonts back to 1.

### Powerline fonts

[Powerline fonts](https://github.com/powerline/fonts) is required for my term setting. Just install SourceCodePro manually should be enough.

### ConEmu

- Get the latest [ConEmu](https://conemu.github.io/). (**Preview or Alpha Version**)

- Copy `ConEmu.xml` from repo and overwrite the `C:\Program Files\ConEmu`.

### WSL

- Add WSL Feature in Control Panel.
- Get [a distribution](https://github.com/sirredbeard/Awesome-WSL).
- Set it up based on different instruction.
- For now (20190104) only Ubuntu can support Docker in WSL on latest win10 easily. 

### Git

* Git is required for `Vundle` in `VIM`.
* I use embedded git inside `SourceTree`. It is at `C:\Users\xxxx\AppData\Local\Atlassian\SourceTree\git_local\cmd`.

### Vim

1. For python support, Get [Vim](https://github.com/vim/vim-win32-installer) and overwrite the files in former installation.

2. Install Vundle by git:

   ```shell
   git clone https://github.com/gmarik/vundle.git <your vim home>/.vim/Vundle.vim
   ```

   Or download and copy to `<your vim home>/.vim/Vundle.vim`.

3. Put ``_vimrc`` to your Vim Installation folder. ( May need [powerline-fonts](https://github.com/powerline/fonts) )

4. Invoke vim, run ``PluginInstall``.

**NOTE** emacs is not needed for `vimOrganizer` if export to PDF/HTML function is not needed.

## Docker VM

boot2docker has several limitation and so we build one from scratch

* Install latest VirtualBox.

* Create VM by `Linux 2.6 / 3.x /4.x (64-bit)`, default memory and disk is fine. Setup proper CPU and system setting, make sure network is bridge so that you can ssh to it

* Download [Alpine ISO For VM](https://wiki.alpinelinux.org/wiki/Install_Alpine_on_VirtualBox).

* Install by default with `setup-alpine`. Only selection is `sda/sys`. machine name can be `wsl-docker`.

* Reboot

* Edit `/etc/apk/repositories` to enable community repositories.

* `apk update` and `apk upgrade`.

* Setup non root user as [below](#Alpine-Linux). Or just add line below to `/etc/ssh/sshd_config` since it is a simple docker machine:

  ```bash
  PermitRootLogin yes
  ```

* Install [Virtualbox additions](https://wiki.alpinelinux.org/wiki/VirtualBox_shared_folders):

  ```bash
  apk add virtualbox-guest-additions virtualbox-guest-modules-virt
  reboot
  modprobe -a vboxsf 
  mount -t vboxsf vbox_shared /mnt/outside
  ```

* Edit `/etc/fstab` to mount share folder by default:

  ```bash
  # mount it same as wsl so that u can use it seamlessly
  D_DRIVE /mnt/d vboxsf defaults 0 0
  # or do below manually
  # sudo mount -t vboxsf D_DRIVE /mnt/d
  ```

* Install [docker](https://wiki.alpinelinux.org/wiki/Docker):

  ```bash
  apk add docker
  rc-update add docker boot
  service docker start
  docker version
  docker run --rm hello-world
  ```

* Expose docker deamon for WSL in `/etc/conf.d/docker`:

  ```bash
  DOCKER_OPTS="-H tcp://0.0.0.0:2375`
  ```

* Reboot and try to connect from WSL:

  ```bash
  export DOCKER_HOST=tcp://wsl-docker:2375
  docker version
  ```

* (TBD) docker-compose, it should be installed at WSL, refer to [here](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly).



## Ubuntu-18.04

[WSL Repo](https://docs.microsoft.com/en-us/windows/wsl/install-manual)

```bash
# set root password
sudo passwd

# upgrade to latest
sudo apt update
sudo apt upgrade
```

### Utilities

```bash
# fzf
export FZF_VERSION=0.17.5
wget https://github.com/junegunn/fzf-bin/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tgz
tar xzf fzf-${FZF_VERSION}-linux_amd64.tgz
sudo mv fzf /usr/local/bin

#ripgrep
export RG_VERSION=0.10.0
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep_${RG_VERSION}_amd64.deb
sudo dpkg -i ripgrep_${RG_VERSION}_amd64.deb

#fd
export FD_VERSION=7.2.0
curl -LO https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb
sudo dpkg -i fd_${FD_VERSION}_amd64.deb

#exa
sudo apt install unzip
export EXA_VERSION=0.8.0
wget https://github.com/ogham/exa/releases/download/v${EXA_VERSION}/exa-linux-x86_64-${EXA_VERSION}.zip
unzip exa-linux-x86_64-${EXA_VERSION}.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa

# universal-ctags
# https://launchpad.net/ubuntu/+source/universal-ctags
# for now let us not enable launchpad source
sudo apt install libjansson4
export CTAGS_VERSION=20181215-1
curl -LO https://launchpad.net/ubuntu/+archive/primary/+files/universal-ctags_0+git${CTAGS_VERSION}_amd64.deb
sudo dpkg -i universal-ctags_0+git${CTAGS_VERSION}_amd64.deb
```

### Python3

Python3 is installed by default. Only thing missing is pip:

```bash
sudo apt install python3-pip
# don't use pip to upgrade pip for now, there is a workaround if you need to do that
```

### Zsh

```bash
# power line
pip3 install powerline-status # no sudo here...
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

1. Modify `~/.zshrc` to change theme to `agnoster`.

2. Create `~/.profile` to execute zsh:

   ```bash
   exec zsh
   ```

### Tmux

```bash
sudo apt install tmux
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
```

create `~/.tmux.conf` with:

```bash
set -g default-terminal "screen-256color"
source-file ${HOME}/.tmux-themepack/powerline/double/yellow.tmuxtheme
```

### Docker client

```bash
sudo apt install docker.io
sudo usermod -aG docker $USER
```

put below to `~/.profile`:

```bash
# set PATH so it includes custom wsl batch
if [ -d "/mnt/d/xxx/dev_home/win10/bin" ] ; then
    PATH="/mnt/d/xxx/dev_home/win10/bin:$PATH"
fi

#docker
export DOCKER_HOST=tcp://wsl-docker:2375
```

#### WSL Docker Service

After win10 1803, with Ubuntu, docker is able to run inside WSL.

* In admin console, run command below to start docker-deamon:

  ```bash
  sudo cgroupfs-mount
  sudo service docker start
  docker version
  sudo service docker stop
  ```

* In dev_home it has been wrapped to script:

  ```bash
  dockersvc_start
  docker version
  dockersvc_stop
  ```

**NOTE** Till 20190104, the docker in WSL still have many side effects. See [here](https://www.reddit.com/r/bashonubuntuonwindows/comments/8cvr27/docker_is_running_natively_on_wsl/) if you see an issue.

#### Docker VM

Then you can start/stop docker-vm by:

```bash
dockervm_start
docker version
dockervm_stop
```

### git

```bash
# setup user/email
git config --global user.name "xxxx"
git config --global user.email "xxxx@siemens.com"

# setup vim
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global core.editor "vim"
git config --global difftool.trustExitCode true

# one WA for diff
sudo ln -s /usr/bin/diff /usr/share/vim/vim80diff
```

### NodeJs

```bash
export VERSION=v8.12.0
export DISTRO=linux-x64
sudo mkdir /usr/local/lib/nodejs
curl -LO https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
sudo mv /usr/local/lib/nodejs/node-$VERSION-$DISTRO /usr/local/lib/nodejs/node-$VERSION

# export every time or set it to ~/.profile
export NODEJS_HOME=/usr/local/lib/nodejs/node-$VERSION/bin
export PATH=$NODEJS_HOME:$PATH
```



## Alpine Linux

* [WSL Repo](https://github.com/yuk7/AlpineWSL)

```bash
apk update
apk upgrade

# Change Root Password
passwd root

# Setup Group if not
addgroup -g 1000 -S app

# Setup User
adduser -u 1000 -S your_user -G app
passwd your_user

# Change default bash
vi /etc/passwd
## your_user:x:1000:1000:Linux User,,,:/home/your_user:/bin/ash ##

# Install sudo
apk add sudo
```

Then open `visudo` file by:

```bash
EDITOR=vi visudo
```

Look for the line that says `root   ALL=(ALL) ALL` and add your user right on the next line like this:

```bash
your_user   ALL=(ALL) ALL
```

Finally, we should login as this user:

```bash
su your_user
```

(for WSL)Then go back to windows console, use command below to set default user:

```bash
Alpine config --default-user pengw
sc stop LxssManager
sc start LxssManager
```

By restarting your console ( conEmu or cmd.exe), you should be able to login as your user.

### Basic apk command

```bash
apk add sudo
apk search pkgName
apk search -v xxx # search and display description
apk search -v 'php7*' #search with wildcards
apk info # show installed package
apk info -a zlib # show full package info
apk info --who-owns /sbin/lbu # show which package owns that file
apk update # update package list
apk version -v -l '<' # show available updates
apk upgrade -U -a # upgrade all packaegs
```

### Extra Utilities

```bash
# FZF
sudo apk add fzf

# ripgrep
set -x
export RG_VERSION=0.10.0
wget https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz
tar xzf ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz
sudo mv ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl/rg /usr/local/bin/

# fd
set -x
export FD_VERSION=v7.2.0
wget https://github.com/sharkdp/fd/releases/download/${FD_VERSION}/fd-${FD_VERSION}-x86_64-unknown-linux-musl.tar.gz
tar xzf fd-${FD_VERSION}-x86_64-unknown-linux-musl.tar.gz
sudo mv fd-${FD_VERSION}-x86_64-unknown-linux-musl/fd /usr/local/bin/
```

### Python3

```bash
sudo apk add python3
sudo pip3 install --upgrade pip
```

### Zsh

```bash
# power line
pip3 install powerline-status
sudo apk add zsh
sudo apk add git
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

* Modify `~/.zshrc` to change theme to `agnoster`.

* Create `~/.profile` to execute zsh:

```bash
exec zsh
```

### Tmux

```bash
sudo apk add tmux
```

create `~/.tmux.conf` with:

```bash
set -g default-terminal "screen-256color"
```

### Docker Client

```bash
sudo apk add docker
# sudo apk add openrc
# sudo rc-update add docker boot
# service docker start <-- not working in WSL for now
```

## Arch Linux

[WSL Repo](https://github.com/yuk7/ArchWSL)

```bash
# Init
pacman-key --init
pacman-key --populate
pacman -Syu

# Change Root Password
passwd root

# Setup User
useradd -m your_user
passwd your_user
```

Then open `visudo` file by:

```bash
EDITOR=vim visudo
```

Look for the line that says `root   ALL=(ALL) ALL` and add your user right on the next line like this:

```bash
your_user   ALL=(ALL) ALL
```

Finally, we should login as this user:

```bash
su your_user
```

Then go back to windows console, use command below to set default user:

```bash
Arch config --default-user pengw
```

By restarting your console ( conEmu or cmd.exe), you should be able to login as 

Install fakeroot to bypass a WSL bug:

```bash
wget https://github.com/yuk7/arch-prebuilt/releases/download/17121600/fakeroot-tcp-1.22-1-x86_64.pkg.tar.xz
sudo pacman -U fakeroot-tcp-1.22-1-x86_64.pkg.tar.xz
```

### utilities

```bash
sudo pacman -S community/fzf
sudo pacman -S community/ripgrep
sudo pacman -S community/fd
sudo pacman -S community/exa

```

### python3

```bash
sudo pacman -S extra/python3
sudo pacman -S python-pip
```

### zsh

```bash
sudo pip install powerline-status
sudo pacman -S extra/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

1. Modify `~/.zshrc` to change theme to `agnoster`.

2. Modify `~/.bashrc` to change default shell to zsh by appending line below:

   ```bash
   exec zsh
   ```

### tmux

```bash
sudo pacman -S community/tmux
```

create `~/.tmux.conf` with:

```bash
set -g default-terminal "screen-256color"
```

## Windows ( Win10 RTM and before )

On windows, for now the practice is `conEmu + vim + msys2 + zsh`.

### Adjust Font Size

For windows 7, Go to `personalize->Window Color->Item`, change every font size of Item to `Microsoft Yahei UI, 10`.

### Custom Script Path

Add `<repo>/windows/bin` at the front of `%PATH%`.

### Python

For matching with current `vim8`, install [python3.5.2](https://www.python.org/downloads/release/python-352/)(actually 3.x should be fine) as dependency of [LeaderF](https://github.com/Yggdroot/LeaderF). Restart machine after installation is done to make sure path is setting up correctly.

### Git

Either [Git for windows](https://git-for-windows.github.io/) or Embedded git inside [Source Tree](https://www.sourcetreeapp.com/) should be fine.


### Gvim

1. For python support, Get [Vim](https://github.com/vim/vim-win32-installer) and overwrite the files in former installation.

2. Install Vundle by git:

   ```shell
   git clone https://github.com/gmarik/vundle.git "<your vim home>/.vim/Vundle.vim"
   ```
   Or download and copy to `<your vim home>/.vim/Vundle.vim`.

3. Put ``_vimrc`` to your Vim Installation folder. ( May need [powerline-fonts](https://github.com/powerline/fonts) )

4. Invoke vim, run ``PluginInstall``.

5. When open multiple files in one `Gvim` through vim server, there is a bug that the height of status bar will be calculated into window size. The best practice for now, is auto hide the status bar at left or right side and use large icon.

### FZF(With)

Get [with](https://github.com/jesse23/with) and install it manually.

### MISC

Other software that used on Windows Platform:

* [ALTRun](https://github.com/etworker/ALTRun)
* [KeePass](https://keepass.info/)
* [mactype](https://github.com/snowie2000/mactype)
* [MultiDesk](http://www.syvik.com/multidesk/index_chs.htm)
* [Q-dir](https://www.softwareok.com/?seite=Freeware/Q-Dir)
* [Unlocker](https://unlocker.en.softonic.com/)
* [XMing](https://sourceforge.net/projects/xming/)

### Trouble Shoot

#### "Unknown Publisher" Warning

https://blogs.msdn.microsoft.com/askie/2009/06/19/how-to-bypass-the-security-warning-unknown-publisher-with-the-checkbox-always-ask-before-opening-this-file/

### VIM Starts very slow

If your `$HOME` is a remote location, starting `vim` will be very slow. As a hack, you can reset the `HOME` folder in `gvim.bat` and `vim.bat`:

```shell
set HOME=C:\xxxxx
```

## MSYS2

[MSYS2](http://www.msys2.org) is a simplify version of [cygwin](https://www.cygwin.com/).

### Installation

1. Get binary from http://www.msys2.org/ and install.

2. Download the latest [conemu-msys2-64.exe](https://github.com/Maximus5/cygwin-connector/releases) to `C:\msys64\usr\bin`.

3. Invoke bash, run `pacman -Syu` couple of times to upgrade to latest.

4. Common `pacman` commands:

   ```bash
   pacman -Syu             # Update package DB and core package
   pacman -Su              # Restart msys and run this after Syu
   pacman -Q               # List all packages
   pacman -Ss <keyword>    # Seach available packages
   pacman -S <package>     # Install package
   pacman -R <package>     # Remove package
   pacman -U <file>        # Install old version downloaded from repo.msys2.org
   ```

### Git

Since `msys-git` is very slow, we can use either [Git for Windows](https://git-for-windows.github.io/) or embedded git in `Source Tree` by add git dependency in `~/.bashrc`:

```bash
export PATH='/c/Program Files/Git/cmd':$PATH
```

Add config below to redirect `vim` properly:

```bash
git config --global core.editor /usr/bin/vim
```

### Custom Script Path

Add `<repo>/windows/msys2` to the front of `$PATH` in `~/.bashrc`.

### emacs

1. Install emacs by `pacman -S msys/emacs`.
2. Get [SPACEMACS](http://spacemacs.org/) and  ``.spacemacs`` from repo extract it to home folder `C:\msys64\home\<username>`.

### vim

1. `pacman -S msys/vim`.
2. Install `python3` by `pacman -s python3`.
3. Copy `_vimrc` to `C:\msys64\home\<username>`.
4. Get [Vundle](https://github.com/VundleVim/Vundle.vim) and put it into `C:\msys64\home\<username>\.vim_home\Vundle.vim`. ( not required if share with `Gvim`)
5. Login to vim and run `PluginInstall`.

### zsh

1. `pacman -S msys/zsh`.

2. Install [powerline](https://github.com/powerline/powerline):

   ```bash
   pacman -S msys/python3-pip
   pip install powerline-status
   ```

3. Install powerline fonts from [here](https://github.com/powerline/fonts). Manual Install is required on Windows and set it in conEmu properly.

4. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh):

   ```bash
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   ```

5. Modify `~/.zshrc` to change theme to `agnoster`.

6. Modify `~/.bashrc` to change default shell to zsh by appending line below:

   ```bash
   exec zsh
   ```

7. For accelerate git, run command below:

   ```bash
   git config --global core.preloadindex true
   git config --global core.fscache true
   git config --global gc.auto 256
   ```

8. For debug zsh, use `zsh -xv`.

9. If zsh is slow when access to large git project, run command below:

   ```shell
   git config --add oh-my-zsh.hide-dirty 1
   git config --add oh-my-zsh.hide-status 1
   ```

10. For command wrapper, better to use script below than alias - looks the completion for alias in `zsh` needs to configure separately:

  ```bash
  exec <your-command> "$@"
  ```

### FZF(With)

Get [with](https://github.com/jesse23/with) and install it manually.

### The Silver Searcher(Ag)

`ripgrip` does not exist in `msys2` yet because of go support, use [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) as replacement:

```bas
pacman -S mingw64/mingw-w64-x86_64-ag
```

## Cross Platform Software

### Vivaldi

Finally we have a chromium based which can hide address bar and show side tab! [Link](https://vivaldi.com/)

With [SurfingKeys](https://github.com/brookhong/Surfingkeys) It is same as FireFox solution which is aging.

### Waterfox

`FireFox 54.0.1` is completely out of date including extension. For now use a local copy saved in my OneDrive.

### Chrome

To Start Chrome for debug, use command line below to re-direct the usr-dir:

```sh
C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --user-data-dir=/dev/null
```

### Visual Studio Code

1. Use [Insiders](https://code.visualstudio.com/insiders/) version.
2. Get [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) Extension and sync Settings.

### Utilities

* [BeyondCompare](https://www.scootersoftware.com/index.php)
* [Divvy](http://mizage.com/divvy/)
* [fd](https://github.com/sharkdp/fd)
* [FZF](https://github.com/junegunn/fzf)
* [ripgrip](https://github.com/BurntSushi/ripgrep)
* [SourceTree](https://www.sourcetreeapp.com/)
* [typora](https://typora.io/)


### Nerd Fonts

Nerd fonts provide extra symbol when compare with power-line fonts. For now for avoiding any side effect, I am still using power-line fonts:

https://github.com/powerline/fonts

### Useful Link

* [Baidu IME Colemak Geek](https://github.com/TsFreddie/BaiduIME-Skin-Colemak-Geek)
* [Google Camera](https://www.xda-developers.com/google-camera-hdr-customization-raw-support)
* [One Drive not start](http://www.patrickkremer.com/2017/03/windows-10-onedrive-wont-start/)
