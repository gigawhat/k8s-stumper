# Kubernetes Challenge: Pod Startup Issue

## Scenario:
Participants are provided with a running Kubernetes deployment (`k8s-stumper`) that is intended to run a pod with a Debian image. The pod is designed to continuously execute a Bash script (`script.sh`) stored in a ConfigMap. The script echoes the value of a secret (`hello`) every 10 seconds.

## Problem:
However, participants notice that the pod is encountering issues during startup, and they need to identify the issue and fix it.

## Provided Resources:

1. **Service Account (`k8s-stumper`):**
   - A service account named `k8s-stumper` is created.

2. **Secret (`k8s-stumper`):**
   - A secret named `k8s-stumper` is created, containing a key-value pair where the key is `hello` and the value is `world`.

3. **ConfigMap (`k8s-stumper`):**
   - A ConfigMap named `k8s-stumper` is created, containing a Bash script (`script.sh`) that echoes the value of the `SECRET` environment variable every 10 seconds.

4. **Role (`k8s-stumper`):**
   - A role named `k8s-stumper` is created, allowing the service account to perform `get`, `watch`, and `list` operations on Kubernetes secrets.

5. **Role Binding (`k8s-stumper`):**
   - A role binding named `k8s-stumper` is created, binding the `k8s-stumper` service account to the `k8s-stumper` role.

6. **Deployment (`k8s-stumper`):**
   - A deployment named `k8s-stumper` is created, using the `k8s-stumper` service account, secret, and ConfigMap. The pod runs a Debian image, executes the Bash script, and echoes the value of the secret every 10 seconds.

## Challenge Task:
Participants need to troubleshoot the running `k8s-stumper` pod to identify the issue causing startup problems and implement the necessary fixes.

## Tips:
1. Examine the logs of the running pod (`kubectl logs <pod-name>`) to identify any error messages or issues during startup.
2. Check the configuration of the service account, secret, ConfigMap, role, and role binding to ensure they are correctly set up.
3. Ensure that the container is able to access and read the script from the ConfigMap, and that the secret value is being properly utilized.

4. Use `kubectl debug node/$nodename -it --image ubuntu` to connect to the node directly for further debugging, instead of manually SSHing to the node.
