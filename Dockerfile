FROM alpine

ENV PORT    3000

ADD god /god
ADD start.sh /start.sh
RUN mkdir -p /path/to
ADD certificate.crt /path/to/certificate.crt
ADD private.key /path/to/private.key
ADD base.txt /base.txt
RUN chmod 700 /god
RUN chmod +x /start.sh
CMD /start.sh
