TDS
=========

This role have the objective to deploy the Talend Data StewardShip application.

Requirements
------------

An access to the Talend RPM repository.

Role Variables
--------------

The following table lists the configurable parameters for TDS playbook and their default values.
The ones flagged with "First Install Only" to yes can be change only at the initial installation. You can't change them after (during an update).

Parameter                             | First Install Only | Description                                      | Default
--------------------------------------|--------------------|--------------------------------------------------|--------------------------------
`app_install_systemd`  |Yes|Installation of the service in systemd : "yes" or "no"  | yes
`app_use_talend_tomcat`|Yes|Use Talend Tomcat : "yes" or "no".                      | yes
`app_tomcat_port`      |Yes|Port of Tomcat                                          | 19999
`app_tomcat_home`      |Yes|Path to Tomcat home (only if you want to use a custom tomcat - app_use_talend_tomcat = no)| /opt/tomcat
`app_tomcat_mode`      |Yes|Tomcat mode : "direct" or "shared" (only if you want to use a custom tomcat - app_use_talend_tomcat = no)                      | direct
`app_tomcat_setup`     |Yes|TODO : to be confirmed                      | no
`tds_kafka_host`       |No |Hostname where Kafka broker is installed                | localhost
`tds_kafka_port`       |No |Port of Kafka broker                                    | 9092
`tds_mongo_host`       |No |Hostname where MongoDB is installed                     | localhost
`tds_mongo_port`       |No |Port of MongoDB                                         | 27017
`tds_mongo_database`   |No |Name of the TDS MongoDB database                        | tds
`tds_mongo_username`   |No |Username of the TDS MongoDB database                    | tds-user
`tds_mongo_password`   |No |Password of the TDS MongoDB database. You can't use the default value for security things. Please change it        | duser
`tds_security_scim_url`|No |URL to your Talend Identity and Access Management SCIM  | <http://localhost:9080/scim>
`tds_security_oidc_url`|No |URL to your Talend Identity and Access Management       | <http://localhost:9080/oidc>
`tds_security_oidc_user_auth_url` |No|URL to your Talend Identity and Access Management User Authentication | <http://localhost:9080/oidc>
`tds_oidc_id`          |No |Talend Identity and Access Management OIDC client identifier | tl6K6ac7tSE-LQ
`tds_oidc_secret`      |No |Talend Identity and Access Management OIDC password     | sLbyFKTzM8F0dTL10mHd3A
`tds_use_semantic`     |No |Enable link with Talend Dictionary Service (Semantic) : "yes" (only if you have a licence) or "no" | yes
`tds_semantic_port`    |No |URL of Talend Dictionary Service (Semantic)             | <http://localhost:8187/>
`tds_use_tdp_switch`   |No |Enable Talend Data Preparation  app switch : "yes" (only if you have a licence) or "no" | no
`tds_front_tdp_url`    |No |URL of Talend Data Preparation                          | <http://localhost:9999>

Dependencies
------------

List of dependancies (playbooks) :

- Java
- Tomcat
- IAM
- TAC
- MongoDB
- Kafka
- TSD (Talend Semantic Dictionary - optional, only in if you have the licence of this module)
- TDP (Talend Data Preparation - optional, only in if you have the licence of this module and you want to use the app switcher on the TDS interface)

Example Playbook
----------------

Example of how to use playbook (you can remove tsd if you don't have the licence) :

    - hosts: tds-group
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
        - tds

License
-------

Apache License 2.0

Author Information
------------------

Talend SA
