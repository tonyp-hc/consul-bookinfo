# consul-bookinfo
## Deploy consul-bookinfo

```bash
# working out of consul-bookinfo/1-service-defaults/ 

$ oc apply -f ratings.yaml
$ oc apply -f reviews.yaml
$ oc apply -f details.yaml
$ oc apply -f productpage.yaml
```

Next, configure the consul service-defaults and service-router for all of these microservices.
Open a shell session in one of the consul client pods:
```bash
$ oc exec -it <CONSUL_CLIENT_POD> -- /bin/sh
```

Double check that you have consul available from this host:
```bash
$ consul version
Consul v1.9.0+ent-beta1
Revision 97019dcbb
Protocol 2 spoken by default, understands 2 to 3 (agent will automatically use protocol >2 when speaking to compatible agents)

$ consul catalog datacenters
oc-us-east-poc
```

Apply the following service-defaults. These commands are also available in `service-defaults.sh` in this directory.
```bash
$ consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "reviews",
  "protocol": "http"
}
EOF
Config entry written: service-defaults/reviews
```

```bash
$ consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "details",
  "protocol": "http"
}
EOF
Config entry written: service-defaults/details
```

```bash
$ consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "bookinfo",
  "protocol": "http"
}
EOF
Config entry written: service-defaults/bookinfo
```

```bash
$ consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "productpage",
  "protocol": "http"
}
EOF
Config entry written: service-defaults/productpage
```

```bash
$ consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "ratings",
  "protocol": "http"
}
EOF
Config entry written: service-defaults/ratings
```

Apply the following service-router configuration. These commands can also be found in `service-router.sh` in this directory.
```bash
$ consul config write -<<EOF
kind = "service-router"
name = "bookinfo"
routes = [
  {
    match {
      http {
        path_prefix = "/reviews"
      }
    }

    destination {
      service = "reviews",
    }
  },
  {
    match {
      http {
        path_prefix = "/details"
      }
    }

    destination {
      service = "details",
    }
  },
  {
    match {
      http {
        path_prefix = "/ratings"
      }
    }

    destination {
      service = "ratings",
    }
  }
]
EOF
Config entry written: service-router/bookinfo
```

Now, we should be able to check out the bookinfo application through the service LB that was provisioned. Get the LB address by running:
```bash
$ oc get services productpage
NAME          TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
productpage   LoadBalancer   <INTERNAL_IP>    <EXTERNAL_IP> 80:31990/TCP   32m
```

Visit `<EXTERNAL_IP>/productpage` and you should see a page like the following:
![default bookinfo deployment with consul](images/consul-bookinfo-default.png)

Refreshing the page will alternate between reviews services (no stars, black stars, red stars). 
