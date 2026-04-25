# 🔄 Replicación de Base de Datos con SymmetricDS y Docker

Práctica de replicación de datos entre múltiples nodos usando **SymmetricDS**, **PostgreSQL**, **MySQL** y **Docker**. Simula un sistema de sucursales para una cadena **Blockbuster** con nodos en Quito, Guayaquil y Manta.

---

## 🏗️ Arquitectura

```
┌─────────────────────┐
│  PostgreSQL - Quito │  ← Nodo principal (puerto 5438)
│    blockbuster_db   │
└──────────┬──────────┘
           │
     [SymmetricDS]
      /           \
┌────────────┐  ┌───────────┐
│MySQL-Guaya │  │MySQL-Manta│
│  puerto    │  │  puerto   │
│   3307     │  │   3308    │
└────────────┘  └───────────┘
```

- **Nodo Quito:** PostgreSQL 15 — Base de datos principal
- **Nodo Guayaquil:** MySQL 8 — Sucursal Guayaquil
- **Nodo Manta:** MySQL 8 — Sucursal Manta
- **SymmetricDS:** Motor de replicación entre todos los nodos

> 💡 Lo destacable de esta práctica es la replicación **entre diferentes motores de base de datos** (PostgreSQL ↔ MySQL), algo que se usa en sistemas empresariales reales.

---

## 🛠️ Tecnologías

- **SymmetricDS** — Motor de replicación de datos
- **PostgreSQL 15** — Base de datos relacional (nodo Quito)
- **MySQL 8** — Base de datos relacional (nodos Guayaquil y Manta)
- **Docker & Docker Compose** — Orquestación de contenedores

---

## 📁 Estructura del Proyecto

```
PRACTICASymmetricd/
├── postgres/
│   └── init.sql              # Inicialización BD Quito
├── mysql-guayaquil/
│   └── init.sql              # Inicialización BD Guayaquil
├── mysql-manta/
│   └── init.sql              # Inicialización BD Manta
├── symmetricds/
│   ├── quito.properties/     # Configuración nodo Quito
│   ├── guayaquil.properties/ # Configuración nodo Guayaquil
│   └── manta.properties/     # Configuración nodo Manta
└── docker-compose.yml        # Orquestación de servicios
```

---

## 🚀 Cómo ejecutarlo

### Prerequisitos
- Docker Desktop instalado
- Docker Compose disponible

### Levantar todos los servicios

```bash
docker-compose up -d
```

### Verificar que los contenedores están corriendo

```bash
docker ps
```

Deberías ver 4 contenedores activos:
- `postgres-quito`
- `mysql-guayaquil`
- `mysql-manta`
- `symmetricds`

### Conectarse a los nodos

```bash
# Nodo Quito (PostgreSQL)
psql -h localhost -p 5438 -U blockbuster -d blockbuster_db

# Nodo Guayaquil (MySQL)
mysql -h localhost -P 3307 -u root -p

# Nodo Manta (MySQL)
mysql -h localhost -P 3308 -u root -p
```

### Detener los servicios

```bash
docker-compose down
```

---

## ⚙️ Configuración de Nodos

| Nodo | Motor | Puerto | Base de Datos |
|------|-------|--------|---------------|
| Quito | PostgreSQL 15 | 5438 | blockbuster_db |
| Guayaquil | MySQL 8 | 3307 | blockbuster_guayaquil |
| Manta | MySQL 8 | 3308 | blockbuster_manta |
| SymmetricDS | — | 31415 | — |

---

## 📚 Conceptos aplicados

- **Replicación bidireccional** entre nodos
- **Replicación heterogénea** (PostgreSQL ↔ MySQL)
- **Configuración por nodo** con archivos `.properties`
- **Orquestación de servicios** con Docker Compose
- **Sincronización automática** de datos entre sucursales

---

## 📝 Notas

- Las credenciales en este repositorio son de uso local/educativo únicamente
- En un entorno de producción se deben usar variables de entorno con `.env`
- SymmetricDS corre en el puerto `31415` y gestiona toda la comunicación entre nodos

---

**Autor:** Reyes Vinces Jeremy Daniel  
**Contexto:** Práctica universitaria — Replicación de bases de datos
