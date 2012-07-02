#!/bin/bash

username=bob
password=123456

curl -v -X POST \
  -d "message[title]=bob&message[body]=joe&message[recipient_ids][]=1" \
  -u $username:$password \
  http://localhost:3000/messages.json
