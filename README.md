# Production ready Django template

## Keywords:
- Django
- Docker
- Celery
- Postgres
- Traefik (free SSL)

_Inspiration drawn from this [post](https://testdriven.io/blog/django-docker-traefik/)._

### Development
Rename the .env.template file to .env and add some config/env files in it

Build the images and spin up the containers:

```sh
$ docker-compose up -d --build
```

Test it out locally:

[http://django.localhost:8008/](http://django.localhost:8008/)

### Make a Production ready service
1. Buy a domain (Namecheap). Set up Custom DNS records (use Linode ns1, ns2...)
2. Spin up a Linode. Add the domain name in Domains on Linode. Add "A" record with "www" and "mydomain.com". Wait for propagation.
3. Update the domain in *docker-compose.prod.yml*, and add your email to *traefik.prod.toml*.
4. Secure your linode server (allow only SSH key login)
5. Pull the github repository you want to publish.

Build the images and run the containers:

```sh
$ docker-compose -f docker-compose.prod.yml up -d --build
```

Or use `make run` from Makefile for shortcuts.

### Notes:
The first time you run docker services, it might complain about acme.json. Chmod it to 600.