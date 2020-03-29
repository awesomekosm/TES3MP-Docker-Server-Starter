## TES3MP Docker Server Starter

##### Required
* Docker 2.1.0.4

#### About

Simplifies hosting of [Elder Scrolls Morrowind Multiplayer Server](https://github.com/TES3MP/openmw-tes3mp)

This docker container is based on TES3MP 0.7-alpha

#### Steps

1. On your server make sure docker is installed.

2. Modify `_TES_SERVER_HOST` in `run.sh` if you want to change location of host(your server) mapped files. 
* data - server permanent store for the players
* tes3mp-server-default.cfg - server configuration

3. Execute `./run.sh`
This will create docker container with the TES3MP server and map the above files to your host  
* The final step in `run.sh` will tail logs of `tes-server` container

#### Help

If your host server is linux, you will need to open ports.  
The default port mapped in docker is `25565`

If on ubuntu, ubuntu firewall(ufw), add a rule by executing `ufw allow 25565/udp`

Now the client will be able to connect using destinationAddress={your server ip} configured in `tes3mp-client-default.cfg`

[Quick Start Guide](https://github.com/TES3MP/openmw-tes3mp/wiki/Quickstart-guide) for client side