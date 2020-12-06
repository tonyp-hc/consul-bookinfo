consul config write -<<EOF
Kind = "service-router"
Name = "bookinfo"
Routes = [
  {
    Match {
      HTTP {
        Header = [
          {
            Name  = "end-user"
            Exact = "alice"
          },
        ],
        PathPrefix = "/reviews"
      }
    }
    Destination {
      Service       = "reviews"
      ServiceSubset = "v3"
    }
  },
  {
    Match {
      HTTP {
        Header = [
          {
            Name  = "end-user"
            Exact = "bob"
          },
        ],
        PathPrefix = "/reviews"
      }
    }
    Destination {
      Service       = "reviews"
      ServiceSubset = "v2"
    }
  },
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
