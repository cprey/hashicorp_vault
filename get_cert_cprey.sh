#!/bin/bash

# export the Vault token: `export RVT=s.ShchKgFOwvUnAsFnUImidg0i`


curl --header "X-Vault-Token: $RVT" \
       --request POST \
       --data "{\"common_name\": \"$1.cprey.loc\", \"ttl\": \"600s\"}" \
       http://127.0.0.1:8200/v1/pki_cprey_int/issue/j | jq
