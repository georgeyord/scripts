#!/bin/bash

####### SETUP ENVIRONMENT ######

export LOG_PATH; LOG_PATH="/root/"
export LOG_FILE; LOG_FILE="${LOG_PATH}./size_monitor.log"
export FILE_DELIMITER; FILE_DELIMITER="	"
export TIMESTAMP; TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
export FINDINGS; FINDINGS=""
export FILES_TO_MONITOR;
export FILES_TO_MONITOR_FILE;
export EMAIL_SUBJECT;
export EMAIL_BODY_START;
export EMAIL_TO;

EMAIL_SUBJECT="$(hostname) - Disk usage notification"
EMAIL_BODY_START="These findings where discovered when size_monitor script run:"$'\n'$'\n'
EMAIL_TO="root@$(hostname)"
FILES_TO_MONITOR=('/var/log')
# FILES_TO_MONITOR_FILE="/root/size_monitor_files";

######## FUNCTIONS ########

function addToFindingsIfNeeded() {
    FILE="${1}"
    OLD_SIZE="${2}"
    OLD_TIMESTAMP="${3}"
    SIZE="${4}"
    DIFFERENCE=$(calculateDifference "${SIZE}" "${OLD_SIZE}")
    HUMAN_DIFFERENCE=$(formatSize "${DIFFERENCE}")

    shouldNotifyForSizeChange "${OLD_SIZE}" "${SIZE}" "${DIFFERENCE}"
    RESULT=$?

    if [ "${RESULT}" -ne 0 ]; then
      FINDINGS+="${HUMAN_DIFFERENCE} size change for ${FILE}"$'\n'
    fi

    if [ -z "${TEST_MODE}" ]; then
      printSummary "${FILE}" "${HUMAN_DIFFERENCE}" "${OLD_SIZE}" "${SIZE}"
    fi
}

function buildRecord() {
  FILEPATH="${1}"
  SIZE="${2}"
  echo "${FILEPATH}${FILE_DELIMITER}${SIZE}${FILE_DELIMITER}${TIMESTAMP}"
}

function calculateDifference() {
  OLD="${1}"
  CURRENT="${2}"

  echo "$((OLD-CURRENT))"
}

function createRecord() {
  RECORD="${1}"
  echo "${RECORD}" >> ${LOG_FILE}
}

function findSize() {
  du -bs "$1" | cut -f -1
}

function findRecord() {
  RECORD=$(grep "${1}${FILE_DELIMITER}" < "${LOG_FILE}")

  if [[ "${RECORD}" == "" ]]; then
    RECORD_ARRAY=("${1}" 0 "NEVER")
    return 1;
  fi

  IFS="${FILE_DELIMITER}" read -r -a RECORD_ARRAY <<< "${RECORD}"

  if [ ${#RECORD_ARRAY[@]} -ne 3 ] ;then
    echo "Badly formatted record for file '${1}' in ${LOG_FILE}"
    return 3;
  fi

  return 0;
}

function formatSize() {
  formatSizeCustom "${1}"
}

function formatSizeNumfmt() {
  which numfmt >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    numfmt --to=iec --format='%f' "${1}"
  else
    # numfmt not found
    echo "${1}"
  fi
}

function formatSizeCustom() {
  b=${1:-0}; d=''; s=0; S=(B {K,M,"G ***","T *****","E *****","P *****","Y *****","Z *****"})
  while ((b > 1024)); do
      d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
      b=$((b / 1024))
      let s++
  done
  echo "$b$d${S[$s]}"
}

function loadFromFileIfPossible() {
  if [ -f "${FILES_TO_MONITOR_FILE}" ]; then
    IFS=$'\n' read -d '' -r -a FILES_TO_MONITOR < "${FILES_TO_MONITOR_FILE}"
  fi
}

function notifyForSizeChangeIfNeeded() {
  if [[ "${FINDINGS}" != "" ]]; then
    echo "${EMAIL_BODY_START}${FINDINGS}"
    sendEmail "${FINDINGS}"
  fi
}

function printSummary() {
  FILE="${1}"
  HUMAN_DIFFERENCE="${2}"
  OLD_TIMESTAMP="${3}"
  SIZE="${4}"

  echo "FILE: ${FILE}"
  echo "DIFFERENCE=${DIFFERENCE}=${OLD_SIZE}-${SIZE}"
  echo
}

function shouldNotifyForSizeChange() {
    OLD_SIZE="${1}"
    SIZE="${2}"
    DIFFERENCE=$(calculateDifference "${SIZE}" "${OLD_SIZE}")

    # Scenario more than 100K added
    if [ "${DIFFERENCE}" -gt 100000 ]; then
      return 1
    fi

    return 0
}

function prepareFoldersAndFiles() {
  mkdir -p "${LOG_PATH}" && \
  touch "${LOG_FILE}"

  return $?
}

function removeRecord() {
  # shellcheck disable=SC2001
  QUERY=$(echo "${1}" | sed 's#\/#\\\/#g')
  sed -i "/^${QUERY}${FILE_DELIMITER}/d" "${LOG_FILE}"
}

function sendEmail() {
  BODY="${EMAIL_BODY_START}${1}"
  echo "Sending findings to ${EMAIL_TO} with body:"
  echo -e "\nSTART\n${BODY}\nEND"

  which mail >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "${BODY}" | mail -s "${EMAIL_SUBJECT}" "${EMAIL_TO}"
    return 0
  fi

  echo "mail should be installed and configured (apt-get install mailutils)"
  return 1
}

######## MAIN ########

function main() {
  loadFromFileIfPossible
  prepareFoldersAndFiles

  for FILE in "${FILES_TO_MONITOR[@]}"; do
    export RECORD_ARRAY;

    # find previous size from file
    findRecord "${FILE}"
    OLD_SIZE="${RECORD_ARRAY[1]}"
    OLD_TIMESTAMP="${RECORD_ARRAY[2]}"

    # find current size
    SIZE=$(findSize "${FILE}")

    # calculate the difference and add to findings if threshold is passed
    addToFindingsIfNeeded "${FILE}" "${OLD_SIZE}" "${OLD_TIMESTAMP}" "${SIZE}"

    # store new record in file
    removeRecord "${FILE}"
    RECORD=$(buildRecord "${FILE}" "${SIZE}" "${TIMESTAMP}")
    createRecord "${RECORD}"
  done

  # if findings exist make appropriate actions
  notifyForSizeChangeIfNeeded
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
