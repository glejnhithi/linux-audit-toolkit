#!/usr/bin/env bash

check_disk_usage() {
  log_info " Checking disk usage...."
  OUTPUT="$REPORT_DIR/disk_check.txt"
  {
    echo "===== DISK USAGE ====="
    df -h
    echo
    echo "===== DISK ALERTS ====="
    df -h --output=pcent,target | tail -n +2 | while read usage mount; do
      percent=$(echo "$usage" | tr -d '%')

      if [ "$percent" -ge "$DISK_WARNING_LIMIT" ] ; then
        echo "WARNING: $mount is at $usage"
        log_warn "Disk warning: $mount is at $usage "
      else
        echo "OK: $mount is at $usage "
      fi
    done
  } > "$OUTPUT"
  echo "Disk check saved to $OUTPUT"
  cat "$OUTPUT"
}