#!/bin/bash
set -euo pipefail

source "$(dirname "$0")/../config/config.sh"

mkdir -p "$VARIANT_DIR" "$LOG_DIR"

echo "=== Variant summary for $GROUP ===" > "$SUMMARY_TXT"
echo "Raw variants: $(grep -vc '^#' "$RAW_VCF")" >> "$SUMMARY_TXT"
echo "Filtered variants: $(grep -vc '^#' "$FILTERED_VCF")" >> "$SUMMARY_TXT"

echo "" >> "$SUMMARY_TXT"
echo "=== First 10 filtered variants ===" >> "$SUMMARY_TXT"
grep -v '^#' "$FILTERED_VCF" | head -n 10 >> "$SUMMARY_TXT"

echo "" >> "$SUMMARY_TXT"
echo "=== Samples in filtered VCF ===" >> "$SUMMARY_TXT"
bcftools query -l "$FILTERED_VCF" >> "$SUMMARY_TXT"

bcftools stats "$RAW_VCF" > "$RAW_STATS" 2> "$LOG_DIR/${GROUP}_raw_stats.log"
bcftools stats "$FILTERED_VCF" > "$FILTERED_STATS" 2> "$LOG_DIR/${GROUP}_filtered_stats.log"
