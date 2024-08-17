FROM node:22 AS keycloakify_jar_builder

RUN apt-get update && \
  apt-get install -y openjdk-17-jdk && \
  apt-get install -y maven;

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

COPY ./themes/web/package.json ./themes/web/pnpm-lock.yaml /opt/app/
WORKDIR /opt/app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
COPY ./themes/web/ /opt/app/

RUN pnpm build-keycloak-theme

FROM quay.io/keycloak/keycloak:25.0 AS builder
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=false
ENV KC_FEATURES=docker,token-exchange,recovery-codes
ENV KC_DB=postgres
ENV KEYCLOAK_EXTRA_ARGS=-Dkeycloak.profile.feature.scripts=enabled
WORKDIR /opt/keycloak
COPY --from=keycloakify_jar_builder /opt/app/dist_keycloak/keycloak-theme-for-kc-22-and-above.jar /opt/keycloak/providers/
RUN /opt/keycloak/bin/kc.sh build --health-enabled=true

FROM quay.io/keycloak/keycloak:25.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/
# COPY ./devops/development/data/import /opt/keycloak/data/import/
WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--spi-login-protocol-openid-connect-legacy-logout-redirect-uri=true", "--optimized", "--proxy=edge"]
