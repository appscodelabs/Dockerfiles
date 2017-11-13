#! /bin/sh

while true
do
	kubectl annotate --overwrite --token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token) nodes $NODE_NAME cloud.appscode.com/kubeadm-version=$(kubeadm version -o short)
	sleep 300
done
