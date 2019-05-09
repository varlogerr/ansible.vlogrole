# golang.sh
#
# Description: golang desk
#

cached_path=${PATH}

# Generate go project structure
go-gen-project() {
  mkdir "${GOPATH}"/{bin,src,pkg}
}

# set new GOPATH, GOBIN and append new GOBIN to PATH
go-set-paths() {
  local gopath=$(realpath ${1})
  local gobin="${gopath}/bin"

  if [ ! -d "${gopath}" ]; then
    echo "directory '${gopath}' not found"  
    return
  fi

  export GOPATH=${gopath}
  export GOBIN=${gobin}
  export PATH="${cached_path}:${gobin}"
  echo "GOPATH is set to '${gopath}'" 
}

# detect and set GOPATH in given directory path (defaults to pwd)
go-detect-path() {
  local current_path=${1:-$(pwd)}
  current_path=$(realpath ${current_path})

  if [ ! -d "${current_path}" ]; then
    echo "directory '${current_path}' not found"  
    return
  fi

  local detected_path=${current_path}
  local candidate_path=${current_path}
  while [ "${candidate_path}" != "/" ]; do
    if [ -d "${candidate_path}/src" ]; then
      detected_path=${candidate_path}
      break    
    fi

    candidate_path=$(dirname ${candidate_path})
  done

  go-set-paths ${detected_path}
}

# install tools for go in vscode
go-install-vscode-tools() {
  go get -u -v github.com/ramya-rao-a/go-outline
  go get -u -v github.com/acroca/go-symbols
  go get -u -v github.com/mdempsky/gocode
  go get -u -v github.com/rogpeppe/godef
  go get -u -v golang.org/x/tools/cmd/godoc
  go get -u -v github.com/zmb3/gogetdoc
  go get -u -v golang.org/x/lint/golint
  go get -u -v github.com/fatih/gomodifytags
  go get -u -v golang.org/x/tools/cmd/gorename
  go get -u -v sourcegraph.com/sqs/goreturns
  go get -u -v golang.org/x/tools/cmd/goimports
  go get -u -v github.com/cweill/gotests/...
  go get -u -v golang.org/x/tools/cmd/guru
  go get -u -v github.com/josharian/impl
  go get -u -v github.com/haya14busa/goplay/cmd/goplay
  go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
  go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
  go get -u -v github.com/alecthomas/gometalinter
  gometalinter --install
}

go-detect-path

PS1="${PS1}\[\033[01;34m\]${DESK_NAME}\[\033[00m\] > "
