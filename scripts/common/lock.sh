#!/bin/sh

export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_PASSWORD_PROMPT=cursor
export XSECURELOCK_SINGLE_AUTH_WINDOW=1
export XSECURELOCK_LIST_VIDEOS_COMMAND="find ~/ScreenSavers -type f"
xsecurelock
