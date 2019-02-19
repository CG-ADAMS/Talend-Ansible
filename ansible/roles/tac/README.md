Talend Administrator Center (TAC)
=========

This role installs **Talend Administrator Center** (TAC).

Make sure you completed the requirements listed in the [Root README](../../README.md) file.

Role Variables
--------------

Before running the script, you can change the following variable in the *defaults/main.yml* file:

> **Note**: You can find details about each application installed using these Ansible roles in the corresponding RPM documentation on [Talend Help Center](https://help.talend.com/search/all?query=rpm&content-lang=en-US).

- Tomcat

  To use **tomcat** in shared mode, set the `app_use_talend_tomcat` parameter. Possible values are "yes" or "no". If set to "yes", then you need to specify a Tomcat port. For example:
  ```
  app_use_talend_tomcat: 'yes'
  app_tomcat_port: 8080
  ```
  To use customer's Tomcat, set `app_use_talend_tomcat: 'no'`. In this case, you need to specify following parameters:
  ```
  app_tomcat_port: 8080
  app_tomcat_home: '/opt/tomcat'
  app_tomcat_mode: 'direct'
  app_tomcat_setup: 'yes'
  ```
- Systemd

  To install as systemd service, set the `app_install_systemd` parameter. Possible values are "yes" or "no". For example:
  ```
  app_install_systemd: 'yes'
  ```
- Web-application name

  To specify the web-application name, set the `tac_webapp_name` parameter. For example:
  ```
  tac_webapp_name: 'org.talend.administrator'
  ```
- Admin username/password

  To specify the admin username and password, set the `tac_admin_user` and `tac_admin_pass` parameters. For example:
  ```
  tac_admin_user: 'security@company.com'
  tac_admin_pass: 'admin'
  ```
- SSO

  To use SSO, set the `tac_use_sso` parameter. Possible values are "yes" or "no". For example
  ```
  tac_use_sso: 'no'
  ```
- LogServer

  To use LogServer, set the `tac_use_logserver` parameter. Possible values are "yes" or "no". If the value is "yes", you need to specify LogServer host and port. For example:
  ```
  tac_use_logserver: 'yes'
  tac_logserver_host: 'localhost'
  tac_logserver_port: 5044
  ```
- Database

  To select a database, set the `tac_database` parameter. Possible values are "h2", "mysql", "oracle", "mssql", "postgresql" or "mariadb". Also specify the database name, host, port, username and password. For example:
  ```
  tac_database: "mysql"
  tac_db_host: 'localhost'
  tac_db_port: 3306
  tac_db_name: 'talend_administrator'
  tac_db_user: 'talend'
  tac_db_password: 'talend'
  ```
  If you set `tac_database` to `h2`, the other parameters are optional.
- JobServer

  To configure JobServer settings, set the `tac_setup_jobserver` parameter. Possible values are "yes" or "no". If the value is "yes", specify the JobServer name, host, command port, file transfer port and monitoring port. If required, also specify the username and password. For example:
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

  When configuring Http appender, the required parameters are `tac_appender_http_host` and `tac_appender_http_port`. If required, also specify the username and password. For example:
  ```
  tac_appender_http_host: 'localhost'
  tac_appender_http_port: 8057
  tac_appender_http_username: 'talend'
  tac_appender_http_password: 'talend'
  ```
- License

  To automatically install a license during the deployment, use the `tac_install_license` parameter. Possible values are "yes" or "no". If the value is "yes", specify the path to the license file using the `tac_license_file` parameter. For example:
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

Roles listed above must be defined before the **tac** role in the playbook For example:

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
