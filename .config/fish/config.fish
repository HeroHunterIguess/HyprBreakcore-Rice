if status is-interactive
    # Commands to run in interactive sessions can go here
end

# echo that after command finishes
function add_newline_after_command --on-event fish_postexec
    echo "-------------------"
end

# calculator alias'
alias calc='cd "/home/herohunter/Everything/Coding/rust projects/" && rustc FINALcalculator.rs && "/home/herohunter/Everything/Coding/rust projects/"FINALcalculator'


# cd into folder for waves game files
alias cdw='cd ~/Everything/godot\ projects/waves'
