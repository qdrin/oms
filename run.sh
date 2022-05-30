container_name="camunda"
tmp_container="pre_camunda"
rm -r $PWD/tmp/webapps
docker stop $container_name
docker stop $tmp_container
docker rm $container_name
docker rm $tmp_container
docker run -d --name $tmp_container camunda/camunda-bpm-platform:latest
docker cp $tmp_container:/camunda/webapps tmp/
docker stop $tmp_container
docker rm $tmp_container

for d in ROOT docs examples h2 camunda-invoice
do
  echo "d: $d"
  rm -r "$PWD/tmp/webapps/$d"
done

docker run -d --name $container_name -p 8080:8080 \
  -v $PWD/tmp/webapps/:/camunda/webapps/ \
  camunda/camunda-bpm-platform:latest
