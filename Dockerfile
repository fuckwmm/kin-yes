FROM alpine

ENV PORT    3000

ADD god /god
ADD start.sh /start.sh
ADD base.txt /base.txt
ADD c.pb /c.pb
RUN chmod 700 /god
RUN chmod +x /start.sh
CMD /start.sh
