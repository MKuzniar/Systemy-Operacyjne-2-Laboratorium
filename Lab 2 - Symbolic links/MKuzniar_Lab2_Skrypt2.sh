#!/bin/bash +eu

#exit codes
NOT_FOUND=75
MISSING_PARAMETERS=22

#parameters input
DIR=${1}
FILE=${2}

#checking if input parameters were given
if [[ -z ${1} ]] || [[ -z ${2} ]]
then
    echo "ERROR. Missing input parameters"
    exit ${MISSING_PARAMETERS}
fi

#checking if directory exists
if [[ ! -d "${1}" ]]
then 
    echo "ERROR. Directory doesn't exist"
    exit ${NOT_FOUND}
fi

#detecting broken links
cd ${DIR}
touch ${FILE}

for LINK in *; do
    if [ ! -e ${LINK} ]; then 
        echo "${LINK}_$(date --iso-8601=seconds)" >> ${FILE}
        rm -v ${LINK}
    fi
done