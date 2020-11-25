consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "reviews",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "details",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "bookinfo",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "productpage",
  "protocol": "http"
}
EOF

consul config write -<<EOF
{
  "kind": "service-defaults",
  "name": "ratings",
  "protocol": "http"
}
EOF

