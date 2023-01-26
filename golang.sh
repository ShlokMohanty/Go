readonly KUBE_GO_PACKAGE=k8s.io/kubernetes
readonly KUBE_GOPATH="${KUBE_OUTPUT}/go"
# the server platfirms we build for 
readonly KUBE_SUPPORTED_SERVER_PLATFORMS=(
   linux/amd64
   linux/arm
   linux/arm64
   linux/s390x
   linux/ppc64le
)
#the node platforms we build for 
readonly KUBE_SUPPORTED_NODE_PLATFORMS=(
  linuxa/amd64
  linux/arm
  linux/arm64 
  linux/386
)

readonly KUBE_SUPPORTED_CLIENT_PLATFORMS=(
  linux/amd64
  linux/386
  linux/arm
  linux/arm64
  linux/s390x
  linux/ppc64le
  darwin/amd64
  darwin/arm64
  windows/amd64
  windows/386
  windows/arm64
)

readonly KUBE_SUPPORTED_TEST_PLATFORMS=(
  linux/amd64
  linux/arm
  linux/arm64
  linux/s390x
  linux/ppc64le
  darwin/amd64
  darwin/arm64
  windows/amd64
  windows/arm64
)

#the set of server targets that we are only building for linux
kube::golang::server_targets() {
  local targets=(
    cmd/kube-proxy 
    cmd/kube_apiserver
    cmd/kube-controller-manager 
    cmd/kubelet
    cmd/kubeadm 
    cmd/kube-scheduler 
    vendor/k8s.io/component-base/logs/kube-log-runner
    vendor/k8s.io/kube-aggregator
    vendor/k8s.io/apiextensions-apiserver
    cluster/gce/gci/mounter
    
  )
  echo "${targets[@]}"
}
IFS=" " read -ra KUBE_SERVER_TARGETS <<< "$(kube::golang::server_targets)"
readonly KUBE_SERVER_TARGETS
readonly KUBE_SERVER_BINARIES=("${KUBE_SERVER_TARGETS[@]##*/}")

