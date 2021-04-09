#!/bin/bash -eu

#z pliku yolo.csv wypisz wszystkich, których id jest liczbą nieparzystą. Wyniki zapisz na standardowe wyjście błędów
for PERSON in $(cat yolo.csv | sed 1d | grep -E '^[0-9]{0,3}[1,3,5,7,9]{1},'); do
    echo "${PERSON}" 1>&2
done

#z pliku yolo.csv wypisz każdego, kto jest wart dokładnie $2.99, $5.99 lub $9.99. Nie ważne czy milionów czy miliardów (tylko nazwisko i wartość). Wyniki zapisz na standardowe wyjście błędów.
for PERSON in $(cat yolo.csv | sed 1d | cut -d',' -f3,7 | grep '\$[2,5,9]\.99.$'); do
    echo "${PERSON}" 1>&2
done

#z pliku yolo.csv wypisz każdy numer IP, który w pierwszym i drugim oktecie ma po jednej cyfrze. Wyniki zapisz na standardowe wyjście błędów
for IP in $(cat yolo.csv | sed 1d | cut -d',' -f6 | grep -E '^.\..\.[0-9]{1,3}\.[0-9]{1,3}'); do
    echo "${IP}" 1>&2
done
