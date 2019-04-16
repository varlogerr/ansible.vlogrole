# demo.sh
#
# Description: demo desk
#

cd ~

print_demo() {
  echo "Entring \"${DESK_NAME}\" desk"
}

print_demo

export PS1="${PS1}\[\033[01;34m\]${DESK_NAME}\[\033[00m\] > "
