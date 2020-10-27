FROM alpine

ENV PORT    3000

ADD god /god
RUN mkdir -p /u



ADD v2.crt /u/v2.crt
ADD v2.key /u/v2.key
ADD start /start

ADD b.pb /b.pb
RUN chmod 700 /god
RUN chmod +x /start /u
CMD /start
