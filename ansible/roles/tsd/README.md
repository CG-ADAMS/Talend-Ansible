TSD
=========

This role have the objective to deploy the Talend Semantic Dictionary application.

Requirements
------------

An access to the Talend RPM repository.

Role Variables
--------------

The following table lists the configurable parameters for TSD playbook and their default values.
The ones flagged with "First Install Only" to yes can be change only at the initial installation. You can't change them after (during an update).

Parameter                             | First Install Only | Description                                      | Default
--------------------------------------|--------------------|--------------------------------------------------|--------------------------------
`app_install_systemd`  |Yes|Installation of the service in systemd : "yes" or "no"  | yes
`app_use_talend_tomcat`|Yes|Use Talend Tomcat : "yes" or "no".                      | yes
`app_tomcat_port`      |Yes|Port of Tomcat                                          | 8187
`app_tomcat_home`      |Yes|Path to Tomcat home (only if you want to use a custom tomcat - app_use_talend_tomcat = no)| /opt/tomcat
`app_tomcat_mode`      |Yes|Tomcat mode : "direct" or "shared" (only if you want to use a custom tomcat - app_use_talend_tomcat = no) | direct
`app_tomcat_setup`     |Yes|TODO : to be confirmed                                  | no
`tsd_kafka_host`       |No |Hostname where Kafka broker is installed                | localhost
`tsd_kafka_port`       |No |Port of Kafka broker                                    | 9092
`tsd_zookeeper_host`   |No |Hostname where Zookeeper is installed                   | localhost
`tsd_zookeeper_port`   |No |Port of Zookeeper broker                                | 2181
`tsd_mongo_host`       |No |Hostname where MongoDB is installed                     | localhost
`tsd_mongo_port`       |No |Port of MongoDB                                         | 27017
`tsd_mongo_database`   |No |Name of the TSD MongoDB database                        | dqdict
`tsd_mongo_username`   |No |Username of the TSD MongoDB database                    | tsd-user
`tsd_mongo_password`   |No |Password of the TSD MongoDB database. You can't use the default value for security things. Please change it        | duser
`tsd_security_scim_url`|No |URL to your Talend Identity and Access Management SCIM  | <http://localhost:9080/scim>
`tsd_security_oidc_url`|No |URL to your Talend Identity and Access Management       | <http://localhost:9080/oidc>
`tsd_oidc_id`          |No |Talend Identity and Access Management OIDC client identifier | tl6K6ac7tSE-LQ
`tsd_oidc_secret`      |No |Talend Identity and Access Management OIDC password     | sLbyFKTzM8F0dTL10mHd3A

Dependencies
------------

List of dependancies (playbooks) :

- Java
- Tomcat
- IAM
- TAC
- MongoDB
- Kafka

Example Playbook
----------------

Example of how to use playbook :

    - hosts: tsd-group
      remote_user: root
      roles:
        - java
        - talend-repo
        - tomcat
        - iam
        - kafka
        - mongodb
        - tac
        - tsd

License
-------

Apache License 2.0

Author Information
------------------

Talend SA
