;; AHK Script for shortcut on Windows Platform
;; It is better that to use Keytweak to do the key remap,
;; and use AHK for new shortcut

;; LCtrl + [ and C-g --> Esc
;; For EMACS, they are already in defined in config files as "quit"
;; For VIM, map to ESC is OK.
LWin & Space::Run "C:\Program Files\Everything\Everything.exe"
LWin & f::Run "C:\Program Files\Everything\Everything.exe"
RWin & Space::Run "C:\Program Files\Everything\Everything.exe"
