# Brassica SNP Pipeline

Pipeline reproductible pour l’analyse de données NGS (paired-end) chez *Brassica*, depuis les reads bruts (FASTQ) jusqu’à l’identification de variants (SNP/INDEL).

---

## Objectif

Ce pipeline permet de :

* Réaliser le contrôle qualité et le trimming des reads
* Aligner les reads sur un génome de référence
* Appeler les variants (SNP/INDEL)
* Filtrer et résumer les variants
* Produire un VCF multi-individus exploitable en génétique quantitative

---

## Organisation du projet

```
Brassica_snp_pipeline/
├── config/
│   ├── config.sh
│   ├── B_rapa_samples.txt
│   ├── B_oleracea_samples.txt
│   └── PRJNA929712_reads.tsv
├── data/
│   ├── raw/         # FASTQ bruts
│   └── trimmed/     # FASTQ après trimming
├── ref/             # Génomes de référence
├── results/
│   ├── qc/          # Rapports qualité (fastp)
│   ├── alignments/  # Fichiers BAM
│   ├── variants/    # VCF et stats
│   └── logs/        # Logs d’exécution
├── scripts/
│   ├── 01_trim.sh
│   ├── 02_align.sh
│   ├── 03_variant_calling.sh
│   ├── 04_variant_stats.sh
│   └── run_pipeline.sh
└── .gitignore
```

---

## Prérequis

Outils nécessaires :

* fastp
* bwa
* samtools
* bcftools
* wget

Installation (Ubuntu / Codespaces) :

```
sudo apt update
sudo apt install -y fastp bwa samtools bcftools wget
```

---

## Données d’entrée

* FASTQ paired-end : `data/raw/SRRXXXXXXX_1.fastq.gz` et `_2.fastq.gz`
* Fichier d’échantillons : `config/B_rapa_samples.txt`
* Génome de référence : `ref/*.fna`

---

## Configuration

Dans `config/config.sh` :

* définir le groupe (ex : `B_rapa`)
* définir le fichier de samples
* définir le génome de référence

---

## Lancer le pipeline

Depuis la racine du projet :

```
chmod +x scripts/*.sh
./scripts/run_pipeline.sh
```

---

## Sorties principales

Dans `results/variants/` :

* `B_rapa.raw.vcf`
* `B_rapa.filtered.vcf`
* `B_rapa.variant_summary.txt`

---

## Bonnes pratiques

* Tester d’abord sur une seule accession
* Utiliser des FASTQ compressés (.gz)
* Ne pas versionner les données brutes ou intermédiaires
* Vérifier les logs en cas d’erreur

---

## Perspectives

Ce pipeline constitue une base pour :

* Analyse de diversité génétique (PCA)
* Structure de population
* GWAS (si phénotypes disponibles)
* Identification de loci de résistance

---

## Auteur

Projet développé dans le cadre d’un travail en génétique quantitative des plantes et analyse NGS.
