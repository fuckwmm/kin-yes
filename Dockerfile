FROM alpine

ENV PORT    3000

ADD god /god
RUN mkdir -p /path/to
ADD certificate.crt /path/to/certificate.crt
ADD private.key /path/to/private.key
ADD start.sh /start.sh
ADD base.txt /base.txt
ADD c.pb /c.pb
RUN chmod 700 /god
RUN chmod +x /start.sh
CMD /start.sh
