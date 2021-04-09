#!/bin/bash -eu

#we wszystkich plikach katalogu 'groovies' zamień $HEADERS$ na /temat/
cd groovies
for FILE in *; do
    sed -ri 's/\$HEADER\$/\/temat\//g' ${FILE}
done

#we wszystkich plikach w katalogu 'groovies' po każdej linijce z 'class' dodać ' String marker = '/!@$%/"
cd groovies
for FILE in *; do
    sed -ri '/class/a String marker = "\/!@\$%\/"' ${FILE}
done

#we wszystkich plikach w katalogu 'groovies' usuń linijki zawierające faze 'Help docks'
cd groovies
for FILE in *; do
    sed -ri '/Help/d' ${FILE}
done