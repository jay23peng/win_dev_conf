;; AHK Script 
;; It is better that to use Keytweak to do the key remap,
;; and use AHK for new shortcut

;; This is a trick for AppsKey itself, or else the context
;; menu cannot be invoked
AppsKey::Send {AppsKey}

;; 1. LCtrl + [ --> Esc
Capslock &  [::Send {Esc}
AppsKey  &  `::Send {Esc}

;; 2. AppsKey + arsw(asdw in colemak) --> Arrow
AppsKey  &  r:: Send {Down}
AppsKey  &  s:: Send {Right}
AppsKey  &  a:: Send {Left}
AppsKey  &  w:: Send {Up}

;; 3. AppsKey + 1,2,3...+ --> F1 to F12
AppsKey  &  1:: Send {F1}
AppsKey  &  2:: Send {F2}
AppsKey  &  3:: Send {F3}
AppsKey  &  4:: Send {F4}
AppsKey  &  5:: Send {F5}
AppsKey  &  6:: Send {F6}
AppsKey  &  7:: Send {F7}
AppsKey  &  8:: Send {F8}
AppsKey  &  9:: Send {F9}
AppsKey  &  0:: Send {F10}
AppsKey  &  -:: Send {F11}
AppsKey  &  +:: Send {F12}

;; 4. Other functional key that follow hhkb. 
;;    Note: it is based on colemak so looks strange
AppsKey  &  [:: Send {Del}
AppsKey  &  ]:: Send {BS}
AppsKey  &  e:: Send {PgUp}
AppsKey  &  ,:: Send {PgDn}
AppsKey  &  n:: Send {Home}
AppsKey  &  m:: Send {End}
AppsKey  &  i:: Send {Alt down}{PrintScreen}{Alt up} 
AppsKey  & #[:: Send {Shift down}{Del}{Shift up}
