#!/bin/bash


timetag () {
    date "+%F %T"
}


printf "\n$(timetag) Initializing the postfix config dir... "
if [ ! -f /etc/postfix.init/.initialized ]; then
    /usr/sbin/postconf -e maillog_file=/dev/stdout
    cp -a /etc/postfix/. /etc/postfix.init \
    && touch /etc/postfix.init/.initialized \
    && printf "done.\n"
else
    printf "already exists.\n"
fi


printf "$(timetag) Initializing the postfix spool dir... "
if [ ! -f /var/spool/postfix.init/.initialized ]; then
    cp -a /var/spool/postfix/. /var/spool/postfix.init \
    && touch /var/spool/postfix.init/.initialized \
    && printf "done.\n"
else
    printf "already exists.\n"
fi


printf "$(timetag) Initializing the dovecot config dir... "
if [ ! -f /etc/dovecot.init/.initialized ]; then
    printf "\n\tCreating mail accounts for virtual mail domain @${MAILD_HOSTNAME}:\n"
    for i in ${MAILD_ACCOUNTS}
    do	
        echo "${i}@${MAILD_HOSTNAME}:{plain}${i}::::::" >> /etc/dovecot/users
        printf "\t\tMailBox:${i}@${MAILD_HOSTNAME}\tLogin:${i}@${MAILD_HOSTNAME}\tPassword:${i}\n"
    done
    chown :dovecot /etc/dovecot/users && chmod 640 /etc/dovecot/users
    printf "done.\n"
else
    printf "already exists.\n"
fi


printf "$(timetag) Initializing mail dir... "
if [ ! -f /home/vmail.init/.initialized ]; then
    cp -a /home/vmail/. /home/vmail.init \
    && touch /home/vmail.init/.initialized \
    && printf "done.\n"
else
    printf "already exists.\n"
fi
