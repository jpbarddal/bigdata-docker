build-hadoop:
	docker build -t jpbarddal/hadoop-base:1.0 hadoop-base
	docker push jpbarddal/hadoop-base:1.0
	docker build -t jpbarddal/hadoop-namenode:1.0 hadoop-namenode
	docker push jpbarddal/hadoop-namenode:1.0
	docker build -t jpbarddal/hadoop-datanode:1.0 hadoop-datanode
	docker push jpbarddal/hadoop-datanode:1.0
	docker build -t jpbarddal/hadoop-resourcemanager:1.0 hadoop-resourcemanager
	docker push jpbarddal/hadoop-resourcemanager:1.0
	docker build -t jpbarddal/hadoop-historyserver:1.0 hadoop-historyserver
	docker push jpbarddal/hadoop-historyserver:1.0
	docker build -t jpbarddal/hadoop-nodemanager:1.0 hadoop-nodemanager
	docker push jpbarddal/hadoop-nodemanager:1.0
build-spark:
	docker build -t jpbarddal/spark-base:1.0 spark-base
	docker push jpbarddal/spark-base:1.0
	docker build -t jpbarddal/spark-master:1.0 spark-master
	docker push jpbarddal/spark-master:1.0
	docker build -t jpbarddal/spark-worker:1.0 spark-worker
	docker push jpbarddal/spark-worker:1.0
	docker build -t jpbarddal/spark-gui:1.0 spark-gui
	docker push jpbarddal/spark-gui:1.0

build-zeppelin:
	docker build -t jpbarddal/zeppelin:1.0 zeppelin


build-everything: build-hadoop build-spark #build-zeppelin
