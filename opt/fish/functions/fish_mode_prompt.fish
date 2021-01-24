function fish_mode_prompt --description 'Displays the current mode'
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold 282C34
                set_color --background blue
                echo " "
            case insert
                set_color --bold 282C34
                set_color --background green
                echo " "
            case replace_one
                set_color --bold 282C34
                set_color --background magenta
                echo " "
            case replace
                set_color --bold 282C34
                set_color --background red
                echo " "               
            case visual
                set_color --bold 282C34
                set_color --background yellow
                echo " "
        end
    end
end
