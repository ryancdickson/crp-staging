help: ## List tasks with documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' "$(firstword $(MAKEFILE_LIST))" | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build the site to output_html
	pipenv run python src/generate.py

serve: ## serve content in output_html at localhost:8000
	cd output_html && pipenv run python -m http.server 8000

clean: ## wipe output_html/
	rm -rf output_html/
