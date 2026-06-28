#!/usr/bin/env bash
generate_report() {

  log_info "Generating final report"

  DATE_NOW=$(date +"%Y-%m-%d_%H-%M-%S")
  FINAL_REPORT="$REPORT_DIR/final_report_$DATE_NOW.txt"

  {
    echo "======================================"
    echo "       FINAL SERVER AUDIT REPORT      "
    echo "======================================"
    echo " Generated: $(date)"
    echo

    for file in "$REPORT_DIR"/*.txt; do
      if [ -f "$file" ] && [[ "$file" != *final_report* ]]; then
        echo
        echo "___________________________"
        echo "    Content from: $file    "
        echo "___________________________"
        cat "$file"
        echo
      fi
    done

    echo "======================================"
    echo "        APPLICATION AUDIT LOGS        "
    echo "======================================"
    cat "$LOG_FILE"

  } > "$FINAL_REPORT"

  echo "Final success report generated: final_report_$DATE_NOW.txt"


}
