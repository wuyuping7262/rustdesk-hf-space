FROM debian:stable-slim

RUN apt update && apt install -y wget unzip

# 下载 RustDesk Server（hbbs + hbbr 最新版可改）
RUN wget https://github.com/rustdesk/rustdesk-server/releases/download/1.1.10/rustdesk-server-linux-x64.zip \
 && unzip rustdesk-server-linux-x64.zip \
 && mv hbbs hbbr /usr/local/bin/ \
 && chmod +x /usr/local/bin/hbbs /usr/local/bin/hbbr

# 暴露端口：
# 21114 = Rendezvous
# 21115 = Relay
# 21116 = API
EXPOSE 21114 21115 21116

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
