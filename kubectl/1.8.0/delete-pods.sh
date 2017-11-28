#! /bin/sh

while true
do
	kubectl annotate --overwrite --token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token) nodes $NODE_NAME cloud.appscode.com/kubeadm-version=$(kubeadm version -o short)
	sleep 300
done

# Get all pods matching the input and put them in an array. If no input then all pods are matched.
pods=(`kubectl get pods "${selector[@]}" --namespace=${namespace} --output=jsonpath='{.items[*].metadata.name}' | xargs -n1 | grep $grep_matcher "${pod}"`)
matching_pods_size=${#matching_pods[@]}


