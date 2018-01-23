#!/bin/bash

mkdir -p $HOME/logs
count=3

while [ $count -lt 10 ]
do
	sudo sysbench --test=../../usr/share/sysbench/oltp_read_only.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_read_only.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_read_write.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_read_write.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_write_only.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_write_only.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_insert.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_insert.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_delete.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_delete.log
	sudo sysbench --test=../../usr/share/sysbench/select_random_points.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/select_random_points.log
	sudo sysbench --test=../../usr/share/sysbench/select_random_ranges.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/select_random_ranges.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_update_index.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_update_index.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_update_non_index.lua --mysql-user=root --mysql-password=root --mysql-db=dbname --mysql-host=130.211.238.21 --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_update_non_index.log
	count=$((count + 1))
done