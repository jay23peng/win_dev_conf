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

    ​


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

5. Pull [redguardtoo/emacs.d](https://github.com/redguardtoo/emacs.d) to $EMACS_HOME.

   ```shell
   git clone https://github.com/redguardtoo/emacs.d.git <emacs_home>/.emacs.d
   ```

6. Open init.el, comment line below:

   ```lisp
    ;; comment below line if you want to setup color theme in your own way  
    (if (or (display-graphic-p) (string-match-p "256color"(getenv "TERM"))) (require 'init-color-theme))
   ```

7. Copy ``.custom.el`` to ``<emacs_home>``.

8. Invoke emacs. select all encoding to ``utf8``, answer all killing request to ``n``. Wait a couple of minutes. Make sure no compile error.

9. Copy ``emacs.bat`` to ``C:\windows``.

### OSX

1. Download emacs and install.
2. Do step 5 - 8 in windows.

## Firefox

1. Install firefox/waterfox.
2. Download [Pentadactyl](http://5digits.org/pentadactyl).
3. Copy ``_pentadactylrc`` and ``pentadactyl`` to ``~/``.





