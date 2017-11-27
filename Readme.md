# DEV_HOME

My personal development environment configuration.

Generally, `tumx + vim + zsh` is the best practice for a development environment. In different platform we use different software to achieve the same practice.

## Windows

### ConEmu

1.  Get the latest [ConEmu](https://conemu.github.io/).
2.  Copy `ConEmu.xml` from repo and overwrite the `C:\Program Files\ConEmu`.

### Python

For matching with current `vim8`, install [python3.5.2](https://www.python.org/downloads/release/python-352/)(actually 3.x should be fine) as dependency of [LeaderF](https://github.com/Yggdroot/LeaderF). Restart machine after installation is done to make sure path is setting up correctly.

### Git

Either [Git for windows](https://git-for-windows.github.io/) or Embedded git inside [Source Tree](https://www.sourcetreeapp.com/) should be fine.


### Gvim

1. 64-bit vim is incomplete installer, so as 1st step, get formal `Gvim` installer from [here](ftp://ftp.vim.org/pub/vim/pc/gvim80-586.exe), and install it.

2. For python support, Get [Vim](https://github.com/vim/vim-win32-installer) and overwrite the files in former installation.

3. Install Vundle by git:

   ```shell
   git clone https://github.com/gmarik/vundle.git "<your vim home>/.vim/Vundle.vim"
   ```
   Or download and copy to `<your vim home>/.vim/Vundle.vim`.

4. Put ``_vimrc`` to your Vim Installation folder. ( May need [powerline-fonts](https://github.com/powerline/fonts) )

5. Invoke vim, run ``PluginInstall``.

### FZF(With)

Get [with](https://github.com/jesse23/with) and install it manually.

### MISC

Other software that used on Windows Platform:

* [ALTRun](https://github.com/etworker/ALTRun)
* [KeePass](https://keepass.info/)
* [mactype](https://github.com/snowie2000/mactype)
* [MultiDesk](http://www.syvik.com/multidesk/index_chs.htm)
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

### Emacs

1. Install emacs by `paceman -S msys/emacs`.
2. Get [SPACEMACS](http://spacemacs.org/) and  ``.spacemacs`` from repo extract it to home folder `C:\msys64\home\<username>`.

### Vim

1. `pacman -S msys/vim`.
2. Copy `_vimrc` to `C:\msys64\home\<username>`.
3. Get [Vundle](https://github.com/VundleVim/Vundle.vim) and put it into `C:\msys64\home\<username>\.vim_home\Vundle.vim`. ( not required if share with `Gvim`)
4. Login to vim and run `PluginInstall`.

### Zsh

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

  ​


### The Silver Searcher(Ag)

`ripgrip` does not exist in `msys2` yet because of go support, use [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) as replacement:

```bas
pacman -S mingw64/mingw-w64-x86_64-ag
```

### Fuzzy Finder

For now I don't find a proper fuzzy finder solution for `msys`.

## MacOS

### Keyboard

I use `ThinkPad Compact Bluetooth Keyboard with TrackPoint`. 2 steps below needed for make if work proper.

1. Install [USB OverDrive](http://www.usboverdrive.com/USBOverdrive/News.html) to disable mouse mid-click.
2. Run [tpkb](https://github.com/unknownzerx/tpkb/releases) to switch the Fn Key.
3. Switch `Ctrl` and `cap lock` key by Mac's system preference.

### HomeBrew

```shell
brew list
brew cask list
brew install <package>
brew uninstall <package>
```

### iTerm2

`iTerm2` is the most public choice in macOS as console emulator. Install it by:

```bash
brew cask install iterm2
```

### zsh

1. `brew install zsh`

2. Set `iterm2` default command to `zsh`. Restart `iterm2` to make sure it works. Set `zsh` as default will pollute other application like `VS Code`, so this apprach will be better.

3. Insall pip by `sudo easy_install pip`.

4. Intall power-line by `pip install powline-status`.

5. Install fonts from [here](https://github.com/powerline/fonts).

6. Select a font end with `power-line`.

7. Install `oh-my-zsh`:

   ```bash
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   ```

8. run `vim ~/.zshrc`, change the theme to `agnoster`.

9. For debug zsh, use `zsh -xv`.

### Tmux

iTerm2 has split and tab function already, did not use Tmux for now.

`brew install tmux`

### Emacs

Emacs is mainly used for support `VimOrganizer` for `orgmode` currently.

1. Get emacs from Homebrew.

   ```shell
    brew cask install emacs
   ```

2. Get [SPACEMACS](http://spacemacs.org/) and extract it to ``emacs_home``.

3. Get ``.spacemacs`` and put it to ``emacs_home``.

4. For dired-quick-sort, ``gls`` is needed from ``coreutils``.

   ```shell
   brew install coreutils
   ```

   **NOTE** For cleaning SPACEMACS, not only clean elpa folder, but also remove auto-gen var in ``.spacemacs``.

### MacVim

1. Install VIM by `brew cask intall macvim`.
2. Get Vundle by either download or git pull.
3. Put ``_vimrc`` to ``$HOME``.
4. Invoke vim, run ``PluginInstall``.

### Change Machine Name

```bash
sudo scutil --set ComputerName "newname"
sudo scutil --set LocalHostName "newname"
sudo scutil --set HostName "newname"
```



### MISC

* [amethyst](https://github.com/ianyh/Amethyst)
* [kdiff3](http://kdiff3.sourceforge.net/)
* [macpass](https://github.com/mstarke/MacPass)

## Cross Platform Software

### Waterfox

Because firefox is deprecating old extension, the latest availble version of Waterfox is `54.0.1`.

1. Install firefox/waterfox.
2. Download [Pentadactyl](http://5digits.org/pentadactyl). After 50.0, use [Signed Version](https://github.com/willsALMANJ/pentadactyl-signed/releases)
3. Copy ``_pentadactylrc`` and ``pentadactyl`` to ``~/``.
4. For Windows Mac Type, Use ``Noto Sans CJK SC DemiLight`` and preference from [here](https://github.com/renkun-ken/MacType.Decency). For 53 version, also need ``gfx.content.azure.backends;direct2d1.1,cairo,skia``

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


### Nerd Fonts

Nerd fonts provide extra symbol when compare with power-line fonts. For now for avoiding any side effect, I am still using power-line fonts:

https://github.com/powerline/fonts