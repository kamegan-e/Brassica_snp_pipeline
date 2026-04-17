#!/bin/bash
set -euo pipefail

source "$(dirname "$0")/../config/config.sh"

mkdir -p "$ALIGN_DIR" "$LOG_DIR"

while read -r SAMPLE; do
  [ -z "$SAMPLE" ] && continue

  R1="$TRIM_DIR/${SAMPLE}_R1.fastq.gz"
  R2="$TRIM_DIR/${SAMPLE}_R2.fastq.gz"

  SAM="$ALIGN_DIR/${SAMPLE}.sam"
  BAM="$ALIGN_DIR/${SAMPLE}.bam"
  SORTED_BAM="$ALIGN_DIR/${SAMPLE}_sorted.bam"
  LOG="$LOG_DIR/${SAMPLE}_bwa.log"

  echo "Aligning $SAMPLE"

  bwa mem -t 4 "$REF_FASTA" "$R1" "$R2" > "$SAM" 2> "$LOG"

  samtools view -Sb "$SAM" > "$BAM"
  samtools sort "$BAM" -o "$SORTED_BAM"
  samtools index "$SORTED_BAM"

done < "$SAMPLES_FILE"
