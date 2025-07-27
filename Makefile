run:
	go run cmd/server/main.go

test:
	go test ./...

lint:
	golangci-lint run

migrate-up:
	migrate -path ./migrations -database "$(DB_URL)" up

migrate-down:
	migrate -path ./migrations -database "$(DB_URL)" down

seed:
	go run seed/seed.go

docker-build:
	docker build -t industry-api .

.PHONY: run test lint migrate-up migrate-down seed docker-build
