# Talend Platform Ansible

This repository contains [Ansible](https://www.ansible.com/) roles and playbooks to deploy, manage, and configure the [Talend](https://www.talend.com) Platform services.

> **Note**: These playbooks are provided without support and are intended to be a guideline. Any issue encountered can be reported via GitHub and will be addressed on a best effort basis. Pull requests are also encouraged.

Specifically, this repository, through its playblooks:

* Installs Talend RPM packages.
* Starts services using systemd scripts.
* Provides configuration options for Talend packages.

You can find detailed documentation about each RPM package delivered by Talend and their related services in [Talend Help Center](https://help.talend.com/search/all?query=rpm&content-lang=en-US).

# Prerequisites

To be able to install applications using Ansible, you need to setup your environment as follows:

1. Install Extra Packages for Enterprise Linux: <br/> `sudo yum install epel-release`
2. Install [Ansible](https://www.ansible.com/) on the master host used for the deployment: <br/> `sudo yum install ansible`
3. All hosts need to be reachable via SSH from the master node. Hosts must be defined in `/etc/ansible/hosts` on the master node.

Installing Talend applications using Ansible require CentOS 7.X as operating system.

# Installing applications using Ansible

1. Specify your credentials and the version of Talend applications to install in the *ansible/group_vars/all* file. These parameters are used to access the RPM repository.
2. Configure the playbook you want to install by specifying:
  1. the **hosts** to install the roles on. Hosts must be defined in `/etc/ansible/hosts` on the master node.
  2. the **remote_user** name. Make sure that the user has the required permissions to install applications on all hosts.
  3. the **roles** to install, by installation order.
  4. the **vars** to overwrite with a new value for that specific playbook. Adding variables to the playbook is optional. <br/>
  For example:
```yml
  hosts: tac-group
  remote_user: root
  roles:
    - java
    - talend-repo
    - runtime
  vars:
    rt_http_port: 8041
    rt_https_port: 9002
    rt_ssh_port: 8102
    rt_rmi_registry_port: 1100
    rt_rmi_server_port: 44445
    rt_js_command_server_port: 8010
    rt_js_file_server_port: 8011
    rt_js_monitoring_port: 8898
    rt_js_process_message_port: 8556
    rt_master_password: 'password'
```
Sample playbooks are available [here](ansible/examples) or [here](ansible).
3. Configure the installation parameters as well as the configuration of each role using their respective *defaults/main.yml* file. <br/> Variables can be overwritten if they are set differently directly in the playbook.
4. Run the playbook: <br/> `ansible-playbook <playbook>.yml`

> **Important**: Always include **java** and then **talend-repo** roles in as first roles in playbooks. If Tomcat is needed for the set of roles that are installed, also include the **tomcat** role between **talend-repo** and the following roles.

# Uninstalling applications

You can remove installed applications using `sudo yum remove <list_of_packages>` manually on every host.

The list of packages can be received by executing the command `rpm -qa | grep talend`.

# List of applications

The applications which can be installed from this repository are the following. They all possess a dedicated Ansible role:

* **[tac](ansible/roles/tac)**: Talend Administration Center (TAC)
* **[iam](ansible/roles/iam)**: Talend Identity and Access Management (IAM) service
* **[mdm](ansible/roles/mdm)**: Talend Master Data Management (MDM)
* **[mwfl](ansible/roles/mwfl)**: Talend MDM Workflow Server (MWFL)
* **[amc](ansible/roles/amc)**: Talend Activity Monitoring Console (AMC)
* **[logserver](ansible/roles/logserver)**: Talend Logging Server
* **[jobserver](ansible/roles/jobserver)**: Talend Job Server
* **[repo-mgr](ansible/roles/repo-mgr)**: Talend Repository Manager
* **[runtime](ansible/roles/runtime)**: Talend Runtime server
* **[esb](ansible/roles/esb)**: Talend ESB
* **[tdp](ansible/roles/tdp)**: Talend Data Preparation. TDP requires **sjs** (Spark Job Server), **tcomp** (Talend Component Server) and **streamsrunner** (Streams Runner)
* **[sjs](ansible/roles/sjs)**: Spark Job Server
* **[tcomp](ansible/roles/tcomp)**: Talend Component Server
* **[streamsrunner](ansible/roles/streamsrunner)**: Streams Runner
* **[tds](ansible/roles/tds)**: Talend Data Stewardship (TDS)
* **[tdq](ansible/roles/tdq)**: Talend Dictionary Service
* **[sap-rfc-server](ansible/roles/sap-rfc-server)**: Talend SAP RFC Server
* **[filebeat](ansible/roles/filebeat)**: Talend Filebeat service

Also the following third-party components can be installed:

* **[tomcat](ansible/roles/tomcat)**: Apache Tomcat server (required by **tac**, **iam**, **tds**, **tdq**)
* **[mongodb](ansible/roles/mongodb)**: MongoDB server (required by **tds**, **tdp**, **tdq**)
* **[kafka](ansible/roles/kafka)**: Apache Kafka server (required by **tds**, **tdp**)
* **[nexus](ansible/roles/nexus)**: Nexus Repository Manager.
