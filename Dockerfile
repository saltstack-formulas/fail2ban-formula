 Test default configuration scheme (config.sls)
FROM      martinhoefling/salt-minion:debian
MAINTAINER Martin Hoefling <martin.hoefling@gmx.de>
# push formula
ADD fail2ban /srv/salt/fail2ban
ADD pillar.example /srv/pillar/example.sls
RUN echo "file_client: local" > /etc/salt/minion.d/local.conf
RUN echo "base:" > /srv/pillar/top.sls
RUN echo "  '*':" >> /srv/pillar/top.sls
RUN echo "    - example" >> /srv/pillar/top.sls
RUN salt-call --local state.sls fail2ban.config | tee log.txt && grep "Failed:    0" log.txt

# Test pillar template configuration scheme (config-pt.sls)
FROM      martinhoefling/salt-minion:debian
MAINTAINER Martin Hoefling <martin.hoefling@gmx.de>
# push formula
ADD fail2ban /srv/salt/fail2ban
ADD pillar-pt.example /srv/pillar/example.sls
RUN echo "file_client: local" > /etc/salt/minion.d/local.conf
RUN echo "base:" > /srv/pillar/top.sls
RUN echo "  '*':" >> /srv/pillar/top.sls
RUN echo "    - example" >> /srv/pillar/top.sls
RUN salt-call --local state.sls fail2ban.config-pt | tee log.txt && grep "Failed:    0" log.txt