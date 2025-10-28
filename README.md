# docker-pocketbase

docker image build pipeline for pocketbase https://github.com/pocketbase/pocketbase

## following the official install instructions for

https://pocketbase.io/docs/going-to-production/#using-docker

## run / install

`docker-compose up`

## helm/kubernetes

cd helm

check the values.yaml and adapt accordingly

`helm upgrade --install pocketbase-documentchat . -n pocketbase --create-namespace`
