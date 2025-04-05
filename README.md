# Security Monitoring Project

A comprehensive solution for monitoring AWS environments for security events using ELK stack (Elasticsearch, Logstash, Kibana) and following security best practices.

## Features

- CloudTrail log collection and analysis
- Real-time security monitoring
- Custom detection rules for common security threats
- GitHub security integration
- Pre-commit hooks for security checks

## Architecture

The system consists of:

1. AWS CloudTrail for comprehensive logging
2. ELK stack for log analysis:
   - Elasticsearch for data storage
   - Logstash for log processing
   - Kibana for visualization
3. Custom detection rules for security threats
4. GitHub security scanning

## Setup Instructions

### Prerequisites

- AWS account with CloudTrail enabled
- Docker and Docker Compose
- Git