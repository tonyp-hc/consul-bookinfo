consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "reviews",
  "namespace": "oc-consul",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "details",
  "namespace": "oc-consul",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "bookinfo",
  "namespace": "oc-consul",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "productpage",
  "namespace": "oc-consul",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "ratings",
  "namespace": "oc-consul",
  "protocol": "http"
}
EOF

