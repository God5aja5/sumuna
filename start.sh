#!/bin/bash

# Start tmate
tmate -S /tmp/tmate.sock new-session -d
echo "⏳ Waiting for tmate session..."
tmate -S /tmp/tmate.sock wait tmate-ready
echo "✅ Tmate is ready!"
tmate -S /tmp/tmate.sock display -p "🔗 SSH: ssh %{tmate_ssh}"
tmate -S /tmp/tmate.sock display -p "🌐 Web: %{tmate_web}"

# Start express server (so pinging works)
node server.js &

# Keep container alive
tail -f /dev/null
