#!/bin/bash

mkdir -p $HOME/logs
count=3
user="root"
password="sanjiv436"
host="35.188.133.98"

# Prepare
sudo sysbench --test=../../usr/share/sysbench/oltp_common.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql prepare

# Run with different thread count
while [ $count -lt 10 ]
do
	sudo sysbench --test=../../usr/share/sysbench/oltp_read_only.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_read_only.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_read_write.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_read_write.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_write_only.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_write_only.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_insert.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_insert.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_delete.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_delete.log
	sudo sysbench --test=../../usr/share/sysbench/oltp_update_index.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql --threads=$((2**count)) run >> $HOME/logs/oltp_update_index.log
	
	count=$((count + 1))
done

# Cleanup
sudo sysbench --test=../../usr/share/sysbench/oltp_common.lua --mysql-user=$user --mysql-password=$password --mysql-db=dbname --mysql-host=$host --db-driver=mysql cleanup
