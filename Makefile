.PHONY: docs clean

rundev:
	docker-compose up -d --build

runbuild:
	docker-compose -f docker-compose.prod.yml up -d --build

run:
	docker-compose -f docker-compose.prod.yml up -d

down:
	docker-compose down

downvol:
	docker-compose down -v

dockerps:
	docker-compose ps

dockerlogs:
	docker-compose logs

############# Django manage.py commands ###################
shell:
	docker-compose -f docker-compose.prod.yml exec web python manage.py shell

csu:  # django create super user
	docker-compose -f docker-compose.prod.yml exec web python manage.py createsuperuser  --username=admin

migrate:
	docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput

mk:  # short for MakeMigrations
	docker-compose -f docker-compose.prod.yml exec web python manage.py makemigrations

collectstatic:
	docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear

dockerclean:
	docker system prune -f
	docker system prune -f --volumes
