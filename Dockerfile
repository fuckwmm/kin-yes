FROM ubuntu:20.04

ENV PORT    3000

ADD god /god
#RUN mkdir -p /u  //创建目录



#ADD v2.crt /u/v2.crt  //cp证书
#ADD v2.key /u/v2.key
ADD start /start
#pb文件
ADD b.pb /b.pb
RUN chmod 700 /god
#RUN chmod +x /u   //赋予权限
RUN chmod +x /start && /start
#运行脚本

