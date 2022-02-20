curl -s http://34.125.203.155:8081/service/rest/v1/repositories | jq '.[] | select ( .format == "docker" ) | .name ' | sed 's/"//g'
