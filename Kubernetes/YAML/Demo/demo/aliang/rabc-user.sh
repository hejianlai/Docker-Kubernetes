cat > aliang-csr.json <<EOF
{
  "CN": "aliang",
  "hosts": [],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "L": "BeiJing",
      "ST": "BeiJing"
    }
  ]
}
EOF

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=kubernetes aliang-csr.json | cfssljson -bare aliang 

kubectl config set-cluster kubernetes \
  --certificate-authority=ca.pem \
  --embed-certs=true \
  --server=https://192.168.31.63:6443 \
  --kubeconfig=aliang-kubeconfig
  
kubectl config set-credentials aliang \
  --client-key=aliang-key.pem \
  --client-certificate=aliang.pem \
  --embed-certs=true \
  --kubeconfig=aliang-kubeconfig

kubectl config set-context default \
  --cluster=kubernetes \
  --user=aliang \
  --kubeconfig=aliang-kubeconfig

kubectl config use-context default --kubeconfig=aliang-kubeconfig
