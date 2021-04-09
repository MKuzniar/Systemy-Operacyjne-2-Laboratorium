#!/bin/bash -eu

#znajdź w pliku access_log zapytania, które mają fazę "denied" w linku 
cat access_log | cut -d' ' -f6,7,8 | grep '\/denied'

#znajdź w pliku zapytania typu POST
cat access_log | cut -d' ' -f6,7,8 |grep '\"POST'

#znajdź w pliku access_log zapytania wysłane z IP 64.242.88.10
cat access_log | cut -d' ' -f1,6,7,8 | grep '^64\.242\.88\.10 '

#znajdź w pliku access_log wszystkie zapytania niewysłane z adresu IP tylko z FQDN
cat access_log | cut -d' ' -f1,6,7,8 | grep '^[a-z]'

#znajdź w pliku access_log unikalne zapytania typu DELETE
cat access_log | cut -d' ' -f6,7,8 | grep '\"DELETE' | sort | uniq

#znajdź unikalnych 10 adresów IP w access_log
cat access_log | cut -d' ' -f1 | grep '^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | sort | uniq | sed 10q