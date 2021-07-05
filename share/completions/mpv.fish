set fish_trace 1

command mpv --list-options 2>/dev/null | while read line
    string match '[deprecated]'
    and continue
    string match -rq '^\s*--(?<opt>[\w-]+).*' $line
    or continue

    string match -r '(?<=Choices:)([\w\s]+)' $line |
        string match -raq '\s*(?<choices>\w+)'

    string match -rq '(?<description>Flag.*$)' $line
        complete -c mpv -l "no-$opt" -d "$description"

    complete -c mpv -l "$opt" -a "$choices" -d "$description"
end

complete -c mpv -l start -x -d "Seek to given position (%, s, hh:mm:ss)"
complete -c mpv -l no-audio -d "Disable audio"
complete -c mpv -l no-video -d "Disable video"
complete -c mpv -l fs -d "Fullscreen playback"
complete -c mpv -l sub-file -r -d "Specify subtitle file"
complete -c mpv -l playlist -r -d "Specify playlist file"
