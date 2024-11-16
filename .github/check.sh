#!/bin/bash

set -xe

if [[ "${LADESA_DEPLOY_NS_LOCAL}" == "true" && "${LADESA_DEPLOY_NS_LOCAL_SERVICE_SSO}" == "true" ]]; then
  kubectl get secret ladesa-ro-sso-db-config --namespace=ladesa-ro-local;
fi

if [[ "${LADESA_DEPLOY_NS_DEVELOPMENT}" == "true" && "${LADESA_DEPLOY_NS_DEVELOPMENT_SERVICE_SSO}" == "true" ]]; then
  kubectl get secret ladesa-ro-sso-db-config --namespace=ladesa-ro-development;
fi

if [[ "${LADESA_DEPLOY_NS_PRODUCTION}" == "true" && "${LADESA_DEPLOY_NS_PRODUCTION_SERVICE_SSO}" == "true" ]]; then
  kubectl get secret ladesa-ro-sso-db-config --namespace=ladesa-ro-production;
fi