# ansible-talend-platform

Please note that these playbooks are provided without support and are intended to be a guideline. Any issues encountered can be reported via the GitHub issues and will be addressed on a best effort basis. Pull requests are also encouraged.

# Introduction

Ansible provides a simple way to deploy, manage, and configure the Talend Platform services. This repository provides playbooks and templates to easily spin up a Talend Platform installation. Specifically this repository:

* Installs Talend RPM packages
* Starts services using systemd scripts
* Provides configuration options for Talend packages

The applications which can be installed from this repository are:

* Talend Administration Center (TAC)
* Talend Identity and Access management (IAM) service
* Talend Master Data Management (MDM)
* Talend Logging Server
* Talend Job Server
* Talend Repository Manager
* Talend Runtime server
* Talend ESB
* Talend Data Preparation (TDP, includes Spark Job Server, Talend Component and Streams Runner)
* Talend Data Stewardship (TDS)
* Talend Dictionary Service (TDQ)
* Talend SAP RFC Server
* Talend Filebeat server

Also the following third-party components can be installed:

* Apache Tomcat server (required by TAC, IAM, MDM, TDS, Dictionary Service)
* MongoDB server (required by TDS, TDP, TDQ)
* Apache Kafka server (required by TDS, TDP)

# Documentation
