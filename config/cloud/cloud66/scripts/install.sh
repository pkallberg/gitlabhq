#!/bin/bash
FILE=/tmp/install_done

if [ -f $FILE ]
then
	echo "File $FILE exists..."
else
	source /var/.cloud66_env
	apt-get install libicu-dev -y
    apt-get install acl -y
    echo | sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install -y git
    sudo apt-get install -y sendmail
    mv /usr/bin/ruby /usr/bin/ruby_old
    sudo touch /tmp/install_done
fi





