---
category:
  - "[Runbooks](Runbooks)"
  - "[Publish](Publish)"
labels:
  - "[Prometheus](Prometheus)"
  - "[Push Gateway](Push%20Gateway)"
created: 2024-07-03
share: "true"
filename: delete-pushgateway
title: How to delete metrics from Prometheus pushgateway on EKS
---
It is the nature of the push gateway that [metrics accumulate there indefinitely](https://prometheus.io/docs/practices/pushing/#should-i-be-using-the-pushgateway).

To delete metrics on push gateway first identify the pod name of your push gateway:
```bash
kubectl get pods -n monitoring
```

and port forward:
```bash
kubectl port-forward -n monitoring prometheus-pushgateway-0 9091:9091
```

Then you can delete all metrics on there:
```bash
curl -X DELETE http://localhost:9091/metrics
```

Sometimes it does not allow you to do that and returns `Method Not Allowed`

In that case you must identify what you want to delete and delete it.

To see whats on the push gateway:

```bash
curl http://localhost:9091/metrics
```

If the output looks like this:

```text
# TYPE go_memstats_next_gc_bytes gauge
go_memstats_next_gc_bytes 9.254696e+06
# HELP go_memstats_other_sys_bytes Number of bytes used for other system allocations.
# TYPE go_memstats_other_sys_bytes gauge
go_memstats_other_sys_bytes 787257
# HELP go_memstats_stack_inuse_bytes Number of bytes in use by the stack allocator.
# TYPE go_memstats_stack_inuse_bytes gauge
go_memstats_stack_inuse_bytes 884736
# HELP go_memstats_stack_sys_bytes Number of bytes obtained from system for stack allocator.
# TYPE go_memstats_stack_sys_bytes gauge
go_memstats_stack_sys_bytes 884736
# HELP go_memstats_sys_bytes Number of bytes obtained from system.
# TYPE go_memstats_sys_bytes gauge
go_memstats_sys_bytes 2.3434504e+07
# HELP go_threads Number of OS threads created.
# TYPE go_threads gauge
go_threads 11
# HELP kafka_consumer_offset Kafka consumer offset
# TYPE kafka_consumer_offset gauge
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="0",topic="uniform-measurements"} 3.7115087e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="1",topic="uniform-measurements"} 3.7097438e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="11",topic="uniform-measurements"} 3.7726712e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="12",topic="uniform-measurements"} 3.6985725e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="13",topic="uniform-measurements"} 3.704698e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="14",topic="uniform-measurements"} 3.7498527e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="15",topic="uniform-measurements"} 3.751567e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="16",topic="uniform-measurements"} 3.7712061e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="17",topic="uniform-measurements"} 3.7794572e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="18",topic="uniform-measurements"} 3.7088101e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="19",topic="uniform-measurements"} 3.7100156e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="2",topic="uniform-measurements"} 3.7633496e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="3",topic="uniform-measurements"} 3.7615033e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="4",topic="uniform-measurements"} 3.7891533e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="5",topic="uniform-measurements"} 3.7789298e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="6",topic="uniform-measurements"} 3.7076627e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="7",topic="uniform-measurements"} 3.7067366e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="8",topic="uniform-measurements"} 3.7538888e+07
kafka_consumer_offset{instance="",job="kafka_consumer_offsets",partition="9",topic="uniform-measurements"} 3.771821e+07
# HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.
# TYPE process_cpu_seconds_total counter
process_cpu_seconds_total 41.42
# HELP process_max_fds Maximum number of open file descriptors.
# TYPE process_max_fds gauge
process_max_fds 1.048576e+06
# HELP process_open_fds Number of open file descriptors.
# TYPE process_open_fds gauge
process_open_fds 10
# HELP process_resident_memory_bytes Resident memory size in bytes.
```

Then delete what `kafka_consumer_offset` metrics by doing this:
```bash
curl -X DELETE http://localhost:9091/metrics/job/kafka_consumer_offsets
```
