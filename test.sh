#!/bin/bash
(
if [[ ! $(VBoxManage) ]]; then
    brew update
    brew tap phinze/cask
    brew install brew-cask
    brew cask install virtualbox
fi
if [[ ! $(boot2docker version) ]]; then
    brew update
    brew install boot2docker
    brew install docker
    boot2docker init
fi
if [[ ! $(boot2docker status) = "running" ]]; then
    boot2docker up
fi

IFS='
'
re='export (.*)'
for x in `boot2docker shellinit`;  do
    if [[ $x =~ $re ]]; then
        eval ${BASH_REMATCH[0]};
    fi
done

docker run --rm -v $(pwd):$(pwd) -w $(pwd) xzyfer/docker-libsass:3.1.0 --version
)
