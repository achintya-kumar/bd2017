#Preparing a source folder for the text file
hadoop fs -mkdir source

#Copying a downloaded text file from gutenberg.org to the source folder inside HDFS
hadoop fs -put MarinerMissionToMars.txt source/MarinerMissionToMars.txt
