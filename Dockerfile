FROM saleor-dashboard as dashboard-builder
FROM saleor-storefront as storefront-builder

FROM nginx:stable
WORKDIR /app
COPY --from=dashboard-builder /app/ /app/dashboard/
COPY --from=storefront-builder /app/ /app/storefront/
