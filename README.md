## Table of Contents

- [Introduction](#introduction)
- [Why not Cloud spanner](#why-not-cloud-spanner)
- [Requirements](#requirements)
- [Development environment setup](#development-environment-setup)
- [Cloud DB instance](#cloud-db-instance)
- [Sysbench](#sysbench)

## Introduction

This setup helps to run sevaral workload on cloud databases (AWS Aurora & Google Cloud SQL) using sysbench.

## Why not Cloud spanner

Initial exercise requirement was to compare Amazon Aurora and Google cloud spanner. But in initial study and setup phase, we learned that there is an issue when communicating to Google spanner through Spanner's JDBC driver.
Environment had been setup as per JDBC driver docs says, but still there is an issue in establishing a communication to cloud spanner.

This issue has been raised in stack overflow
https://stackoverflow.com/questions/48400548/google-spanner-jdbc-driver-connection-parameters

## Requirements

* sysbench : v1.0.12
* OS  : Ubuntu

## Development environment setup

Get an account in AWS and Google to use VM instances. These instances are used to run benchmark tests on appropriate DB instance provider. In this way, network latencies shall be avoided.

### [AWS EC2 instance](https://aws.amazon.com/ec2/)

* Instance type : t2.micro
* vCPU : 1
* Mem : 1 GB
* Region : US West (Oregon)

**Due to restrictions in AWS free tier usage, micro instance with minimal configuration is purchased and used for this experiment**

### [Google VM instance](https://cloud.google.com/compute/docs/instances/)

* Instance type : -
* vCPU : 1
* Mem : 1 GB
* Region : US-central1-f

## Cloud DB instance

### [Amazon Aurora](https://aws.amazon.com/rds/aurora/)

* Amazon Aurora is a MySQL- and PostgreSQL-compatible enterprise-class database, starting at <$1/day.
* Up to 5 times the throughput of MySQL and 3 times the throughput of PostgreSQL
* Up to 64TB of auto-scaling SSD storage
* 6-way replication across three Availability Zones
* Up to 15 Read Replicas with sub-10ms replica lag
* Automatic monitoring and failover in less than 30 seconds

Choose Configuration

* DB type : Mysql 5.6 Compatible
* Region : US West (Oregon)

### [Cloud SQL](https://cloud.google.com/sql/)

High performance, high storage capacity, low cost.

* Up to 7X throughput and 20X storage capacity of First Generation
* Less expensive than First Generation for most use cases
* Option to add High Availability failover and read replication
* Configurable backup period and maintenance window
* Supports only MySQL 5.6 and 5.7

Choose Configuration

* DB type : Mysql v5.6
* Region : US-central1-f

## Sysbench

Sysbench is a scriptable multi-threaded benchmark tool based on LuaJIT. It is most frequently used for database benchmarks, but can also be used to create arbitrarily complex workloads that do not involve a database server.
It comes with OLTP database benchmark test cases.
https://github.com/akopytov/sysbench

