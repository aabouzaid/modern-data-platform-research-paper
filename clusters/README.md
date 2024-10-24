# Clusters

The project could work on any infrastructure, either Cloud or On-premises. We decided to run it on Google Cloud Platform (CGP). But also local setup is available via [KIND](./kind/).

## Prerequisites

- [Install the gcloud CLI](https://cloud.google.com/sdk/docs/install)
- [Create project](https://developers.google.com/workspace/guides/create-project)
- [Create access credentials](https://developers.google.com/workspace/guides/create-credentials)
- [Create credentials for a service account](https://developers.google.com/workspace/guides/create-credentials#create_credentials_for_a_service_account)

Save the created key of the service account, which will be used for authentication to create the project's Kubernetes  cluster.

## Authentication

```shell
gcloud auth activate-service-account modern-data-platform-admin@modern-data-platform-paper.iam.gserviceaccount.com \
    --project=modern-data-platform-paper --key-file=modern-data-platform-admin.json
```

## Cluster Creation

A Cloud Kubernetes cluster will be used during the test. Namely, Google Kubernetes Engine (GKE), which simplifies the test process as there is no need to manage the underlying cluster. The next code block shows `gcloud` command used to create the cluster.

```shell
gcloud beta container clusters create-auto "modern-data-platform-paper" \
    --project "modern-data-platform-paper" \
    --region "europe-west4" \
    --release-channel "regular" \
    --network "projects/modern-data-platform-paper/global/networks/default" \
    --subnetwork "projects/modern-data-platform-paper/regions/europe-west4/subnetworks/default" \
    --cluster-ipv4-cidr "/17"
```
