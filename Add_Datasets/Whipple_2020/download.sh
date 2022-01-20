#!/bin/bash
for f in `tail -n+2 SraRunTable.txt | cut -d, -f1`; do
  if ls $f*.fastq.gz 1> /dev/null 2>&1; then
    echo "$f already found"
  else
    fasterq-dump $f --skip-technical --split-files -p && gzip $f*.fastq
  fi
done

