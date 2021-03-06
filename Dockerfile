from   stackbrew/ubuntu:saucy

env   DEBIAN_FRONTEND noninteractive

# REPOS
run    apt-get install -y software-properties-common --force-yes
run    add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
run    add-apt-repository -y ppa:chris-lea/node.js
run    apt-get --yes update --force-yes
run    apt-get --yes upgrade --force-yes

# TOOLS
run    apt-get install -y -q wget 

## NODE
run    apt-get install -y -q nodejs
env   DEBIAN_FRONTEND dialog
run    npm update npm -g
## Bot required
run    apt-get --yes install redis-server python-minimal build-essential --force-yes
run    echo "Europe/Ljubljana" > /etc/timezone
run    rm /etc/localtime
run    ln -s /usr/share/zoneinfo/Europe/Ljubljana /etc/localtime 
## Setup Bot
add    . /opt/bot
run    cd /opt/bot; rm -rf node_modules; npm install
run    wget https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -O /usr/bin/forego; chmod +x  /usr/bin/forego
workdir /opt/bot
cmd ["forego", "start"]
