#!/bin/bash
set -euo pipefail

source "$(dirname "$0")/../config/config.sh"

mkdir -p "$TRIM_DIR" "$QC_DIR" "$LOG_DIR"

while read -r SAMPLE; do
  [ -z "$SAMPLE" ] && continue

  R1="$RAW_DIR/${SAMPLE}_1.fastq.gz"
  R2="$RAW_DIR/${SAMPLE}_2.fastq.gz"

  OUT_R1="$TRIM_DIR/${SAMPLE}_R1.fastq.gz"
  OUT_R2="$TRIM_DIR/${SAMPLE}_R2.fastq.gz"

  HTML="$QC_DIR/${SAMPLE}_fastp.html"
  JSON="$QC_DIR/${SAMPLE}_fastp.json"
  LOG="$LOG_DIR/${SAMPLE}_fastp.log"

  echo "Trimming $SAMPLE"

  fastp \
    -i "$R1" \
    -I "$R2" \
    -o "$OUT_R1" \
    -O "$OUT_R2" \
    --cut_front --cut_tail \
    --length_required "$MIN_LENGTH" \
    --thread 4 \
    --html "$HTML" \
    --json "$JSON" \
    > "$LOG" 2>&1

done < "$SAMPLES_FILE"
