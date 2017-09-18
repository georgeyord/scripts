#!/bin/bash

######## ARRANGE ########

export SCRIPT; SCRIPT=$(basename "${0}")

######## TESTS ########

test_overridenEnvVariables() {
  assertEquals "${LOG_PATH}" "/tmp/test/"
  assertEquals "${LOG_FILE}" "/tmp/test/./size_monitor.log"
  assertEquals "${FILE_DELIMITER}" "	"
}

test_prepareFolderStructureAndFiles() {
  prepareFoldersAndFiles
  ACTUAL=$?

  assertTrue "LOG_PATH (/tmp/test/) does not exist" "[ -d /tmp/test ]"
  assertTrue "LOG_FILE (/tmp/test/size_monitor.log) does not exist" "[ -f /tmp/test/size_monitor.log ]"

  assertEquals 0 "${ACTUAL}"
}

test_buildRecord() {
  ACTUAL=$(buildRecord "/tmp/test/files/foo" 2349230)

  assertEquals "/tmp/test/files/foo	2349230	2017-06-07_10-30-21" "${ACTUAL}"
}

test_removeRecord() {
  prepareLogfileWithRecords

  removeRecord "/tmp/test/files/foo"

  ACTUAL=$(wc -l < "${LOG_FILE}")
  assertEquals 2 "${ACTUAL}"
}

test_removeRecord_shouldNotRemoveAPartialFilepath() {
  prepareLogfileWithRecords

  removeRecord "/tmp"
  removeRecord "/tmp/"
  RESULT=$(wc -l < "${LOG_FILE}")

  assertEquals 3 "${RESULT}"
}

test_createRecord() {
  createRecord "foo"
  createRecord "bar"

  ACTUAL=$(wc -l < "${LOG_FILE}")
  assertEquals 2 "${ACTUAL}"

  assertEquals "foo" "$(head -n 1 "${LOG_FILE}")"
  assertEquals "bar" "$(tail -n 1 "${LOG_FILE}")"
}

test_findRecord() {
  prepareLogfileWithRecords

  export RECORD_ARRAY;
  findRecord "/tmp/test/files/foo"
  ACTUAL=$?

  assertEquals 0 "${ACTUAL}"
  assertEquals "/tmp/test/files/foo" "${RECORD_ARRAY[0]}"
  assertEquals "2349230" "${RECORD_ARRAY[1]}"
  assertEquals "${TIMESTAMP}" "${RECORD_ARRAY[2]}"
}

test_findSize() {
  prepareLogfileWithRecords

  ACTUAL=$(findSize "/tmp/test/files")
  assertEquals 65536 "${ACTUAL}"

  ACTUAL=$(findSize "/tmp/test/files/foo")
  assertEquals 20480 "${ACTUAL}"

  ACTUAL=$(findSize "/tmp/test/files/foobar")
  assertEquals 10240 "${ACTUAL}"
}

test_calculateDifference() {
  OLD_SIZE="4"
  NEW_SIZE="6"
  ACTUAL=$(calculateDifference "${OLD_SIZE}" "${NEW_SIZE}")

  assertEquals 2 "${ACTUAL}"
}

test_calculatePercentage() {
  OLD_SIZE="4"
  NEW_SIZE="6"
  ACTUAL=$(calculatePercentage "${OLD_SIZE}" "${NEW_SIZE}")

  assertEquals 67 "${ACTUAL}"
}

test_calculatePercentage_whereNewSizeIsBiggerThenTheOldSize() {
  ACTUAL=$(calculatePercentage "4" "6")

  assertEquals 150 "${ACTUAL}"
}

test_formatSize() {
  assertEquals "1B" "$(formatSize '1')"
  assertEquals "100B" "$(formatSize '100')"
  assertEquals "97.65K" "$(formatSize '100000')"
  assertEquals "13.66M" "$(formatSize '14324234')"
  assertEquals "13.33G ***" "$(formatSize '14324234342')"
}

test_formatSizeNumfmt() {
  assertEquals "1" "$(formatSizeNumfmt '1')"
  assertEquals "100" "$(formatSizeNumfmt '100')"
  assertEquals "98K" "$(formatSizeNumfmt '100000')"
  assertEquals "14M" "$(formatSizeNumfmt '14324234')"
  assertEquals "14G" "$(formatSizeNumfmt '14324234342')"
}

test_formatSizeCustom() {
  assertEquals "1B" "$(formatSizeCustom '1')"
  assertEquals "100B" "$(formatSizeCustom '100')"
  assertEquals "97.65K" "$(formatSizeCustom '100000')"
  assertEquals "13.66M" "$(formatSizeCustom '14324234')"
  assertEquals "13.33G ***" "$(formatSizeCustom '14324234342')"
  assertEquals "13.02T *****" "$(formatSizeCustom '14324234342000')"
  assertEquals "12.72E *****" "$(formatSizeCustom '14324234342000000')"
}

test_addToFindingsIfNeeded() {
  addToFindingsIfNeeded "/tmp/test/foo" "2430000" "3345000" "${TIMESTAMP}"
  echo "${FINDINGS}"
  assertTrue "ACTUAL findings do not exist" "echo \"${FINDINGS}\" | grep \"size change for /tmp/test/foo\""
}

test_printSummary() {
  ACTUAL=$(printSummary "/tmp/test/foo" "893.55K" "73" "2430000" "3345000")
  assertEquals "FILE: /tmp/test/foo - DIFFERENCE: 97.65K=3345000-2430000 (73%)" "${ACTUAL}"
}

test_shouldNotifyForSizeChange_shouldReturnTruethy() {
  shouldNotifyForSizeChange "243" "1113452" "1113209"
  ACTUAL=$?
  assertEquals "1" "${ACTUAL}"
}

test_shouldNotifyForSizeChange_shouldReturnFaulty() {
  shouldNotifyForSizeChange "243" "3452" "3209"
  ACTUAL=$?
  assertEquals "0" "${ACTUAL}"
}

test_sendEmail_shouldReturnFaultyIfMailCommandDoesNotExists() {
  RESULT=$(sendEmail)
  ACTUAL=$?
  assertEquals "1" "${ACTUAL}"
}

######## HELPER FUNCTIONS ########

prepareLogfileWithRecords() {
  mkdir -p "/tmp/test/files" && \
  head -c 20K </dev/urandom > "/tmp/test/files/foo" && \
  head -c 30K </dev/urandom > "/tmp/test/files/bar" && \
  head -c 10K </dev/urandom > "/tmp/test/files/foobar" && \

  {
    buildRecord "/tmp/test/files/foo" 2349230;
    buildRecord "/tmp/test/files/bar" 12414;
    buildRecord "/tmp/test/files/foobar" 4585435;
  } >> "${LOG_FILE}"
}

####### OVERRIDEN SETUP ENVIRONMENT ######

setupEnvironment() {
  export SETUP_DIRECTORY; SETUP_DIRECTORY="./"
  export LOG_PATH; LOG_PATH="/tmp/test/"
  export LOG_FILE; LOG_FILE="${LOG_PATH}./size_monitor.log"
  export TIMESTAMP; TIMESTAMP="2017-06-07_10-30-21"

  export TEST_MODE=1
}

######## CLEANUP ########

setUp() {
  source "${SETUP_DIRECTORY}../size_monitor.sh"

  setupEnvironment
  prepareFoldersAndFiles
}

tearDown() {
  rm -rf "/tmp/test/"
  true
}

######## MAIN ########

echo -e "\n*** Running shellcheck analysis tool ***\n"
# https://www.shellcheck.net/
which shellcheck >/dev/null 2>&1

if [ $? -eq 0 ]; then
  shellcheck "${SETUP_DIRECTORY}../size_monitor.sh" && \
  shellcheck "${SCRIPT}" && \
  echo "OK" || \
  exit 1
else
  echo "shellcheck should be installed (apt-get install shellcheck)"
  exit 1
fi


echo -e "\n*** Running shunit2 unit tests ***\n"
# http://ssb.stsci.edu/testing/shunit2/shunit2.html
which shunit2 >/dev/null 2>&1
if [ $? -eq 0 ]; then
 "${SETUP_DIRECTORY}." shunit2
else
  echo "shunit2 should be installed (apt-get install shunit2)"
  exit 1
fi