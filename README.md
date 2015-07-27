![](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)

# Overview

This Docker container makes easier to get an instance of Transmission up and running in ARMv7 (armhf) platform such as Raspberry 2, Utilite, Cubox-i, Odroid...

Base Image used [armv7/armhf-archlinux](https://registry.hub.docker.com/u/armv7/armhf-archlinux/), thanks to[@umiddelb](https://github.com/umiddelb)

# Quick Start

The Transmission config directory is used to store all the configuration, I recommend mounting it as a host directory using the [data volume](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume)
	
Transmission-Daemon will be run by daemon user. The first step is to make sure that daemon user is the owner of the ```config``` folder:
	
	docker run -u root -v /host/data/transmission:/config gerardribas/armhf-transmission chown -R daemon /config

The container accepts another volume to be passed on ```/dowloads``` which is the folder for placing the torrents downloaded.

The container exposes the following ports:

- Web Interface: 9091
- Port Forwarding: 50001 (tcp & udp) 

### Start Transmission Container:

	docker run -v /host/data/transmission:/config -v /host/downloads:/downloads --name="transmission" -d -p 9091:9091 -p 50001:50001 -p 50001:50001/udp gerardribas/armhf-transmission

**Success**. Your Transmission Daemon is now ready to be used! Well done! 

Should be available on http://<your_domain>:9091/transmission

# Issue tracker

Please raise an issue if you encounter any problems with this Dockerfile.