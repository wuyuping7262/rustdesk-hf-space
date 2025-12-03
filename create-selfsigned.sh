#!/bin/bash
# 如果 /etc/nginx/ssl/server.crt 及 server.key 不存在，则创建自签名证书（有效期 10 年）
CRT=/etc/nginx/ssl/server.crt
KEY=/etc/nginx/ssl/server.key
if [ ! -f "$CRT" ] || [ ! -f "$KEY" ]; then
  echo "[init] Creating self-signed certificate..."
  hostname=$(hostname -f 2>/dev/null || echo "rustdesk.local")
  openssl req -x509 -nodes -newkey rsa:2048 -days 3650 \
    -subj "/CN=${hostname}" \
    -keyout "$KEY" -out "$CRT" >/dev/null 2>&1
  echo "[init] Self-signed cert created for CN=${hostname}"
else
  echo "[init] Certificate found, skipping creation."
fi
# Ensure permissions
chmod 600 "$KEY" || true
