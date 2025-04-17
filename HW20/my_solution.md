- вместо php взял свой [контейнер с fastapi-приложением](https://hub.docker.com/repository/docker/rivallar/hw20/general), которое выводит "Hello world!"
- сделал для него Deployment:
<pre>
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-fastapi
  labels:
    app: my-fastapi
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-fastapi
  template:
    metadata:
      labels:
        app: my-fastapi
    spec:
      containers:
      - name: my-fastapi
        image: rivallar/hw20:latest
        ports:
            - containerPort: 8088
  </pre>

- Прикрутил Service (default, т.к. будем использовать Ingress):
<pre>
apiVersion: v1
kind: Service
metadata:
  name: ruslan-internal-service
spec:
  selector:
    app: my-fastapi
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8088
</pre>

- Установил Ingress Controller: `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/cloud/deploy.yaml`
- Создал Ingress и прикрутил к установленному контроллеру:
<pre>
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ruslan-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: ruslan-internal-service
            port:
              number: 80
</pre>
- Т.к. hostname у нас нет - будем обращаться по внешнему hostname ingress: `kubectl get ing`
- Заходим в браузере по хосту ingress:
  ![image](https://github.com/user-attachments/assets/baf4216c-fa66-4036-b98e-86fec09a6b41)
