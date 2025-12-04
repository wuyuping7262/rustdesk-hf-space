# RustDesk Server - HuggingFace / Docker / Railway / VPS

## 快速启动
### Docker 一键运行
```bash
docker run -d \
  --name rustdesk \
  -p 80:80 -p 443:443 \
  -v ./data:/data \
  your_dockerhub/rustdesk-hf-server:latest
