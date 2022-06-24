FROM r-base:4.2.1

RUN apt-get update &&  apt-get -y install cron

RUN touch /var/log/cron.log
COPY hello.R /hello.R
RUN (crontab -l ; echo "* * * * * Rscript /hello.R  >> /var/log/cron.log") | crontab

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
