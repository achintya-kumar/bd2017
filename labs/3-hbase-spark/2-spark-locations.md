# Hive tasks
### Create separate database 
```
hive> CREATE DATABASE achintya
hive> USE achintya
```

### Create table for the Locations.csv file (I am using OpenCSVSerde to fix the problem of delimiters found inside quoted single values
```
hive> CREATE TABLE my_table(col1 String, col2 String, col3 String, col4 String, col5 String,col6 String, 
col7 String, col8 String, col9 String, col10 String, col11 String, col12 String, col13 String, col14 String, 
col15 String, col16 String, col17 String, col18 String, col19 String, col20 String, col21 String, col22 String, 
col23 String, col24 String, col25 String, col26 String, col27 String, col28 String, col29 String, col30 String, col31 String)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE;
```
### Load Locations.csv into the created table
```
hive> load data inpath '/user/cloudera/source/Locations.csv' into table my_table;
```

# Spark tasks
### Change database
```
scala> sqlContext.sql("use achintya")
```

### Form the aggregation query
```
scala> var results = sqlContext.sql("select col26 as Zip_code, count(*) as Frequency from my_table group by col26 order by col26")
```

### Collect the results
```
scala> results.collect()
res5: Array[org.apache.spark.sql.Row] = Array([10115,15], [10117,66], [10119,11], [10178,43], [10179,6], [10243,7], [10245,13], [10247,10], [10249,3], [10315,1], [10318,2], [10319,1], [10365,1], [10367,1], [10369,1], [10405,22], [10407,4], [10409,1], [10435,17], [10437,19], [10439,5], [10551,5], [10553,1], [10555,7], [10557,9], [10559,2], [10585,4], [10587,3], [10589,7], [10623,40], [10625,12], [10627,12], [10629,18], [10707,14], [10709,8], [10711,10], [10713,4], [10715,8], [10717,8], [10719,18], [10777,14], [10779,4], [10781,6], [10783,3], [10785,13], [10787,7], [10789,15], [10823,12], [10825,2], [10827,5], [10829,3], [10961,24], [10963,4], [10965,8], [10967,14], [10969,5], [10997,18], [10999,16], [12043,3], [12047,3], [12049,1], [12053,1], [12055,2], [12057,1], [12059,1], [12099,6], [...
```

### More readable results can be obtained as 
```
scala> results.show(10000);
+--------+---------+                                                            
|Zip_code|Frequency|
+--------+---------+
|   10115|       15|
|   10117|       66|
|   10119|       11|
|   10178|       43|
|   10179|        6|
|   10243|        7|
|   10245|       13|
|   10247|       10|
|   10249|        3|
|   10315|        1|
|   10318|        2|
|   10319|        1|
|   10365|        1|
|   10367|        1|
|   10369|        1|
|   10405|       22|
|   10407|        4|
|   10409|        1|
|   10435|       17|
|   10437|       19|
|   10439|        5|
|   10551|        5|
|   10553|        1|
|   10555|        7|
|   10557|        9|
|   10559|        2|
|   10585|        4|
|   10587|        3|
|   10589|        7|
|   10623|       40|
|   10625|       12|
|   10627|       12|
|   10629|       18|
|   10707|       14|
|   10709|        8|
|   10711|       10|
|   10713|        4|
|   10715|        8|
|   10717|        8|
|   10719|       18|
|   10777|       14|
|   10779|        4|
|   10781|        6|
|   10783|        3|
|   10785|       13|
|   10787|        7|
|   10789|       15|
|   10823|       12|
|   10825|        2|
|   10827|        5|
|   10829|        3|
|   10961|       24|
|   10963|        4|
|   10965|        8|
|   10967|       14|
|   10969|        5|
|   10997|       18|
|   10999|       16|
|   12043|        3|
|   12047|        3|
|   12049|        1|
|   12053|        1|
|   12055|        2|
|   12057|        1|
|   12059|        1|
|   12099|        6|
|   12101|        1|
|   12103|        7|
|   12105|        3|
|   12107|        8|
|   12109|        1|
|   12157|        2|
|   12159|        7|
|   12161|       11|
|   12163|        8|
|   12165|        6|
|   12167|        1|
|   12169|        3|
|   12203|        3|
|   12205|        5|
|   12207|        6|
|   12209|        7|
|   12247|        4|
|   12249|        2|
|   12277|        1|
|   12279|        1|
|   12305|        8|
|   12309|        3|
|   12347|        2|
|   12349|        5|
|   12351|        6|
|   12353|        3|
|   12355|        2|
|   12357|        4|
|   12359|        2|
|   12435|        9|
|   12437|        5|
|   12439|        3|
|   12459|        2|
|   12487|        2|
|   12489|        3|
|   12524|        2|
|   12526|        1|
|   12527|        5|
|   12555|       12|
|   12557|        2|
|   12559|        6|
|   12587|       13|
|   12589|        2|
|   12619|        2|
|   12621|        1|
|   12623|        2|
|   12627|        6|
|   12629|        2|
|   12679|        4|
|   12683|        2|
|   12685|        5|
|   12687|        2|
|   13055|        4|
|   13086|        4|
|   13088|        6|
|   13089|        1|
|   13125|        3|
|   13129|        1|
|   13156|        3|
|   13158|        4|
|   13159|        1|
|   13187|        7|
|   13189|        3|
|   13347|        7|
|   13349|        2|
|   13353|        7|
|   13355|        1|
|   13357|        4|
|   13403|        2|
|   13405|        5|
|   13407|        3|
|   13409|        4|
|   13435|        2|
|   13437|       10|
|   13465|        3|
|   13467|        8|
|   13469|        7|
|   13503|        2|
|   13505|        7|
|   13509|        1|
|   14480|        5|
|   14547|        1|
|   14558|        1|
|   14974|        2|
|   15345|        5|
|   22926|        3|
|   22941|        1|
|   39106|        1|
|   39179|        3|
|    8001|        2|
|    8037|        1|
|    8952|        1|
+--------+---------+
```