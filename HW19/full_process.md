- Создаём StorageClass
<pre>
  kind: StorageClass
  apiVersion: storage.k8s.io/v1
  metadata:
    name: manual
  provisioner: kubernetes.io/no-provisioner
  volumeBindingMode: WaitForFirstConsumer
</pre>
- Создаём в этом StorageClass PersistentVolume
<pre>
  apiVersion: v1
  kind: PersistentVolume
  metadata:
    name: ruslan-volume
  spec:
    storageClassName: manual
    capacity:
      storage: 10Gi
    accessModes:
    - ReadWriteOnce
    hostPath:
      path: /mr/zk  
</pre>
- Делаем запрос в этот Volume на выделение ресурсов (PersistentVolumeClaim)
<pre>
  apiVersion: v1
  kind: PersistentVolumeClaim
  metadata:
    name: task-pv-claim
  spec:
    storageClassName: manual
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 3Gi
</pre>
- И вот только теперь можно делать манифест для mongo с выделенным хранилищем
<pre>
  apiVersion: apps/v1
  kind: StatefulSet
  metadata:
    name: mongo
  spec:
    serviceName: mongo
    replicas: 1
    selector:
      matchLabels:
        app: mongo
    template:
      metadata:
        labels:
          app: mongo
      spec:
        volumes:
        - name: mongo-data
          persistentVolumeClaim:
            claimName: task-pv-claim
        containers:
        - name: mongo
          image: mongo:latest
          ports:
          - containerPort: 27017
          volumeMounts:
          - name: mongo-data
            mountPath: /data/db
          env:
          - name: MONGO_INITDB_ROOT_USERNAME
            value: "root"
          - name: MONGO_INITDB_ROOT_PASSWORD
            value: "password"
          volumeMounts:
          - mountPath: "/usr/share/mongo"
            name: mongo-data
</pre>
