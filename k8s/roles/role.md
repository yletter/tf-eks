
* Create admin user in IAM
* Update aws-auth config map
```
  mapUsers: |
    - userarn: arn:aws:iam::050451371849:user/admin
      username: admin
      groups:
        - system:masters
    - userarn: arn:aws:iam::050451371849:user/pod-reader
      username: pod-reader
      groups:
        - release-reader
    - userarn: arn:aws:iam::050451371849:user/pod-executor-cluster
      username: pod-executor-cluster
      groups:
        - release-debuggers
```