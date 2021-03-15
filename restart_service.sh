function restart()
{
    kubectl delete -f ./srcs/$1.yaml
    eval $(minikube docker-env)
    docker build srcs/$1 -t $1_img
    kubectl create -f srcs/$1.yaml
}