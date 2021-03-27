#!/bin/bash +eu

#exit codes
NOT_FOUND=75
MISSING_PARAMETERS=22

#parameters input
DIR=${1}

#checking if input parameters were given
if [[ -z ${1} ]]
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

cd ${DIR}

for FILE in *; do 
    if [[ -f $FILE ]] && [[ ${FILE: -4} == ".bak" ]]
    then 
        echo "Plik *.bak: ${FILE}"
        chmod u-w ${FILE}
        chmod o-w ${FILE}

    elif [[ -d $FILE ]] && [[ ${FILE: -4} == ".bak" ]]
    then 
        echo "Katalog *.bak: ${FILE}"
        chmod u-r ${FILE}
        chmod g-r ${FILE}
        chmod o+r ${FILE}

    elif [[ -d $FILE ]] && [[ ${FILE: -4} == ".tmp" ]]
    then 
        echo "Katalog *.tmp: ${FILE}"
        chmod u+rw ${FILE}
        chmod g+rw ${FILE}
        chmod o+rw ${FILE}

    elif [[ -f $FILE ]] && [[ ${FILE: -4} == ".txt" ]]
    then 
        echo "Plik *.txt: ${FILE}"
        chmod 421 ${FILE}

    elif [[ -f $FILE ]] && [[ ${FILE: -4} == ".exe" ]]
    then 
        echo "Plik *.exe: ${FILE}"
        chmod u+x ${FILE}
        chmod g+xs ${FILE}
        chmod o+xs ${FILE}
    fi
done