container_name="camunda"
docker stop $container_name
docker rm $container_name
docker run -d --name $container_name -p 8080:8080 camunda/camunda-bpm-platform:latest
