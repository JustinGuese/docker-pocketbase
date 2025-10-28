# docker-pocketbase

docker image build pipeline for pocketbase https://github.com/pocketbase/pocketbase

## following the official install instructions for

https://pocketbase.io/docs/going-to-production/#using-docker

## run / install

`docker-compose up`

## helm/kubernetes

cd helm

check the values.yaml and adapt accordingly

Create the namespace once (if it doesn't exist):

```bash
kubectl create namespace pocketbase
```

Install a release into the existing namespace (do NOT use --create-namespace when the namespace is already managed):

```bash
helm upgrade --install pocketbase-documentchat . -n pocketbase
kubectl annotate namespace pocketbase meta.helm.sh/release-name- meta.helm.sh/release-namespace-
helm upgrade --install pb-myopiagraph . -n pocketbase
```

Note: omit `--create-namespace` when installing additional releases into the same namespace. If you run with `--create-namespace` and the namespace is already annotated as owned by another Helm release, the install will fail with an ownership metadata error.

https://console.cloud.google.com/auth/clients/1047001783431-0dtaj3ol66ott2fhqtlmrpbt3glp923v.apps.googleusercontent.com?project=secret-outpost-476510-t4&supportedpurview=project
