# Completions for trans (translate-shell)
# Command-line translator
# Author: Leonardo da Rosa Eugênio <lelgenio@disroot.org>


function __fish_complete_trans_list_langs
    string replace -arf '^Locale\["([\w-]+)"\].*' '$1' < (which trans) |
    sort -u
end

function __fish_complete_trans_list_engines
    trans -S | string replace -r '^..' ''
end


# Information options
complete -f -c trans -s V -o version -d "Print version"
complete -f -c trans -s H -o help -d "Print help message"
complete -f -c trans -s M -o man -d "Show man page"
complete -f -c trans -s T -o reference -d "Print name of all supported languages"
complete -f -c trans -s R -o reference-english -d "Print name of all supported languages in English"
complete -f -c trans -s L -o list -r -a "(__fish_complete_trans_list_langs)" -d "Print details of languages, concatenate with '+'"
complete -f -c trans -s S -o list-engines -d "List available translation engines and exit"
complete -f -c trans -s U -o upgrade -d "Check for upgrade of this program"

# Translator options
complete -f -c trans -s e -o engine -r -a "(__fish_complete_trans_list_engines)" -d "Specify the translation engine to use (default: google)"

# Display options
complete -f -c trans -o verbose -d "Verbose mode (enabled by default)"
complete -f -c trans -s U -o upgrade -d "Check for upgrade of this program"
complete -f -c trans -s b -o brief -d "Show the most relevant translation"
complete -f -c trans -s d -o dictionary -d "Show the definition of the original word"
complete -f -c trans -o dictionary -d "Show the definition of the original word"
complete -f -c trans -o identify -d "Show the identified language of the original text"
# Display options (y/n)
complete -f -c trans -r -a "y n" -o show-original -d "Show original text. (default: yes)"
complete -f -c trans -r -a "y n" -o show-original-phonetics -d "Show phonetic notation of original text. (default: yes)"
complete -f -c trans -r -a "y n" -o show-translation -d "Show translation. (default: yes)"
complete -f -c trans -r -a "y n" -o show-translation-phonetics -d "Show phonetic notation of translation. (default: yes)"
complete -f -c trans -r -a "y n" -o show-prompt-message -d "Show prompt message. (default: yes)"
complete -f -c trans -r -a "y n" -o show-languages -d "Show source and target languages. (default: yes)"
complete -f -c trans -r -a "y n" -o show-original-dictionary -d "Show dictionary entry of original text. (default: no)"
complete -f -c trans -r -a "y n" -o show-dictionary -d "Show dictionary entry of translation. (default: yes)"
complete -f -c trans -r -a "y n" -o show-alternatives -d "Show alternative translations. (default: yes)"
# Display options (with args)
complete -f -c trans -s w -o width -d 'Specify the screen width for padding (default: $COLUMNS)'
complete -f -c trans -o indent -r -d 'Specify the size of indent'
complete -f -c trans -o theme -r -d "Specify the theme to use"
# Display options (y/n 2: electric boogaloo)
complete -f -c trans -o no-theme -d "Do not use any other theme than default"
complete -f -c trans -o no-ansi -d "Do not use ANSI escape codes"
complete -f -c trans -o no-autocorrect -d "Do not autocorrect  (if defaulted by the translation engine)"
complete -f -c trans -o no-bidi -d "Do not convert bidirectional texts"
complete -f -c trans -o bidi -d "Always convert bidirectional texts"
complete -f -c trans -o no-warn -d "Do not write warning messages to stderr"
complete -f -c trans -o dump -d "Print raw API response instead"

# Audio options
complete -f -c trans -s p -o play -d "Listen to the translation"
complete -f -c trans -o speak -d "Listen to the original text"
complete -f -c trans -s n -o narrator -r -a "male female" -d "Specify the narrator of the translation"
complete -f -c trans -o player -r -a "mplayer mpv mpg123" -d "Specify the audio player (can be any player that accepts urls)"
complete -f -c trans -o no-play -d "Do not listen to the translation"
complete -f -c trans -o no-translate -d "Do not translate anything when using -speak"
complete -f -c trans -o download-audio -d "Download the audio to the current directory"
complete -f -c trans -o download-audio-as -r -d "Download the audio to the specified file"

# Terminal paging and browsing options
complete -f -c trans -s v -o view -d "View the translation in a terminal pager"
complete -f -c trans -pager -r -d "Specify the terminal pager to use, and view the translation"
complete -f -c trans -o no-view -d "Do not view the translation in a terminal pager"
complete -f -c trans -o no-pager -d "Do not view the translation in a terminal pager"
complete -f -c trans -o browser -r -d "Specify the web browser to use"
complete -f -c trans -o no-browser -d "Do not open the web browser"

# Networking options
complete -f -c trans -s x -o proxy -r -d "Use HTTP proxy on given port"
complete -f -c trans -s u -o user-agent -d "Specify the User-Agent to identify as"
complete -f -c trans -s 4 -o ipv4 -o inet4-only -d "Connect only to IPv4 addresses"
complete -f -c trans -s 6 -o ipv6 -o inet6-only -d "Connect only to IPv6 addresses"

# Interactive shell options
complete -f -c trans -s I -o interactive -o shell -d "Start an interactive shell, by invoking rlwrap"
complete -f -c trans -s E -o emacs -d "Start the GNU Emacs front-end for an interactive shell"
complete -f -c trans -o no-rlwrap -d "Do not invoke rlwrap when starting an interactive shell"

# I/O options
complete -F -c trans -s i -o input -d 'Specify the input file'
complete -F -c trans -s o -o output -d 'Specify the output file'

# Language preference options
complete -c trans -r -a "(__fish_complete_trans_list_langs)" -s l -o hl -o lang -d 'Specify prefered display language'
complete -c trans -r -a "(__fish_complete_trans_list_langs)" -s l -o hl -o lang -d 'Specify prefered display language'
complete -c trans -r -a "(__fish_complete_trans_list_langs)" -s s -o sl -o source -o from -d 'Specify the source language'
complete -c trans -r -a "(__fish_complete_trans_list_langs)" -s t -o tl -o target -o to -d 'Specify the target language'

complete -c trans -d "[SOURCES]:" -a "(__fish_complete_trans_list_langs):"
complete -c trans -d ":[TARGETS]" -a "(string match -r -- '.*:' (commandline -ct))(__fish_complete_trans_list_langs)"
complete -c trans -d "[SOURCES]:[TARGETS]+[TARGETS]" -a "(string match -r -- '.*[+]' (commandline -ct))(__fish_complete_trans_list_langs)+"

# Text preprocessing options
complete -c trans -s j -o join-sentence -d 'Treat all arguments as one single sentence.  Other options'

# Other options
complete -c trans -o no-init -d 'Do not load any initialization script'
