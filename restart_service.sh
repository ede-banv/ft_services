function restart()
{
    eval $(minikube docker-env)
    for service in "$@"
    do
        kubectl delete -f ./srcs/$service.yaml
        docker build srcs/$service -t ${service}_img
        kubectl create -f srcs/$service.yaml
    done
}