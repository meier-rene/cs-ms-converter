#!/bin/bash
dockerd &
sleep 5
exec "$@"
exec "$@"