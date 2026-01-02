kubectl get nodes
kubectl get pods 
kubectl get pods -A
kubectl get pods -o wide 
kubectl describe pod <pod_name>
kubectl logs <pod_name>
kubectl exec -it <pod_name> -- bash
kubectl run <podname> --image=<image_name>
kubectl --kubeconfig <config_file_name>
kubectl apply -f <manifest.yaml/.json>
kubectl delete -f <manifest.yaml/.json>
kubectl api-resources
kubectl run <podname> --image=<image_name> --dry-run=client -o yaml
kubectl exec -it <multi-container-pod-name> -c <exec_into_container> -- bash
kubectl explain pod.spec.containers 
kubectl get pods -l env=dev
kubectl label pod pod1 env=dev
kubectl label pod pod1 env-
kubectl get pods --show-labels
kubetcl label pod --all status=running
kubectl delete pods --all

#ReplicaSet
kubectl scale replicaset <replicaset-name> --replicas=<replicaset_number>
kubectl get replicaset
kubectl delete rs <replicaset_name>

#Deployment
kubectl create deployment <deployment-name>
kubectl rollout history deployment <deployment-name>
kubect set image deployment/<name_of_deployment> <current_image>=<new_image>
kubectl rollout undo deployment <nginx-deployment>
kubectl rollout undo deployment <nginx-deployment> --to-revision=<revision_number>
kubectl scale --replicas=3 deployment nginx-deployment
kubectl delete deployment <deployment_name>

#PriorityClass
kubectl get priorityclass
kubectl create priorityclass low-priority high-priority --value=1000 --description="high priority"

#services
kubectl create service clusterip <test-service> --tcp=<source-port>:<target-port>
kubectl expose pod <pod_name> --name <service_name> --port <port_number> --target-port <target_port_number>

#ingress
kubectl create ingress <ingress-name> --class=nginx --rule="example.internal/*=example-service:80" --rule="kplabs.internal/*=kplabs-service:80"

#service accounts
kubectl create serviceaccount <custom-token>
kubectl create sa <cutsom-sa>
kubectl get sa
kubectl run-custom 

#named ports 
#step 1 : create a pod with a container port exposed eg:below
kubectl run nginx --image=nginx --port=80 --dry-run=client -o yaml > named_port.yaml

#edit & save a name to the spec : containerPort section of the yaml file & create a service with target-port as the named port
kubectl expose pod nginx --name named-svc --port=80 --target-port=custom-http --type=NodePort

#metrics api - you need to have metrics server configured
kubectl top pods 
kubectl top pods -A 

#kubernetes hpa(horizontal pod autoscaler)
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=3
kubectl get hpa

#gateway
kubectl get gateway