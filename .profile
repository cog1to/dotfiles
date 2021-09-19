#
# ~/.profile
# Loads once on initial login.
#

# Common apps.
export TERMINAL="st"
export BROWSER="min"

# Main userspace paths.
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/bin
export PATH=$PATH:~/.local/bin

# XDG
export XDG_CONFIG_HOME=~/.config

# Do not change this unless you want to completely by-pass Arch Linux' way
# of handling Java versions and vendors. Instead, please use script `archlinux-java`
export PATH=${PATH}:/usr/lib/jvm/default/bin

# NPM Packages path
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH=$NPM_PACKAGES/bin:$PATH

# Android environment
export ANDROID_HOME=$HOME/dev/android/sdk
export ANDROID_SDK_ROOT=$HOME/dev/android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA7_HOME=/usr/lib/jvm/java-7-openjdk
export PATH=/opt/android-studio/bin:$PATH

# LaTeX
export PATH=$PATH:~/utils/texlive/bin/x86_64-linux/

# Quick emulator launchers
alias emuc='emulator -avd Compact_API_29 1>/dev/null 2>/dev/null &'

# React-Native
alias rns='npx react-native start'
alias rnra='npx react-native run-android'
alias rnla='npx react-native log-android'

# Mounting external HDD
alias exthd-hfs='sudo mount -t hfsplus -o force,rw,umask=000,gid=storage /dev/sdb2 ~/exthd'
alias exthd-ntfs='sudo mount -t ntfs -o force,rw,umask=000,gid=storage /dev/sdb1 ~/exthd'

# NVM config.
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# LS_COLORS; just having some fun with it at the moment, colors are not final
export LS_COLORS="di=1;38;5;69:ex=38;5;208:ow=1;34;47"
# Color `ls` output by default.
alias ls='ls --color=auto'

