#!/bin/bash
FILE=/tmp/gitlab_shell_done

if [ -f $FILE ]
then
	echo "File $FILE exists..."
else
	source /var/.cloud66_env
    chmod 666 /var/.cloud66_env
	cd $STACK_PATH
    bundle exec rake gitlab:shell:install[v1.9.6] REDIS_URL=redis://$REDIS_ADDRESS:6379 RAILS_ENV=production
   	cp $STACK_PATH/config/gitlab_config.yml /home/git/gitlab-shell/config.yml
   	sudo chown -R git:app_writers /home/git/gitlab-shell
    sudo chmod -R g+rwX /home/git/gitlab-shell
    sudo setfacl -d -m u:git:rwX,g:app_writers:rwX /home/git/gitlab-shell
    sudo chown -R git:app_writers /home/git/.ssh/
    sudo chmod -R g+r /home/git/.ssh/
    sudo setfacl -d -m u:git:rwX,g:app_writers:r /home/git/.ssh/
    sudo touch /tmp/gitlab_shell_done
fi