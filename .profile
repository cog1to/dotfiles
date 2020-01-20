#
# ~/.profile
# Loads once on initial login.
#

# Terminal app
export TERMINAL="termite"

# Main userspace paths.
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/bin

# Do not change this unless you want to completely by-pass Arch Linux' way
# of handling Java versions and vendors. Instead, please use script `archlinux-java`
export PATH=${PATH}:/usr/lib/jvm/default/bin

# NPM Packages path
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH=$NPM_PACKAGES/bin:$PATH
export PATH=/opt/android-studio/bin:$PATH

# Android environment
export ANDROID_HOME=$HOME/dev/android/sdk
export ANDROID_SDK_ROOT=$HOME/dev/android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA7_HOME=/usr/lib/jvm/java-7-openjdk

# Quick emulator launchers
alias emuc='emulator -avd Compact_API_29 1>/dev/null 2>/dev/null &'

# React-Native
alias rns='react-native start'
alias rnra='react-native run-android'
alias rnla='react-native log-android'

# Mounting external HDD
alias exthd='sudo mount -t hfsplus -o force,rw,umask=000,gid=storage /dev/sdb2 /mnt/usb'

# DHCPCD fix after VPN disconnect
alias reconnect='sudo dhcpcd wlp0s22f2u3'

# Twitch stream
function twitch {
  local STREAM_NAME=$1
  local QUALITY="480p"
  local TOKEN=""

  if [ -n "$2" ]; then
    QUALITY=$2
  fi

  if [ -n "$TWITCH_OAUTH_TOKEN" ]; then
    TOKEN="--twitch-oauth-token=$TWITCH_OAUTH_TOKEN"
  fi

  streamlink -p "mpv --cache-secs=10" --twitch-oauth-token=$TWITCH_OAUTH_TOKEN www.twitch.tv/$STREAM_NAME $QUALITY 1>/dev/null 2>&1 & disown
}

# Video to GIF. Params:
#   1) Original video file.
#   2) Output GIF file name.
#   3) Output image width. Height will be scaled proportinally keeping the aspect ratio.
function gifify {
  local INPUT=$1
  local OUTPUT=$2
  local WIDTH=""

  if [ -n "$3" ]; then
    WIDTH=",scale=$3:-1:flags=lanczos"
  fi

  `ffmpeg -i $INPUT -vf "fps=10$WIDTH" -c:v pam -f image2pipe - | convert -delay 10 - -layers optimize $OUTPUT`
}

# NVM config.
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

