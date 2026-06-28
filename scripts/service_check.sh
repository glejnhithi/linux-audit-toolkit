#!/usr/bin/env bash

check_services() {
  log_info "Checking Services"
  OUTPUT="$REPORT_DIR/service_check.txt"
  {
    echo "===== SERVICE CHECK ====="
    for service in "${SERVICES_TO_CHECK[@]}"; do
      if systemctl list-unit-files | grep -q "^$service.service"; then
          status=$(systemctl is-active "$service" || true)

          if [ "$status" = "active" ]; then
            echo "OK: $service is active"
          else
            echo "WARNING: $service is $status"
            log_warn "Service $service is $status"
          fi
      else
        echo "NOT FOUND: $service"
        log_warn "Service not found: $service "
        fi
  done
  } > "$OUTPUT"

  echo "Service check saved to OUTPUT"
  cat "$OUTPUT"
}