consul config write -<<EOF
Kind = "service-router"
Name = "bookinfo"
Routes = [
  {
    Match {
      HTTP {
        PathPrefix = "/reviews"
      }
    }

    Destination {
      Service = "reviews",
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/details"
      }
    }

    Destination {
      Service = "details",
    }
  },
  {
    Match {
      HTTP {
        PathPrefix = "/ratings"
      }
    }

    Destination {
      Service = "ratings",
    }
  }
]
EOF
