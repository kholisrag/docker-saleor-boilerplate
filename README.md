# Docker-Compose for Saleor Frontend ([storefront](https://github.com/mirumee/saleor-storefront) & [dashboard](https://github.com/mirumee/saleor-dashboard)) with [letsencrypt + dns challenges](https://github.com/adferrand/docker-letsencrypt-dns)

Docker-Compose for running [saleor](https://github.com/mirumee/saleor), [storefront](https://github.com/mirumee/saleor-storefront) & [dashboard](https://github.com/mirumee/saleor-dashboard)

How to run:
-edit necessary environment in `common.env`

```bash
git clone https://github.com/petrukngantuk/docker-saleor-store
cd docker-saleor-store
git clone https://github.com/petrukngantuk/saleor-dashboard.git
cd saleor-dashboard
docker build -t saleor-dashboard .
cd ..
git clone https://github.com/petrukngantuk/saleor-storefront.git
cd saleor-storefront
docker build -t saleor-storefront .
cd ..
docker-compose -p store up -d build
```
