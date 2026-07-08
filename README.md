# DevOps Assessment

## Technologies

- Terraform
- AWS
- Docker Compose
- PostgreSQL
- GitHub Actions

## Project Structure

- Terraform Infrastructure
- PostgreSQL Database
- Backup & Restore

---

## Overview

This project demonstrates Infrastructure as Code (Terraform) and Database Reliability practices.

The solution includes:

- Terraform infrastructure for AWS
- Dev and Prod environments
- Docker Compose for PostgreSQL
- Database migrations
- Seed data
- Backup & Restore scripts

## Project Structure

```text
devops-assessment/
│
├── infra/
│   ├── modules/
│   │   ├── network/
│   │   ├── security_groups/
│   │   ├── alb/
│   │   ├── ecs/
│   │   └── rds/
│   │
│   └── envs/
│       ├── dev/
│       └── prod/
│
├── database/
│   └── migrations/
│
├── scripts/
│   ├── backup.sh
│   └── restore.sh
│
├── docker-compose.yml
└── README.md
```

## Terraform

Reusable Terraform modules:

- Network
- Security Groups
- Application Load Balancer (ALB)
- ECS/Fargate
- RDS PostgreSQL

Separate environments:

- dev
- prod

Each environment has:

- variables
- terraform.tfvars
- backend configuration
- resource sizing
- backup retention
- deletion protection

## Terraform Commands

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -refresh=false
```

## Run PostgreSQL

```bash
docker compose up -d
```

Verify:

```bash
docker ps
```

## Database

Tables:

- hotel_bookings
- booking_events

Migration Files:

- 001_create_tables.sql
- 002_create_indexes.sql
- 003_seed_data.sql

## Query Optimization

The following indexes were created to optimize the required query:

- idx_hotel_bookings_city_created_at
- idx_hotel_bookings_org_status
- idx_booking_events_booking_id

These indexes improve filtering, grouping, and join performance.

## Backup

Run:

```bash
./scripts/backup.sh
```

This creates a timestamped SQL backup.

## Restore

Run:

```bash
./scripts/restore.sh
```

This restores the latest database backup.

## Verification

Terraform:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -refresh=false
```

Database:

```bash
docker compose up -d
```

Execute:

- Migration scripts
- Seed data script
- backup.sh
- restore.sh
