FROM quay.io/keycloak/keycloak:25.0 as builder
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=false
ENV KC_FEATURES=docker,token-exchange,recovery-codes
ENV KC_DB=postgres
ENV KEYCLOAK_EXTRA_ARGS=-Dkeycloak.profile.feature.scripts=enabled
RUN /opt/keycloak/bin/kc.sh build --health-enabled=true

FROM quay.io/keycloak/keycloak:25.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/
# COPY ./devops/development/data/import /opt/keycloak/data/import/
WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--spi-login-protocol-openid-connect-legacy-logout-redirect-uri=true", "--optimized", "--proxy=edge"]
