# DEV_HOME

My personal development environment configuration.

Generally, `tumx + vim + zsh` is the best practice for a development environment. In different platform we use different software to achieve the same practice.

## Windows

### ConEmu

1.  Get the latest [ConEmu](https://conemu.github.io/).
2. Copy `ConEmu.xml` from repo and overwrite the `C:\Program Files\ConEmu`.

For `cygwin emacs` support, need to use latest alpha version, download the latest `conemu-msys2-64.exe` to `C:\msys64\usr\bin`.

### MSYS2

http://www.msys2.org/

Use `pacman -Ss <pack-name>` to search package.

Use `pacman -S <pack-name>` to install.

Use `pacman -R <pack-name>` to remove.

#### Emacs

`msys2 emacs` works perfect with `conEmu`.

1. Install emacs by `paceman -S msys2 emacs`.
2. Get [SPACEMACS](http://spacemacs.org/) and  ``.spacemacs`` from repo extract it to home folder `C:\msys64\home\<username>`.

### Gvim

1. Install Git for windows.

   https://git-for-windows.github.io/

2. Install ctags and configure it to the ``$PATH``.

3. copy ``curl.cmd`` to ``<git>/cmd``.

4. Install VIM.

5. Restart the machine to make the ``$PATH`` work.

6. Install Vundle

   ```shell
   git clone https://github.com/gmarik/vundle.git "<your vim home>/Vundle.vim"
   ```

7. Put ``_vimrc`` to ``$HOME``.

8. Invoke vim, run ``PluginInstall``

9. Copy and overwrite ``gvim.bat`` to ``c:\windows``.

10. `$HOME` can be redefined to:

    ```properties
    let $HOME='C:\Users\pengw'
    ```

### Zsh

TBD

### MISC

Other software that used on Windows Platform:

* [ALTRun](https://github.com/etworker/ALTRun)
* [KeePass](https://keepass.info/)
* [mactype](https://github.com/snowie2000/mactype)
* [MultiDesk](http://www.syvik.com/multidesk/index_chs.htm)
* [Unlocker](https://unlocker.en.softonic.com/)
* [XMing](https://sourceforge.net/projects/xming/)

## macOS

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

### Tmux

`brew install tux`

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

###Chrome

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
* [FZF](https://github.com/junegunn/fzf)
* [ripgrip](https://github.com/BurntSushi/ripgrep)
* [SourceTree](https://www.sourcetreeapp.com/)

