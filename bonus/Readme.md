# Part Bonus :  K3d, Argo CD and Gitlab

In this part, we will use the cluster created in the previous part and deploy an application with Argo CD and self-hosted Gitlab.

To setup our self-hosted Gitlab, we will use the [Gitlab Helm Chart](https://gitlab.com/charts/gitlab).
With our own config value and ingress file.

## Gitlab
Gitlab is an alternative to Github, it's can be self-hosted and it's open source.
Is offer a lot of features like CI/CD, issue tracker, wiki, etc...

