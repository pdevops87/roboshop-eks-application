# roboshop-eks-application


What Helm actually is
Helm is a package manager for Kubernetes.
It manages packages called charts.
Charts contain Kubernetes resource definitions (Deployment, Service, ConfigMap, Job, etc.).


Where Kubernetes resources come from
Kubernetes resources (like Pod, Deployment, Service, Job, StatefulSet) are defined in charts.
A chart is a collection of manifests and templates.
You can make a chart for any combination of resources you need.


Helm CLI → installs/updates charts → charts create/manage Kubernetes resources

Helm = Kubernetes package manager
Chart = package of manifests
Release = installed chart in a cluster
Makes deploying complex apps much easier than manually creating deployments/services/etc.


Why use Helm
Reusability – Use charts across environments (dev, staging, prod)
Versioning – Track releases and roll back easily
Templating – Charts can have dynamic values via values.yaml
Simplifies upgrades – helm upgrade updates all related resources automatically

Installing Helm = installing the client tool
Installing charts = deploying actual resources in your cluster


chart File Structure:
======================
wordpress/
Chart.yaml          # A YAML file containing information about the chart
LICENSE             # OPTIONAL: A plain text file containing the license for the chart
README.md           # OPTIONAL: A human-readable README file
values.yaml         # The default configuration values for this chart
values.schema.json  # OPTIONAL: A JSON Schema for imposing a structure on the values.yaml file
charts/             # A directory containing any charts upon which this chart depends.
crds/               # Custom Resource Definitions
templates/          # A directory of templates that, when combined with values,
# will generate valid Kubernetes manifest files.
templates/NOTES.txt # OPTIONAL: A plain text file containing short usage notes


helm install "release-name" . (deploy a chart with default values , here default values means values.yaml)
helm install demo . (here . is a current directory)
templating value dynamically through cli : helm install demo . --help 
helm install demo . --set podName=test(to set through cli)
specific yaml file has to deploy:
================================
helm install demo . -f test/cart.yaml
(Helm installs a chart as a release” means it deploys the chart into the cluster and tracks it under a release name, not that it creates a new chart)

Make file:
==========
all:
  git pull 
  helm install demo . -f test/cart.yaml
  helm install demo . -f test/user.yaml
  helm install demo . -f test/payment.yaml
  helm install demo . -f test/catalogue.yaml
  helm install demo . -f test/frontend.yaml
  helm install demo . -f test/shipping.yaml
  

helm upgrade -i demo . -f test/cart.yaml


data:
{{ .Values.configMapData | toYaml | indent2 }}

