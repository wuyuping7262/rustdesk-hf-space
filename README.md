# RustDesk HuggingFace Space (self-hosted server)

This repository contains a Docker-based RustDesk server setup intended to run on HuggingFace Spaces / Railway / Docker. It runs hbbs and hbbr and places an nginx reverse proxy in front (HTTPS support via mounted certs or self-signed fallback).

## How to deploy to HuggingFace Spaces
1. Fork or push this repo to GitHub.
2. Go to https://huggingface.co/spaces and create a new Space.
3. Select "Docker" and choose "Deploy from GitHub", then point to your fork.
4. After the build finishes, set up a Cloudflare DNS CNAME to point your custom subdomain to `yourname-yourspace.hf.space` (DNS only).
5. Mount certificates via the UI (if HF supports secrets mounting) or rely on Cloudflare managed TLS.

## Notes
- Persist `/data` to keep generated keys (`id_ed25519`, `id_ed25519.pub`), logs, etc.
- If you use Cloudflare, keep Relay DNS as DNS-only to avoid WebSocket/UDP issues.
