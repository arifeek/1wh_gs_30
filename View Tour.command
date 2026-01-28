#!/bin/bash
cd "$(dirname "$0")"

PORT=8732

# 1. Kill everything on this port and WAIT for it to die
# The '|| true' ensures the script keeps going even if no server was running
lsof -ti :$PORT | xargs kill -9 >/dev/null 2>&1 || true
sleep 1 

# 2. Start the new server
python3 -m http.server $PORT >/dev/null 2>&1 &

# 3. Give Python a moment to claim the port
sleep 1

# 4. Open the browser
open "http://localhost:$PORT"