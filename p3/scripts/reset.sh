#!/bin/bash

# Clean up deployment
kubectl delete namespace argocd
kubectl delete namespace dev