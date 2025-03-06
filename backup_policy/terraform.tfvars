compartment_id = "ocid1.compartment.oc1..aaaaaaaamgamf64s7adosgyjcix6yd2gwu42gozmpp4snfgzfzmqb4equ5yq"

volumes = [
  "ocid1.volume.oc1.phx.abyhqljtr7umim53yz4ltnc2q67klns4zdjdhxrtqi6qy5bgbjm4bvipsyqa",
  "ocid1.volume.oc1.phx.abyhqljtmqaiwjkjayzjwbbf3vqycjn2lxqs23fbfxeb5mqv6gvztnv5qsta",
]
schedules = [
  {
    backup_type         = "INCREMENTAL"
    backup_period       = "ONE_DAY"
    retention_seconds   = 2592000
    time_schedule_start = "2025-02-18T02:00:00Z"
  },
  {
    backup_type         = "INCREMENTAL"
    backup_period       = "ONE_DAY"
    retention_seconds   = 2592000
    time_schedule_start = "2025-02-19T03:00:00Z"
  }
]
