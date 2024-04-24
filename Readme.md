# Build container

```
docker build -t jenkins:jcasc .
```

# Run docker

```
docker run --name jenkins_casc --rm -p 8080:8080 --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=password jenkins:jcasc
```
