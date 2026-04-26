PORT ?= 8000

render-start:
    gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

install:
	uv sync

build:
	./build.sh

dev:
	uv run flask --debug --app page_analyzer:app run

lint:
	uv run ruff check page_analyzer/

lint-fix:
	uv run ruff check --fix page_analyzer/

format:
	uv run ruff format page_analyzer/

pre-commit: lint-fix format

start:
	uv run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

