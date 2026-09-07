# CloudShield

An enterprise cloud security monitoring and threat detection platform built with Java, providing access control evaluation, anomaly monitoring, and policy compliance auditing for distributed cloud environments.

[![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://openjdk.org/)
[![Maven](https://img.shields.io/badge/Build-Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)](https://maven.apache.org/)
[![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Servlet](https://img.shields.io/badge/Jakarta_Servlet-4.0-007396?style=for-the-badge&logo=java&logoColor=white)](https://jakarta.ee/)

---

## Project Overview

CloudShield is an enterprise-grade security monitoring web application designed to analyze access patterns, enforce cloud policy integrity, and prevent unauthorized resource exploitation across cloud computing infrastructures. Built upon Java 17 and enterprise Servlet architectures, it incorporates rigorous database transaction management and audit logging.

**Vision:** Safeguard multi-tenant cloud architectures by providing verifiable threat visibility, granular access control enforcement, and comprehensive compliance audit trails.

---

## Key Features

- **Cloud Security Policy Auditing:** Automated evaluation of user permissions, role hierarchies, and cloud asset access privileges.
- **Threat Detection Pipeline:** Detection of anomalous credential usage, unauthorized access spikes, and policy violations.
- **Relational Compliance Database:** Structured MySQL schemas with relational integrity constraints for security event telemetry.
- **Multi-Role Administrative Portal:** Segregated interfaces for Cloud Security Officers, System Auditors, and Infrastructure Administrators.
- **Automated Incident Logging:** Tamper-evident logging of all security-sensitive operations for regulatory audit trails.
- **Enterprise Servlet Architecture:** Modular MVC separation utilizing Java 17, Maven dependency resolution, and Jakarta Servlet specifications.

---

## Use Cases

### For Cloud Security Officers
- Continuously inspect access logs and identify privilege escalation attempts.
- Enforce least-privilege policies across distributed cloud resources.

### For Compliance & IT Auditors
- Export standardized audit reports demonstrating compliance with security baselines.
- Review historical user access records and configuration modifications.

### For Enterprise Infrastructure Teams
- Integrate security validation directly into enterprise Java hosting environments (Tomcat, WildFly).
- Maintain centralized control over internal service authentication credentials.

---

## System Architecture

```
+---------------------------------------------------------------+
|                    Web UI / Audit Console                     |
+---------------------------------------------------------------+
                                |
                                v
+---------------------------------------------------------------+
|              Servlet & Security Controller Layer              |
|  - Session Authentication        - Request Sanitization       |
|  - Role Permission Filter        - Audit Interceptor          |
+---------------------------------------------------------------+
                                |
                                v
+---------------------------------------------------------------+
|                Security Engine & Rule Evaluator               |
|  - Threat Anomaly Processor      - Policy Rule Matcher        |
+---------------------------------------------------------------+
                                |  JDBC Driver
                                v
+---------------------------------------------------------------+
|                 MySQL Enterprise Database Store               |
|  - Security Audit Logs           - Threat Signatures          |
|  - User Credentials & Roles      - Access Policies            |
+---------------------------------------------------------------+
```

---

## Technology Stack

| Layer | Technologies |
|---|---|
| Language & Runtime | Java SE 17 (LTS) |
| Dependency Management | Apache Maven 3.x |
| Web Architecture | Jakarta / Java Servlet API 4.0.1, JSP |
| Persistence & Database | MySQL 5.x / 8.x, MySQL Connector/J |
| Testing | JUnit |
| Deployment Format | Web Application Archive (WAR) |

---

## Project Structure

```
CloudShield/
├── CODE/
│   └── VTJCC14_2025/     # Core Maven web application
│       ├── src/          # Java source files, servlets, beans, and controllers
│       ├── pom.xml       # Maven dependencies and build plugins
│       ├── .classpath    # Eclipse IDE classpath configuration
│       └── .project      # Eclipse project metadata
├── DATABASE/             # Database initialization schemas and seed SQL
│   └── *.sql             # Table creation and reference data scripts
└── README.md
```

---

## Getting Started

### Prerequisites
- Java Development Kit (JDK) 17 or higher
- Apache Maven 3.8+
- MySQL Server 8.0 or 5.7
- Apache Tomcat 9.x or 10.x servlet container

### Database Setup

1. Start your local MySQL service:
   ```bash
   mysql -u root -p
   ```

2. Execute the database initialization script located in the `DATABASE/` folder:
   ```sql
   SOURCE C:/Users/.../DATABASE/cloudshield_schema.sql;
   ```

### Application Build & Deployment

1. Navigate to the project root:
   ```bash
   cd CODE/VTJCC14_2025
   ```

2. Compile and package the project:
   ```bash
   mvn clean package
   ```

3. Deploy the generated `target/VTJCC14_2025.war` file to your Tomcat `webapps/` directory.

4. Access the security console at:
   ```
   http://localhost:8080/VTJCC14_2025
   ```

---

## Future Roadmap

- Integration with AWS CloudTrail and Azure Monitor APIs for automated ingestion.
- Machine-learning powered anomaly detection model using Java Deep Learning libraries.
- Automated Slack and email alert webhooks for critical intrusion attempts.
- Migration to Spring Boot 3 microservices architecture.

---

## License

All rights reserved. Internal enterprise project under academic and research licensing.
