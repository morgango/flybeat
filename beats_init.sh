# setup filebeat
sudo add-apt-repository ppa:webupd8team/java
sudo apt update; 
sudo apt install oracle-java8-installer

curl https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

for SVC in metricbeat filebeat logstash; do

	echo "*********************************************" 
	echo "Installing $SVC"
	echo "*********************************************" 
	sudo apt-get update && sudo apt-get install $SVC
	sudo update-rc.d $SVC defaults 95 10
	sudo service $SVC start
done

sudo mv /etc/metricbeat/metricbeat.yml /etc/metricbeat/metricbeat.yml.old
sudo ln -s /etc/metricbeat/metricbeat.yml ~/flybeat/metricbeat.yml

