#!/bin/bash

# Error status variables
STATUS_OK=0
STATUS_ERROR=1

# Color settings
YELLOW_COLOR="\033[1;33m"
RED_COLOR="\033[0;31m"
OFF_COLOR="\033[0m"

# Set English language
LANG=en_US.UTF-8

# Execute it as root user
if [ "${USER}" != root ]; then
  echo -e "${RED_COLOR}ERROR: must be root! Exiting...${OFF_COLOR}"
  exit "${STATUS_ERROR}"
fi

# Current status
USED_BEFORE="$(df -k / | awk 'NR>1 {print $3}')"

# snapd revisions clean
if [ -n "$(command -v snap)" ]; then
  # shellcheck disable=SC2162
  read -p "→ Do you want to remove unused snapd revisions? [Y/n] " KEY
  KEY="${KEY:0:1}" && KEY="${KEY,,}"
  if [ "${KEY}" = "y" ] || [ "${KEY}" = "" ]; then
    # remove unused snapd revisions
    echo "Removing unused snapd revisions..."
    snap set system refresh.retain=2
    # shellcheck disable=SC2162
    snap list --all | awk '/disabled/ {print $1, $3}' |
    while read SNAP_NAME SNAP_REV; do
      snap remove "${SNAP_NAME}" --revision="${SNAP_REV}";
    done
    if [ -d /var/lib/snapd/cache ] && [ -n "$(ls -A /var/lib/snapd/cache)" ]; then
      rm /var/lib/snapd/cache/*
    fi
    echo "Nothing unused to uninstall"
  else
    echo "Task skipped"
  fi
fi

# Current status
USED_AFTER="$(df -k / | awk 'NR>1 {print $3}')"

# Summary
echo -e "${YELLOW_COLOR}Freed up space: $(( (USED_BEFORE - USED_AFTER)/1024 )) MB${OFF_COLOR}"
exit "${STATUS_OK}"
