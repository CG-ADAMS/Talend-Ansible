Talend Administrator Center (TAC)
=========

This role will install Talend Administrator Center (TAC).

Requirements
------------

To run the script you need to install the following packages:
- Extra Packages for Enterprise Linux
  ```
  su yum install epel-release
  ```  
- Ansible
  ```
  su yum install ansible
  ```
  
Role Variables
--------------

Before running the script, if necessary, you can change the following variables that are in defaults/main.yml:
- Tomcat

  To use talend-tomcat in shared mode, use `app_use_talend_tomcat` parameter, for which allowed values are "yes" or "no". If the value is "yes", then you need to specify Tomcat port. For example:
  ```
  app_use_talend_tomcat: 'yes'
  app_tomcat_port: 8080 
  ```
  To use customer's Tomcat, use `app_use_talend_tomcat: 'no'`. In this case, you will need to specify following parameters:
  ```
  app_tomcat_port: 8080
  app_tomcat_home: '/opt/tomcat'
  app_tomcat_mode: 'direct'
  app_tomcat_setup: 'yes'
  ```
- Systemd

  If you want to install as systemd service, use `app_install_systemd` parameter, for which allowed values are "yes" or "no". For example:
  ```
  app_install_systemd: 'yes'
  ```
- Web-application name

  To specify web-application name, use `tac_webapp_name` parameter. For example:
  ```
  tac_webapp_name: 'org.talend.administrator'
  ```
- Admin username/password

  To specify admin username and password, use `tac_admin_user` and `tac_admin_pass` parameters. For example:
  ```
  tac_admin_user: 'security@company.com'
  tac_admin_pass: 'admin'
  ```
- SSO

  To use SSO, use `tac_use_sso` parameter, for which allowed values are "yes" or "no". For example
  ```
  tac_use_sso: 'no'
  ```
- LogServer

  To use LogServer, use `tac_use_logserver` parameter, for which allowed values are "yes" or "no". If the value is "yes", then you need to specify LogServer host and port. For example:
  ```
  tac_use_logserver: 'yes'
  tac_logserver_host: 'localhost'
  tac_logserver_port: 5044
  ```
- Database

  To select a database, use `tac_database` parameter, which takes one of the values ("h2", "mysql", "oracle", "mssql", "postgresql", "mariadb") and also specify database name, host, port, username and password. For example:
  ```
  tac_database: "mysql"
  tac_db_host: 'localhost'
  tac_db_port: 3306
  tac_db_name: 'talend_administrator'
  tac_db_user: 'talend'
  tac_db_password: 'talend'
  ```  
  If you want to use h2 database, remaining parameters are optional.
- JobServer

  To configure JobServer settings, use `tac_setup_jobserver` parameter, for which allowed values are "yes" or "no". If the value is "yes", then you need to specify JobServer name, host, command port, file transfer port, monitoring port and also username and password if specified. For example:
  ```
  tac_setup_jobserver: 'yes'                      
  tac_jobserver_name: 'jobserver'
  tac_jobserver_host: 'localhost'
  tac_jobserver_command_port: 8000
  tac_jobserver_file_transfer_port: 8001
  tac_jobserver_monitoring_port: 8888
  tac_jobserver_username: 'talend'                
  tac_jobserver_password: 'talend'
  ```  
- Socket appender

  When configuring Socket appender, the required parameters are `tac_appender_socket_host` and `tac_appender_socket_port`. For example:
  ```
  tac_appender_socket_host: 'localhost'
  tac_appender_socket_port: 8056
  ```
- Http appender

  When configuring Http appender, the required parameters are `tac_appender_http_host` and `tac_appender_http_port`, but you can also use the username and password if specified. For example:
  ```
  tac_appender_http_host: 'localhost'
  tac_appender_http_port: 8057
  tac_appender_http_username: 'talend'            
  tac_appender_http_password: 'talend'
  ```  
- License
  
  To automatically install a license during installation, use `tac_install_license` parameter, for which allowed values are "yes" or "no". If the value is "yes", then you need to specify path to license file using parameter `tac_license_file`. For example:
  ```
  tac_install_license: 'yes'
  tac_license_file: '/mnt/share/licenses/last.license'
  ```
  
Dependencies
------------

The following roles must be used to successfully install and deploy Talend Administrator Center:
- java
- talend-repo
- tomcat (must be used if `app_use_talend_tomcat: 'yes'`)

All necessary roles must be defined before "tac" role, see Example Playbook.

Example Playbook
----------------

  ```
  - hosts: tac-group
    remote_user: root
    roles:
      - java
      - talend-repo
      - tomcat
      - tac
  ```

License
-------

BSD

