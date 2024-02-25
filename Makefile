build:
	docker-compose up --build -d
up:
	docker-compose up -d
run:
	docker-compose exec smlsharp /bin/bash
down:
	docker-compose down

