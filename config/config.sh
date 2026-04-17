#!/bin/bash

# Base project directory
PROJECT_DIR="$HOME/projects/bioinfo/brassica"

# Project / species
GROUP="B_rapa"
SAMPLES_FILE="$PROJECT_DIR/config/B_rapa_samples.txt"

#GROUP="B_oleracea"
#SAMPLES_FILE="$PROJECT_DIR/config/B_oleracea_samples.txt"

# Directories
DATA_DIR="$PROJECT_DIR/data"
RAW_DIR="$DATA_DIR/raw"
TRIM_DIR="$DATA_DIR/trimmed"
REF_DIR="$PROJECT_DIR/ref"
RESULTS_DIR="$PROJECT_DIR/results"
QC_DIR="$RESULTS_DIR/qc"
ALIGN_DIR="$RESULTS_DIR/alignments"
VARIANT_DIR="$RESULTS_DIR/variants"
LOG_DIR="$RESULTS_DIR/logs"
SCRIPT_DIR="$PROJECT_DIR/scripts"

# Reference genome
REF_FASTA="$REF_DIR/GCF_000309985.2_CAAS_Brap_v3.01_genomic.fna"

#REF_FASTA="$REF_DIR/GCF_000695525.1_BOL_genomic.fna"

# Variant outputs
RAW_VCF="$VARIANT_DIR/${GROUP}.raw.vcf"
FILTERED_VCF="$VARIANT_DIR/${GROUP}.filtered.vcf"
SUMMARY_TXT="$VARIANT_DIR/${GROUP}.variant_summary.txt"
RAW_STATS="$VARIANT_DIR/${GROUP}.raw_stats.txt"
FILTERED_STATS="$VARIANT_DIR/${GROUP}.filtered_stats.txt"

# Filtering parameters
MIN_QUAL=20
MIN_DP=10
MIN_LENGTH=50
