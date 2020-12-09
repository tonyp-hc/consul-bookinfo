consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "details",
  "namespace": "oc-details",
  "protocol": "http"
}
EOF
