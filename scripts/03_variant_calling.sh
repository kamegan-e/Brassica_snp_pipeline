#!/bin/bash
set -euo pipefail

source "$(dirname "$0")/../config/config.sh"

mkdir -p "$VARIANT_DIR" "$LOG_DIR"

BAM_LIST=()

while read -r SAMPLE; do
  [ -z "$SAMPLE" ] && continue
  BAM_LIST+=("$ALIGN_DIR/${SAMPLE}_sorted.bam")
done < "$SAMPLES_FILE"

echo "Calling variants for group: $GROUP"
echo "Number of BAM files: ${#BAM_LIST[@]}"

bcftools mpileup -Ou -f "$REF_FASTA" "${BAM_LIST[@]}" \
2> "$LOG_DIR/${GROUP}_mpileup.log" | \
bcftools call -mv -Ov -o "$RAW_VCF" \
2> "$LOG_DIR/${GROUP}_bcftools_call.log"

bcftools filter -i "QUAL>$MIN_QUAL && DP>$MIN_DP" \
"$RAW_VCF" -Ov -o "$FILTERED_VCF" \
2> "$LOG_DIR/${GROUP}_bcftools_filter.log"
