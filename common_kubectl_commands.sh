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