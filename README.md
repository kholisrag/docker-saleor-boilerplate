# Docker-Compose for Saleor Frontend ([storefront](https://github.com/mirumee/saleor-storefront) & [dashboard](https://github.com/mirumee/saleor-dashboard)) with [letsencrypt + dns challenges](https://github.com/adferrand/docker-letsencrypt-dns)

Docker-Compose for running [saleor](https://github.com/mirumee/saleor), [storefront](https://github.com/mirumee/saleor-storefront) & [dashboard](https://github.com/mirumee/saleor-dashboard) with [letsencrypt + dns challenges](https://github.com/adferrand/docker-letsencrypt-dns)

How to run:

```bash
mkdir -pv /app
cd /app

# Clone this repo
git clone https://github.com/petrukngantuk/docker-saleor-boilerplate
cd docker-saleor-boilerplate

# Clone saleor
git clone https://github.com/mirumee/saleor
cp -rfv config/saleor/* saleor/.
# Edit yourown.env &  change all to your desired requirement
vi saleor/yourown.env
cd saleor/
# Running saleor with docker-compose
docker-compose build
docker-compose run --rm web python3 manage.py migrate
docker-compose run --rm web python3 manage.py collectstatic --no-input
# Create superuser and fill to your desired superuser email and password
docker-compose run --rm web python3 manage.py createsuperuser
docker-compose up -d
# Check container running or error
docker-compose ps
cd ..

# Clone saleor-dashboard
git clone https://github.com/mirumee/saleor-dashboard.git
cp -rfv config/saleor-dashboard/* saleor-dashboard/.

# Clone saleor-storefront
git clone https://github.com/mirumee/saleor-storefront.git
cp -rfv config/saleor-storefront/* saleor-storefront/.

# Change common.env to your desired value, especially :
# NGINX_SERVER_NAME
# NGINX_SERVER_NAME_ALIAS
# EMAIL
# PROVIDER_OPTIONS
vi common.env

# Change config/letsencrypt/domains.conf
# don't use '#' there, it will cause much error
# Just use :
# *.yourdomain.com yourdomain.com
# cover root domain and many subdomain
vi config/letsencrypt/domains.conf

# Copy Dockerfile and related file/folder
# if your saleor-dashboard & saleor-storefront
cp config/saleor-dashboard/* saleor-dashboard/.
cp config/saleor-storefront/* saleor-storefront/.

docker-compose up -d --build
```

Feel free to open issue and PR