FROM quay.io/keycloak/keycloak:23.0 as builder
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=false
ENV KC_FEATURES=token-exchange,recovery-codes
ENV KC_DB=postgres
ENV KEYCLOAK_EXTRA_ARGS=-Dkeycloak.profile.feature.scripts=enabled -Dkeycloak.profile.feature.docker=enabled
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:21.1.2
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--spi-login-protocol-openid-connect-legacy-logout-redirect-uri=true", "--optimized", "--proxy=edge"]
