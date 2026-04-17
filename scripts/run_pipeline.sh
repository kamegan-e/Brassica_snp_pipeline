#!/bin/bash
set -euo pipefail

source "$(dirname "$0")/../config/config.sh"

echo "========================================"
echo "Pipeline started for group: $GROUP"
echo "Date: $(date)"
echo "========================================"

echo "[$(date)] Step 1: QC and trimming"
"$SCRIPT_DIR/01_trim.sh"

echo "[$(date)] Step 2: Alignment"
"$SCRIPT_DIR/02_align.sh"

echo "[$(date)] Step 3: Variant calling"
"$SCRIPT_DIR/03_variant_calling.sh"

echo "[$(date)] Step 4: Variant statistics"
"$SCRIPT_DIR/04_variant_stats.sh"

echo "========================================"
echo "Pipeline completed successfully for $GROUP"
echo "Date: $(date)"
echo "========================================"
