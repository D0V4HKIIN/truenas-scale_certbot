FROM debian:latest

# ENV EMAIL=abc@def.com
# ENV DOMAIN=domain.com

RUN apt update && apt upgrade && apt install certbot cron -y

ADD update_cert.sh /update_cert.sh
# random time for the cronjob not to overload servers (3:22 every 1st of the month)
RUN echo "22 03 1 * * /update_cert.sh" > cronjob && crontab cronjob

CMD ["cron", "&&", "tail", "-f", "/var/log/cron.log]"]