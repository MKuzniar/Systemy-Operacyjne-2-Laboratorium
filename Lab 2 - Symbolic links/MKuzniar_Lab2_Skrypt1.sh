#!/bin/bash -eu

#exit codes
DIR_NOT_FOUND=75
MISSING_PARAMETERS=22

#parameters input
FIRST_DIR=${1}
SECOND_DIR=${2}

#checking if input parameters were given
if [[ -z ${1} ]] || [[ -z ${2} ]]
then
    echo "ERROR. Missing input parameters"
    exit ${MISSING_PARAMETERS}
fi

#checking if both directories exist
if [[ ! -d "${1}" ]] || [[ ! -d "${2}" ]]
then 
    echo "ERROR. One or both directories don't exist"
    exit ${DIR_NOT_FOUND}
fi

#sorting by file type
cd ${1}
for FILE in *; do 
    if [[ -d ${FILE} ]]; then
        echo "${FILE} | Directory"
    elif [[ -L ${FILE} ]]; then 
        echo "${FILE} | Symbolic link"
    else
        echo "${FILE} | Regular file"     
        ln -s $(readlink -f ${FILE}) ../${2}/${FILE%.txt}_ln.txt       
    fi
done