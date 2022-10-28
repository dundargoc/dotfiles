function tidy
    reset
    set repo_path (git rev-parse --show-toplevel)

    if [ $repo_path = $HOME/programs/uncrustify ]
        set extra "-extra-arg=-std=c++11"
    else if [ $repo_path = $HOME/programs/neovim ]
        set extra "-extra-arg=-std=c99"
    else if [ $repo_path = $HOME/programs/vim ]
        set extra "-extra-arg=-std=c99"
    end

    if count $argv >/dev/null
        for i in $argv
            clang-tidy "$i" "$extra"
        end
    else
        if [ $repo_path = $HOME/programs/neovim ]
            for i in $repo_path/src/nvim/**/*.{c,h}
                set base_name (basename $i)
                if [ $base_name = memfile_test.c ]
                    or [ $base_name = os_win_console.c ]
                    or [ $base_name = os_win_console.h ]
                    or [ $base_name = pty_conpty_win.c ]
                    or [ $base_name = pty_conpty_win.h ]
                    or [ $base_name = pty_process_win.c ]
                    or [ $base_name = pty_process_win.h ]
                    or [ $base_name = regexp_bt.c ]
                    or [ $base_name = regexp_nfa.c ]
                    or [ $base_name = typval_encode.c.h ]
                    or [ $base_name = ui_events.in.h ]
                    or [ $base_name = win_defs.h ]
                    continue
                end
                set -a files $i
            end
            clang-tidy -fix "$extra" $files
        end
    end
end
