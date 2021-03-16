#!/bin/bash

#parameters input (optional)
SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-lab_uno/2remove}
TARGET_DIR=${3:-bakap}

echo "-----------------------"
echo "SOURCE_DIR: ${SOURCE_DIR}"
echo "RM_LIST:    ${RM_LIST}"
echo "TARGET DIR: ${TARGET_DIR}"
echo "-----------------------"

#checking if TARGET_DIR exists, if not creating it
mkdir -p ${TARGET_DIR}
echo "TARGET DIR created"
echo "-----------------------"

#deleting files listed in RM_LIST
echo "Deleting files listed in RM_LIST"
LIST=$(cat "${RM_LIST}")

for WORD in ${LIST}; do 
    rm -frv ${SOURCE_DIR}/${WORD}
done
echo "-----------------------"

#copying files only to TARGET_DIR
echo "Copying files to TARGET_DIR"
cp -nv ${SOURCE_DIR}/* ${TARGET_DIR}
echo "-----------------------"

#copying directories only to TARGET_DIR
echo "Copying directories to TARGET_DIR"
cp -rnv ${SOURCE_DIR}/* ${TARGET_DIR}
echo "-----------------------"

#counting files left in SOURCE_DIR
COUNTER=$(ls ${SOURCE_DIR} | wc -w)

echo "Zostało ${COUNTER} plików"

if [[ ${COUNTER} -le 0 ]]; then 
    echo "Tu był Kononowicz"
elif ([[ ${COUNTER} -gt 0 ]] && [[ ${COUNTER} -le 2 ]]); then
    echo "Jeszcze coś zostało. Mniej niż 2 pliki lub dokładnie 2 pliki"
elif ([[ ${COUNTER} -gt 2 ]] && [[ ${COUNTER} -le 4 ]]); then
    echo "Jeszcze coś zostało. Więcej niż 2 ale mniej niż 4 pliki lub dokładnie 4 pliki"
elif [[ ${COUNTER} -gt 4 ]]; then
    echo "Jeszcze coś zostało. Więcej niż 2 pliki. Więcej niż 4 pliki"
else
    echo "Coś jest nie tak"
fi
echo "-----------------------"

#revoking editing right in TARGET_DIR
chmod -Rc 444 ${TARGET_DIR}/*
echo "-----------------------"

#.zip TARGET_DIR
today=$(date +"%Y-%m-%d")
zip -rv bakap_${today}.zip ${TARGET_DIR}