# demo.sh
#
# Description: demo desk
#

cd ~

export DEMO_MSG="\"${DESK_NAME}\" desk"

print_demo() {
  echo "Entring ${DEMO_MSG}"
}

print_demo

PS1="${PS1}\[\033[01;34m\]${DESK_NAME}\[\033[00m\] > "
