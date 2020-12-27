---
title: Setting up OpenLDAP on docker
date: 2020-12-27T00:00:00+09:00
type: posts
tags
  - docker
  - openldap
categories:
  - tips
---

```sh
docker run -p 389:389 -p 636:636 --name ldap --env LDAP_DOMAIN="devplayg.com" --env LDAP_ORGANISATION="Devplayg" --env LDAP_ADMIN_PASSWORD=grit --env LDAP_READONLY_USER_USERNAME=devplayg --env LDAP_READONLY_USER_PASSWORD=devplayg --detach osixia/openldap:1.4.0
docker exec ldap ldapsearch -x -H ldap://localhost -b dc=devplayg,dc=com -D "cn=admin,dc=devplayg,dc=com" -w grit
```
