# consul-bookinfo

## Overview
These examples deploy Istio's [Bookinfo application](https://istio.io/latest/docs/examples/bookinfo/) and then adapt it to demonstrate Consul's [L7 traffic management](https://www.consul.io/docs/connect/l7-traffic) functionality.

This deploys the following microservices:
- **productpage**: calls details and reviews services to populate the pages
- **details**: provides book information
- **reviews**: calls the ratings service to provide book reviews and the "star" ratings
- **ratings**: provides book ranking information through the reviews service

The reviews service has three versions:
- **v1**: does not call the ratings service
- **v2**: calls ratings service, displays ratings as 1 to 5 black stars
- **v3**: calls ratings service, displays ratings as 1 to 5 red stars


## Deployment Architecture 
TODO: diagram comparing Istio vs Consul architecture


## Dependencies
All of these examples use the following images:
```bash
docker.io/istio/examples-bookinfo-details-v1:1.16.2
docker.io/istio/examples-bookinfo-productpage-v1:1.16.2
docker.io/istio/examples-bookinfo-ratings-v1:1.16.2
docker.io/istio/examples-bookinfo-reviews-v1:1.16.2
docker.io/istio/examples-bookinfo-reviews-v2:1.16.2
docker.io/istio/examples-bookinfo-reviews-v3:1.16.2
```


## Repository Structure
There are several directories included in this repo and additional examples will be included over time. If an example expects certain prerequisities or dependencies, it will define those. 

This repository currently contains:
```bash
consul-bookinfo
├── 0-default
├── 1-service-defaults
├── 2-service-splitter
└── README.md
```

- `0-default`: original bookinfo application [[github](https://github.com/istio/istio/blob/master/samples/bookinfo/platform/kube/bookinfo.yaml)]
- `1-service-defaults`: baseline bookinfo deployment for consul (including service-default and service-router configuration)
- `2-service-splitter`: extend `1-service-defaults` with consul service-splitter to weight traffic between reviews services