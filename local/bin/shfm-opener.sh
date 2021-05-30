#!/bin/sh -e
    #
    # open file in application based on file extension

    case $1 in
        *.mp3|*.flac|*.wav|*.opus)
            mpv --no-video "$1"
        ;;

        *.mp4|*.mkv|*.webm)
            mpv "$1"
        ;;

        *.png|*.gif|*.jpg|*.JPG|*.jpe|*.jpeg)
            devour sxiv "$1"
        ;;

        *.html|*.htm)
            w3m "$1"
        ;;

        *.pdf|*.djvu)
            devour zathura "$1"
        ;;

        # all other files
        *)
            "${EDITOR:=vim}" "$1"
        ;;
    esac
