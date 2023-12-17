#!/bin/bash

# Check if BASE_URL is set
if [ -z "$BASE_URL" ]; then
    echo "Error: BASE_URL is not set."
    exit 1
fi

echo "window._env_ = { \"BASE_URL\": \"$BASE_URL\" };" > /usr/share/nginx/html/assets/config.js

sed -i "8i \ \ \ \ <script type=\"module\" src=\"./assets/config.js\"></script>" /usr/share/nginx/html/index.html

exec "$@"