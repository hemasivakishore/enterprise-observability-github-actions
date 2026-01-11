# Enterprise Observability Platform (CI/CD Driven)

## Overview
This repository implements a **production-grade observability platform** designed to collect, process, and visualize logs and metrics from **400+ Linux & Windows servers**, simulating a large on-premise enterprise environment.

The entire lifecycle — infrastructure provisioning, agent deployment, configuration updates, and observability rollout — is **fully automated using CI/CD principles** with GitHub Actions and Ansible.

This project demonstrates **platform engineering**, not tool-level monitoring.

---

## Architecture Summary

**Ingress Layer**
- Elastic Beats (Metricbeat, Filebeat, Heartbeat)
- Installed via Ansible across 400+ nodes

**Buffering Layer**
- Apache Kafka + Zookeeper (6-node cluster)
- Handles burst traffic and prevents data loss

**Processing Layer**
- Logstash (2 nodes)
- Structured parsing and enrichment

**Storage & Visualization**
- Elasticsearch + Kibana
- Deployed on Kubernetes (EKS)

**Automation & Orchestration**
- GitHub Actions (serverless CI/CD)
- Self-hosted runners inside private VPC
- Secrets managed via GitHub Secrets

---

## CI/CD Flow

1. **Terraform** provisions infrastructure (EC2, networking).
2. **GitHub Actions** triggers pipelines on:
   - Push
   - Manual dispatch
3. Pipelines invoke **Ansible** to:
   - Deploy Kafka & Zookeeper
   - Roll out Elastic Beats (rolling updates)
4. Log data flows through Kafka → Logstash → Elasticsearch.
5. **Kibana dashboards** provide real-time visibility.

All configurations are treated as **code**.

---

## Scale & Capacity

| Component | Count |
|---------|------|
| Monitored Servers | 400+ |
| Ansible Controllers | 2 |
| Kafka + Zookeeper | 6 |
| Logstash | 2 |
| Beats Distribution Nodes | 5 |
| Kubernetes Cluster | EKS |
| GitHub Runners | Self-hosted |

---

## Repository Structure

```text
.
├── terraform/
│   ├── vpc/
│   ├── ec2/
│   └── outputs.tf
│
├── ansible/
│   ├── inventory/
│   ├── roles/
│   │   ├── kafka/
│   │   ├── zookeeper/
│   │   ├── elastic-beats/
│   │   └── logstash/
│   └── playbooks/
│
├── kubernetes/
│   ├── elasticsearch/
│   └── kibana/
│
├── github-actions/
│   ├── beats-deploy.yml
│   ├── kafka-setup.yml
│   └── validation.yml
│
├── dashboards/
│   └── kibana-exports/
│
└── docs/
    ├── architecture.md
    ├── ci-cd-flow.md
    └── runbooks.md
```
Key Design Decisions
	•	Kafka as buffer to absorb log spikes from large fleets
	•	GitHub Actions over Jenkins to eliminate master maintenance
	•	Ansible parallelism for fast fleet-wide rollouts
	•	Kubernetes for scalable ELK deployment
	•	Immutable configuration via GitOps principles

Security & Compliance
	•	No direct SSH access from CI
	•	Private VPC-only communication
	•	Secrets stored in GitHub Secrets
	•	Role-based Ansible execution
	•	Auditable CI/CD logs

Team Model (Enterprise Simulation)
	•	DevOps Team: CI/CD pipelines, orchestration
	•	Ansible Team: Configuration & rollout logic
	•	Linux Team: Change approvals & validation

No application developers involved.

Why This Project Matters
	•	Demonstrates real enterprise scale
	•	Shows platform thinking, not just tooling
	•	CI/CD applied to observability
	•	Mirrors real-world SRE & Platform Engineering setups

Future Enhancements
	•	Prometheus + Alertmanager integration
	•	OpenTelemetry support
	•	Multi-region Kafka replication
	•	SLO-based alerting
	•	Cost-optimized cold storage tier

Author
V Hema Siva Kishore
Cloud • DevOps • Platform Engineering
