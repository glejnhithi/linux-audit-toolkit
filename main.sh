#!/usr/bin/env bash

set -e

source ./config.env
source ./scripts/common.sh
source ./scripts/system_info.sh
source ./scripts/disk_check.sh
source ./scripts/memory_check.sh
source ./scripts/service_check.sh
source ./scripts/log_check.sh
source ./scripts/backup.sh
source ./scripts/report.sh

init_project

show_menu () {
      clear
      echo "================================="
      echo " $APP_NAME"
      echo "================================="
      echo "1) Run full audit"
      echo "2) System info"
      echo "3) Disk check"
      echo "4) Memory check"
      echo "5) Service check"
      echo "6) Log check"
      echo "7) Backup"
      echo "8) Generate report"
      echo "9) Exit"
      echo
}

run_full_audit () {
      log_info "Starting full audit"

      collect_system_info
      check_disk_usage
      check_memory_usage
      check_services
      check_system_logs
      run_backup
      generate_report

      log_info "Full audit completed"
      echo "Full audit completed successfully."

}

while true ; do
  show_menu
  read -p "Choose an option: " choose

  case "$choose" in
      1) run_full_audit ;;
      2) collect_system_info ;;
      3) check_disk_usage ;;
      4) check_memory_usage ;;
      5) check_services ;;
      6) check_system_logs ;;
      7) run_backup ;;
      8) generate_report ;;
      9) echo "Bye see you next time" ; exit 0 ;;
      *) echo "Invalid option" ;;

  esac

  echo
  read -p "Press Enter to continue ..."
done