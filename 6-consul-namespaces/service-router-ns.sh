consul config write -<<EOF
kind = "service-router"
name = "bookinfo"
namespace = "oc-consul"
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

