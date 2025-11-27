# Yanapaq
Yanapaq es una plataforma web con herramientas utiles para matemáticas y otras areas exactas.
## Tabla de Contenidos
- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Desarrollo](#desarrollo)
- [Testing](#testing)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Comandos Disponibles](#comandos-disponibles)
- [Troubleshooting](#troubleshooting)
- [Contribuir](#contribuir)

## Requisitos Previos
Necesitas tener instalado:
- **Elixir**: 1.14 o superior
- **Erlang/OTP**: 25 o superior
- **SQLite3**: 3.x
- **Node.js**: 18.x o superior (para assets)

### Verificar versiones instaladas
```bash
elixir --version
erl -version
sqlite3 --version
node --version
```
## Instalación
### 1. Clonar el repositorio
```bash
git clone https://github.com/erwinsaul/yanapaq.git

cd yanapaq
```
### 2. Instalar dependencias
```bash
mix setup
```
Este comando hace:
- m➡️ ps.get - Descarga dependencias de Elixir
- mix deps.compile - Compila dependencias
- mix ecto.create - Crea la base de datos
- mix run priv/repo/seeds.exs - carga datos iniciales
- mix assets.setup - Instal dependencias de assets (npm)

### 3. Crear la base de datos
mix ecto.setup

o manualmente
mix ecto.create
mix ecto.migrate

## Configuración

Crea un archivo ˋ.envˋ en la raíz del proyecto, con el siguiente contenido

```bash
# Base de datos
DATABASE_PATH=priv/repo/yanapaq_dev.db

# Phoenix
SECRET_KEY_BASE=tu_secret_key_aqui_genero_con_mix_gen_secret
PHX_HOST=localhost
PORT=4000
```
Generar SECRET_KEY_BASE
```bash
mix phx.gen.secret
```
copia el resultado a tu archivo .env

La configuración está en:
- config/dev.exs - Desarrollo
- config/test.exs - Testing
- config/prod.exs - Producción

SQLite3 guarda los archivos en:
- Desarrollo: priv/repo/yanapaq_dev.db
- Test: priv/repo/yanapaq_test.db

## Desarrollo
### Iniciar el servidor

**Opción 1: Con Make**
```bash
make dev
```

**Opción 2: Con Mix**
```bash
mix phx.server
```

**Opción 3: Con IEx (consola interactiva)**
```bash
iex -S mix phx.server
```

El servidor estará disponible en: http://localhost:4000

Hot Reload

Phoenix recarga automáticamente cuando cambias:
- Archivo .ex y exs
- Template .heex
- CSS en assets/css/
- JS en assets/js/

Consola Interactiva (IEx)

```bash
iex -S mix
```

Útil para probar código:

alias Yanapaq.Repo

Phoenix LiveDashboard

En desarrollo, accede a: http://localhost:4000/dev/dashboard

Aquí puedes ver:
- Métricas del sistema
- Procesos activos
- Queries de base de datos
- Logs en tiempo real

## Testing




To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
