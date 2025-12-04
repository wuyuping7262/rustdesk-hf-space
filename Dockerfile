FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y wget unzip nginx openssl supervisor

# 下载 RustDesk Server（可改成最新版本）
RUN wget -q https://github.com/rustdesk/rustdesk-server/releases/download/1.1.10/rustdesk-server-linux-x64.zip \
    && unzip rustdesk-server-linux-x64.zip \
    && mv hbbs hbbr /usr/local/bin/ \
    && chmod +x /usr/local/bin/hbbs /usr/local/bin/hbbr \
    && rm rustdesk-server-linux-x64.zip

# 创建数据目录
RUN mkdir -p /data /etc/nginx/ssl
VOLUME ["/data"]

# 复制配置
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY create-selfsigned.sh /usr/local/bin/create-selfsigned.sh
RUN chmod +x /usr/local/bin/create-selfsigned.sh

EXPOSE 80 443

CMD ["/bin/bash", "-lc", "/usr/local/bin/create-selfsigned.sh && supervisord -n"]
