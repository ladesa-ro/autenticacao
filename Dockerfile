# ================================================================== #
# Builder of theme jars                                              #
# ================================================================== #
FROM node:22 AS keycloakify_jar_builder

RUN apt-get update && \
  apt-get install -y openjdk-17-jdk && \
  apt-get install -y maven;

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /opt/app

COPY ./themes/web/package.json ./themes/web/pnpm-lock.yaml ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
COPY ./themes/web/ ./

RUN pnpm build-keycloak-theme

# ================================================================== #
# Builder of keycloak with essential features                        #
# ================================================================== #
FROM quay.io/keycloak/keycloak:25.0 AS builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=false
ENV KC_FEATURES=docker,token-exchange,recovery-codes
ENV KC_DB=postgres
ENV KEYCLOAK_EXTRA_ARGS=-Dkeycloak.profile.feature.scripts=enabled

WORKDIR /opt/keycloak

COPY --from=keycloakify_jar_builder /opt/app/dist_keycloak/keycloak-theme-f or-kc-22-and-above.jar /opt/keycloak/providers/

RUN /opt/keycloak/bin/kc.sh build --health-enabled=true

# ================================================================== #
# Runtime keycloak with theme and essential features                 #
# ================================================================== #
FROM quay.io/keycloak/keycloak:25.0

WORKDIR /opt/keycloak
COPY --from=builder /opt/keycloak/ /opt/keycloak/
# COPY ./devops/development/data/import /opt/keycloak/data/import/

ENTRYPOINT [ \
  "/opt/keycloak/bin/kc.sh", \
  "start", \
  "--spi-login-protocol-openid-connect-legacy-logout-redirect-uri=true", \
  "--optimized", \
  "--proxy=edge" \
  ]
