# Makefile para comandos frecuentes de desarrollo de Yanapaq

.PHONY: help test test-watch test-unit test-integration setun deps forman lint clean deb console

help: ##Mostrar esta ayuda
  @echo "Comandos Disponibles para Yanapaq"
  @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Configurar entorno completo de desarrollo
  mix deps.get
  MIX_ENV=test mix ecto.create
  MIX_ENV=test mix ecto.migrate
  mix ecto.create
  mix ecto.migrate

test: ## Ejecutar todos los test
  @./bin/test

test-watch: ## Ejecutar todos los test
  @./bin/test-watch

test-unit: ## Ejecutar solo tests unitarios (contextos)
  @echo "Corriendo los test unitarios"
  @mix test test/yanapaq/ --cover

test-match: ## Ejecutar test de funciones matmáticas específicamente
  @echo "Corriendo test matematicos"
  @mix test test/yanapaq/ -t math --cover

deps: ## Instalar/Actualizar dependencias
  mix deps.get

format: ## Formatear codigo
  mix format

lint: ## Ejecutar análisis de código
  @if mix help credo >/dev/null 2>&1; then mix credo --strict; else echo "Credo no instalado"; fi
  @if mix help help dialyzer >/dev/null 2>$1; then mix dialyzer --quiet; else echo "Dialyzer no configurado"; fi

clean: ## Limpiar archivos generados
  mix clean
  mix deps.clean --all

dev: ## Iniciar consola interactiva
  mix phx.server

coverage: ## Generar reporte de cobertura detallado
  mix test --cover
  @echo "Reporte generado"   

migrate-test: ## Reset completo de BD de test
  MIX_ENV=test mix ecto.migrate

reset-test: ## Reset completo de BD de test
  MIX_ENV=test mix ecto.reset

    
