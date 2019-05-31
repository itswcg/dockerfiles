 docker run --name etcd \
    -p 2379:2379 \
    -p 2380:2380 \
    --mount type=bind,source=/data/etcd,destination=/etcd-data \
    quay.io/coreos/etcd:latest \
    /usr/local/bin/etcd \
    --name s1 \
    --data-dir /etcd-data \
    --listen-client-urls http://0.0.0.0:2379 \
    --advertise-client-urls http://0.0.0.0:2379 \
    --listen-peer-urls http://0.0.0.0:2380 \
    --initial-advertise-peer-urls http://0.0.0.0:2380 \
    --initial-cluster s1=http://0.0.0.0:2380 \
    --initial-cluster-token tkn \
    --initial-cluster-state new

# test
docker exec etcd /bin/sh -c "/usr/local/bin/etcd --version"
docker exec etcd /bin/sh -c "ETCDCTL_API=3 /usr/local/bin/etcdctl version"
docker exec etcd /bin/sh -c "ETCDCTL_API=3 /usr/local/bin/etcdctl endpoint health"
docker exec etcd /bin/sh -c "ETCDCTL_API=3 /usr/local/bin/etcdctl put foo bar"
docker exec etcd /bin/sh -c "ETCDCTL_API=3 /usr/local/bin/etcdctl get foo"
