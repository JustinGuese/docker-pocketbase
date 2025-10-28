# docker-pocketbase

docker image build pipeline for pocketbase https://github.com/pocketbase/pocketbase

## following the official install instructions for

https://pocketbase.io/docs/going-to-production/#using-docker

## run / install

`docker-compose up`

## helm/kubernetes

cd helm

Check the `values.yaml` and adapt accordingly. The chart includes a new boolean value, `createNamespace` (default: `false`), which controls whether the chart renders a `Namespace` resource.

Recommended workflows

- Preferred (simple and safe): create the namespace once outside Helm and install multiple releases into it. This avoids Helm claiming ownership of the namespace and blocking other releases.

```bash
# create namespace once
kubectl create namespace pocketbase

# install releases into the pre-created namespace
helm upgrade --install pocketbase-documentchat . -n pocketbase --set createNamespace=true --create-namespace
helm upgrade --install pb-myopiagraph . -n pocketbase
```

- Alternative (create via chart only for the first release): if you want the chart to create the Namespace resource and have Helm own it, set `createNamespace=true` for the first release only. DO NOT set this for subsequent releases into the same namespace.

```bash
# first install (chart creates Namespace and Helm will annotate it)
helm upgrade --install pocketbase-documentchat . -n pocketbase --set createNamespace=true --create-namespace

# later installs: leave createNamespace=false (default)
helm upgrade --install pb-myopiagraph . -n myopiagraph
```

If you already hit the Helm ownership error ("invalid ownership metadata; annotation validation error"), you can remove the Helm ownership annotations from the namespace so other releases can be installed:

```bash
kubectl annotate namespace pocketbase meta.helm.sh/release-name- meta.helm.sh/release-namespace-
```

Notes

- `createNamespace: false` is the default in `helm/values.yaml` so the chart will not claim namespace ownership unless you explicitly set it.
- Use `helm lint ./helm` to validate the chart templates before installing.

Relevant links

https://console.cloud.google.com/auth/clients/1047001783431-0dtaj3ol66ott2fhqtlmrpbt3glp923v.apps.googleusercontent.com?project=secret-outpost-476510-t4&supportedpurview=project
