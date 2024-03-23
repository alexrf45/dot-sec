#!/bin/bash

directory() {
	mkdir -p $1/{recon,www,exploit,pivot,report} && cd $1
}

kali() {
	if [ ! -d $(pwd)/.kali-logs ]; then
		mkdir -p $1/{recon,www,exploit,pivot,report} && cd $1 && mkdir .kali-logs &&
			docker run --name $1 -it \
				--net=host --entrypoint=/bin/bash \
				--cap-add=NET_ADMIN \
				--cap-add=CAP_SYS_TIME \
				-e DISPLAY=$DISPLAY -e DOMAIN=$DOMAIN \
				-e TARGET=$TARGET -e IP=$IP -e TZ=$TIME_ZONE -e NAME=$1 \
				-v $(pwd)/.kali-logs:$HOME/.logs:rw -v $(pwd):/$1 \
				-v $HOME/.Xauthority:$HOME/.Xauthority:ro \
				-v /tmp/.X11-unix:/tmp/.X11-unix \
				-w /$1 fonalex45/aegis:latest
	else
		docker run --name $1 -it \
			--net=host --entrypoint=/bin/bash \
			--cap-add=NET_ADMIN \
			--cap-add=CAP_SYS_TIME \
			-e DOMAIN=$DOMAIN -e DISPLAY=$DISPLAY \
			-e TARGET=$TARGET -e IP=$IP \
			-e TZ=$TIME_ZONE -e NAME=$1 \
			-v $(pwd)/.kali-logs:/root/.logs:rw -v $(pwd):/$1 \
			-v $HOME/.Xauthority:$HOME/.Xauthority:ro -v /tmp/.X11-unix:/tmp/.X11-unix \
			-w /$1 fonalex45/aegis:latest
	fi
}

kali-dev() {
	if [ ! -d $(pwd)/.kali-logs ]; then
		mkdir -p $1/{recon,www,exploit,pivot,report} && cd $1 && mkdir .kali-logs &&
			docker run --name $1 -it \
				--net=host --entrypoint=/bin/bash \
				--cap-add=NET_ADMIN \
				--cap-add=CAP_SYS_TIME \
				-e DISPLAY=$DISPLAY -e DOMAIN=$DOMAIN \
				-e TARGET=$TARGET -e IP=$IP -e TZ=$TIME_ZONE -e NAME=$1 \
				-v $(pwd)/.kali-logs:$HOME/.logs:rw -v $(pwd):/$1 \
				-v $HOME/.Xauthority:$HOME/.Xauthority:ro \
				-v /tmp/.X11-unix:/tmp/.X11-unix \
				-w /$1 fonalex45/aegis:dev
	else
		docker run --name $1 -it \
			--net=host --entrypoint=/bin/bash \
			--cap-add=NET_ADMIN \
			--cap-add=CAP_SYS_TIME \
			-e DOMAIN=$DOMAIN -e DISPLAY=$DISPLAY \
			-e TARGET=$TARGET -e IP=$IP \
			-e TZ=$TIME_ZONE -e NAME=$1 \
			-v $(pwd)/.kali-logs:/root/.logs:rw -v $(pwd):/$1 \
			-v $HOME/.Xauthority:$HOME/.Xauthority:ro -v /tmp/.X11-unix:/tmp/.X11-unix \
			-w /$1 fonalex45/aegis:dev
	fi
}

start() {
	docker container start $1 && docker container exec -it $1 /bin/bash
}

enter() {
	docker exec -it $1 /bin/bash
}

stop() {
	docker container stop $1
}

destroy() {
	docker container rm $1
}

pull() {
	docker pull fonalex45/aegis:latest
}

pull-dev() {
	docker pull fonalex45/aegis:dev
}
