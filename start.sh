#!/bin/bash

echo "Starting RustDesk hbbs (Rendezvous Server) ..."
hbbs -r 0.0.0.0:21115 &

echo "Starting RustDesk hbbr (Relay Server) ..."
hbbr -r 0.0.0.0:21115

wait
