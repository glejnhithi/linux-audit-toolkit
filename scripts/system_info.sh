#!/usr/bin/env bash

collect_system_info() {
  log_info " Collecting system information "
  OUTPUT="$REPORT_DIR/system_info.txt"
  {
    echo "===== SYSTEM INFO ====="
    echo "Hostname: $(hostname)"
    echo "Date: $(date)"
    echo "Kernel: $(uname -r)"
    echo "OS: $(cat /etc/os-release 2>/dev/null || echo 'OS info not found')"
    echo
    echo "Uptime: $(uptime) "
    echo
    echo "Logged users: $(who) "
  } > "$OUTPUT"

  echo "System info saved to $OUTPUT "
  cat $OUTPUT
}
