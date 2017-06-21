# DEV_HOME

My personal development environment configuration.

## VIM

### Windows

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

10. Modify context menu to add or modify item ``Edit with VIM``: 

  ```shell
  "C:\Windows\gvim.bat" "%1"
  ```

### OSX

1. Install ``Xcode Command Line Tools``.
2. Install ``Homebrew``. (Optional)
3. Do step 4 to 8 in windows.
4. Add applescript ``edit_with_vim_apple_script``.
5. Copy ``gvim`` script to ``/local/usr/bin`` or any path in ``$PATH``.

## EMACS
### Windows
1. Download ``emacs`` or  ``emacsw64``.

2. Run ``<emacs>/bin/addpm.exe`` to register/install the package.

3. Modify ``reg_home_and_server.reg`` and import to windows.

4. Create folder ``<emacs_home>/server``.

5. Get [SPACEMACS](http://spacemacs.org/) and extract it to ``emacs_home``.
``u

6. Get ``.spacemacs`` and put it to ``emacs_home``.

7. Copy ``emacs.bat`` to ``C:\windows``.

8. For resolving code-page issues, copy ``init_cmdproxy.exe.sh`` to ``.emacs.d``.

   **NOTE** For cleaning SPACEMACS, not only clean elpa folder, but also remove auto-gen var in ``.spacemacs``.


### OSX
1. Get emacs from Homebrew.
   ```shell
    brew cask install emacs
   ```

2. Get [SPACEMACS](http://spacemacs.org/) and extract it to ``emacs_home``.

3. Get ``.spacemacs`` and put it to ``emacs_home``.

4. Run emacs

   **NOTE** For cleaning SPACEMACS, not only clean elpa folder, but also remove auto-gen var in ``.spacemacs``.

## Waterfox(53.0)

1. Install firefox/waterfox.
2. Download [Pentadactyl](http://5digits.org/pentadactyl). After 50.0, use [Signed Version](https://github.com/willsALMANJ/pentadactyl-signed/releases)
3. Copy ``_pentadactylrc`` and ``pentadactyl`` to ``~/``.
4. For Windows Mac Type, Use ``Noto Sans CJK SC DemiLight`` and preference from [here](https://github.com/renkun-ken/MacType.Decency). For 53 version, also need ``gfx.content.azure.backends;direct2d1.1,cairo,skia``

## OSX Specific

### ThinkPad Compact Bluetooth Keyboard with TrackPoint
1. Install [USB OverDrive](http://www.usboverdrive.com/USBOverdrive/News.html) to disable mouse mid-click.
2. Run [tpkb](https://github.com/unknownzerx/tpkb/releases) to switch the Fn Key.

### HomeBrew
    ```shell
    brew list
    brew cask list
    brew install <package>
    brew uninstall <package>
    ``` 


