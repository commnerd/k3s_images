#!/bin/bash

STEPS=(web-server reverse-tunnel)
SLEEP_TIME=300
CURRENT_STEP=0

function debug_msg {
    [ $DEBUG ] && echo $1
}

function home_up {
    [ $(curl --write-out '%{http_code}' --silent --connect-timeout 5 --output /dev/null https://home.michaeljmiller.net) == 200 ] && echo 1
}

function web_reboot {
    debug_msg "Rebooting web server"
    ssh mike sudo reboot
}

function home_reboot {
    debug_msg "Reboting home deployment"
    ssh mike ssh cp01 sudo kubectl -n home-assistant scale deployment home-assistant --replicas=0
    sleep 45
    ssh mike ssh cp01 sudo kubectl -n home-assistant scale deployment home-assistant --replicas=1 
}

while :
do
    debug_msg "Sleeping for $(expr $SLEEP_TIME / 60) minutes."
    sleep $SLEEP_TIME

    debug_msg "Checking connection"
    if [ ! "$(home_up)" ]
    then
	debug_msg "Entering step ${CURRENT_STEP}"
	case ${CURRENT_STEP} in
	    0)
                web_reboot
                ;;
            1)
                home_reboot
                ;;
            *)
                echo "Step ${CURRENT_STEP} not implemented!";
                exit;
                ;;
        esac
        CURRENT_STEP=$(expr $(expr ${CURRENT_STEP} + 1) % ${#STEPS[@]})
    fi
done
