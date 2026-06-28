check_memory_usage() {
    log_info "Checking memory usage"

    OUTPUT="$REPORT_DIR/memory_check.txt"
    total=$(free | awk '/Mem:/ {print $2}')
    used=$(free | awk '/Mem:/ {print $3}')
    percent=$(( used * 100 / total ))

    {
        echo "===== MEMORY USAGE ====="
        free -h
        echo
        echo "Memory used: $percent%"

        if [ "$percent" -ge "$MEMORY_WARNING_LIMIT" ]; then
            echo "WARNING: Memory usage is high"
            log_warn "Memory usage high: $percent%"
        else
            echo "OK: Memory usage is normal"
        fi
    } > "$OUTPUT"
    cat "$OUTPUT"

    echo "Memory check saved to $OUTPUT"
}
