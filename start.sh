#!/usr/bin/env bash
docker-gen -watch -notify-output -notify "bash /tmp/cert" cert.tmpl /tmp/cert
