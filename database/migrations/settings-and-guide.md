| Parameter                           | Value          | Why                                                                                                               |
| ----------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------- |
| **enable_partition_pruning**        | `on` (default) | Required for pruning state partitions.                                                                            |
| **enable_partitionwise_join**       | **`on`**       | Lets Postgres join `Voter` ↔ `DistrictVoter` _per-state partition_ → smaller join working sets and faster plans. |
| **enable_partitionwise_aggregate**  | `on`           | Faster counts/sums across partitions.                                                                             |
| **max_parallel_workers_per_gather** | `0`–`1`        | Parallel workers often hurt perf on partitioned scans.                                                            |
| **track_io_timing**                 | `on`           | Enables I/O visibility for Aurora storage latency.                                                                |
| **pg_stat_statements.max**          | `10000`        | Captures high-cardinality query patterns.                                                                         |
| **wal_compression**                 | `on`           | Reduces WAL volume during ETL loads.                                                                              |
| **max_wal_size**                    | `16GB`         | Smoother write throughput.                                                                                        |

When using a blue/green setup with separate schemas (as opposed to separate DBs), you must make sure that the tables are bound to their relations in the same schema, including enums. Schemas have no isolation between them.
