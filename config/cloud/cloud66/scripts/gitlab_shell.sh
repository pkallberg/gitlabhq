#!/bin/bash
FILE=/tmp/gitlab_shell_done

if [ -f $FILE ]
then
	echo "File $FILE exists..."
else
	source /var/.cloud66_env
    chmod 666 /var/.cloud66_env
	cd /home/git
    sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-shell.git
    cd gitlab-shell
    git checkout tags/v1.9.1
    sudo -u git -H cp $STACK_PATH/config/gitlab_config.yml config.yml
    sudo -u git -H ./bin/install
    sudo touch /tmp/gitlab_shell_done
fi