.PHONY: run test system log-demo permissions process docker-build docker-run compose-up compose-down verify

run:
	./app/student_app.sh

test:
	./tests/test_app.sh

system:
	./scripts/Zhaugash_Nurzhan_system.sh

log-demo:
	./scripts/log_demo.sh

permissions:
	./scripts/permissions_demo.sh

process:
	./scripts/process_demo.sh

docker-build:
	docker build -t zhaugash-nurzhan-devops .

docker-run:
	docker run --rm --name zhaugash-nurzhan-container --env-file .env zhaugash-nurzhan-devops

compose-up:
	docker compose up --build

compose-down:
	docker compose down

verify: test system log-demo permissions process
