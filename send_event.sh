curl -X POST -H "Content-Type: application/json" -d @"$1" http://localhost:8080/engine-rest/process-definition/key/ChooseScenario/start | jq
