#!/bin/sh

scp -r /etc/hadoop/conf root@hadoop1:/etc/hadoop/
scp -r /etc/hadoop/conf root@hadoop2:/etc/hadoop/
scp -r /etc/hadoop/conf root@hadoop3:/etc/hadoop/
scp -r /etc/hadoop/conf root@hadoop4:/etc/hadoop/
scp -r /etc/hadoop/conf root@hadoop5:/etc/hadoop/

