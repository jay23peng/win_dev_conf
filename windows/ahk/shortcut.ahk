;; AHK Script for shortcut on Windows Platform
;; It is better that to use Keytweak to do the key remap,
;; and use AHK for new shortcut

;; This is a trick for AppsKey itself, or else the context
;; menu cannot be invoked
AppsKey::Send {AppsKey}

;; LCtrl + [ and C-g --> Esc
;; For EMACS, they are already in defined in config files as "quit"
;; For VIM, map to ESC is OK.
SetTitleMatchMode, 1
#IfWinNotActive, emacs
LCtrl &  g:: Send {ESC}
LCtrl &  [::Send {Esc}
#IfWinNotActive

;; Map ` and ~ back with AppsKey + Esc/q
AppsKey  &  q:: Send {``}
AppsKey  & Esc::Send {`~}

;; AppsKey + arsw(asdw in colemak) --> Arrow
AppsKey  &  r:: Send {Down}
AppsKey  &  s:: Send {Right}
AppsKey  &  a:: Send {Left}
AppsKey  &  w:: Send {Up}

;; AppsKey + Space --> Everything
AppsKey  &  Space:: Run, "C:\Program Files\Everything\Everything.exe"

;; AppsKey + LCtrl --> Backspace
AppsKey  & LCtrl:: Send {BS}

;; AppsKey + 1,2,3...+ --> F1 to F12
AppsKey  &  1:: Send {F1}
AppsKey  &  2:: Send {F2}
AppsKey  &  3:: Send {F3}
AppsKey  &  5:: Send {F5}
AppsKey  &  6:: Send {F6}
AppsKey  &  7:: Send {F7}
AppsKey  &  8:: Send {F8}
AppsKey  &  9:: Send {F9}
AppsKey  &  0:: Send {F10}
AppsKey  &  -:: Send {F11}
AppsKey  &  +:: Send {F12}

;; AppsKey + f/b --> Map back to Alt
AppsKey  & f::  Send {Alt Down}{f}{Alt Up}
AppsKey  & b::  Send {Alt Down}{b}{Alt Up}

;; Apps + 4 is special since we need Alt+F4
AppsKey  &  4::
If GetKeyState("Alt","4") {
    Send {Alt down}{F4}{Alt up}
}
else {
    Send {F4}
}
Return

;; Apps + d --> Delete
AppsKey  &  d:: 
If GetKeyState("Shift", "d") {
    Send {Shift down}{Del}{Shift up}
  }
else {
    Send {Del}
}
Return

;; Other functional key that follow hhkb. 
;; Note: it is based on colemak so looks strange
AppsKey  &  e:: Send {PgUp}
AppsKey  &  ,:: Send {PgDn}
AppsKey  &  n:: Send {Home}
AppsKey  &  m:: Send {End}
AppsKey  &  i:: Send {Alt down}{PrintScreen}{Alt up} 
