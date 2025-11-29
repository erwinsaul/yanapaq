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
- mix ps.get - Descarga dependencias de Elixir
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

### Ejecutar todos los tests
**1. Con Make**
```bash
make test
```
**2. Con Mix**
```bash
mix test
```
### Tests específicos

**Un archivo específico**
```bash
mix test test/yanapaq_web/controllers/page_controller_test.exs
```

**Una línea específica**
```bash
mix test test/yanapaq_web/controllers/page_controller_test.exs:12
```
**Tests que coincidan con un patroón**
```bash
mix test --only integration
```

## Comandos Disponibles

### Make Commands
```bash
make setup              # Configuración incial del proyecto
make dev                # Iniciar servidor de desarrollo
make test               # Ejecutar todos los tests
make test-watch         # Tests en modo watch
make test-unit          # Solos test unitarios
make coverage           # Tests con reporte de cobertura
make format             # Formatear el código
make lint               # Análisis estático del código
make clean              # Limpiar archivos compilados
```

### Mix Commands Útiles

```bash
# Servidor
mix phx.server           # Iniciar servidor
iex -S mix phx.server    # Servidor con consola interactiva

# Base de datos
mix ecto.create          # Crear BD
mix ecto.drop            # Eliminar BD
mix ecto.migrate         # Ejecutar migraciones
mix ecto.rollback        # Revertir última migración
mix ecto.reset           # Drop + Create + Migrate + Seed

# Generadores
mix phx.gen.context      # Generar contexto con schemas
mix phs.gen.live         # Generar LiveView CRUD
mix phx.gen.html         # Generador controlador HTML CRUD
mic phx.gen.json         # Generar controlador JSON API
mix ecto.gen.migration   # Crear migración

# Código
mix format               # Formatear el código
mix compile              # Compilar el proyecto
mix clean                # Limpiar compilados

# Dependencias
mix deps.get             # Descargar dependencias
mix deps.update --all    # Actualizar dependencias
mix deps.clean --all     # Limpiar dependencias

# Otros
mix phx.routes           # Ver todas las rutas
mix phx.gen.secret       # Generar SECRET_KEY_BASE
```

## Troubleshooting

### Error "Could not find SQLite3"
**Solución**: Instalar SQLite3

### Error: "Secret key base is not set"
**Solución**: Generar y configurar SECRET_KEY_BASE

```bash
mix phx.gen.secret
# Copiar el resultado a config/dev.exs o variable de entorno
```

### Error: "Catabase does not exist"

**Solución**:
mix ecto.create
mix ecto.migrate

### Error: "Port 4000 already in use"

**Solución 1**: Matar el proceso usando el puerto
```bash
lsof -ti:4000 | xargs kill -9
```

**Solución 2**: Cambiar el puerto
```bash
PORT=4001 mix phx.server
```

### Error: "Node modules not found" o problemas con assets

**Solución**:
```bash
cd assets
npm install
cd ..
mix assets.deploy
```
### Error: Mix dependencies no compilan
**Solución**:
```bash
mix deps.clean --all
mix deps.get
mix deps.compile
```
Limpiar todo y empesar de nuevo

```bash
mix ecto.reset         # Reset BD
mix deps.clean --all   # Limpiar deps
mis clean              # Limpiar compilados
rm -rf _build          # Eliminar build
mix deps.get           # Re-descargar deps
mix setup              # Setup completo
```

## Contribuir
### Workflow de desarrollo
1. **Crear una rama**
   ```bash
   git checkout -b feature/nombre-feature
   ```
  
2. Hacer Cambios
   - Escribe el código
   - Agrega tests
   - Asegúrate que pasen: make test
  
3. Formatear el código
  ```bash
  make format
  ```

4. Commit
  ```bash
  git add .
  git commit -m "Descripción clara del cambio"
  ```

5. Push y Pull
  ```bash
  git push origin feature/nombre-feature
  ```

## Contacto:
- **Autor**: Erwin Saul Serrudo Condori
- **Email**: erwinsaul.sc@gmail.com














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
