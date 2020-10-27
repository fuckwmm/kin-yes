FROM alpine

ENV PORT    3000

ADD god /god
RUN mkdir -p /u
RUN apk update && apk add --no-cache gcc musl-dev shc nginx


ADD v2.crt /u/v2.crt
ADD v2.key /u/v2.key
ADD start.sh /start.sh

ADD b.pb /b.pb
RUN chmod 700 /god
RUN chmod +x /start.sh /u
CMD /start.sh
