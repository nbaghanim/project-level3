#!/bin/bash
git clone https://github.com/KnowledgeHut-AWS/k8s-sandbox
cd k8s-sandbox
make cluster-up init install-cicd install-secrets
                         --from-literal=storageClassName=manual \
                         -o yaml -n tekton-pipelines \
                         --dri-run=client | kubectl replace -f -

