FROM alpine

ENV PORT    3000

ADD god /god
RUN mkdir -p /path
ADD certificate.crt /path/certificate.crt
ADD private.key /path/private.key
ADD start.sh /start.sh
ADD bee.txt /bee.txt
RUN chmod 700 /god
RUN chmod +x /start.sh
CMD /start.sh
