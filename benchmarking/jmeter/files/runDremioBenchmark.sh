#!/bin/bash

mkdir -p /mnt/test-data/results

echo "First Run"

jmeter -n -t /mnt/test-plan/DremioTestPlanTPC-DS-metadatarefresh.jmx

jmeter -n -t /mnt/test-plan/DremioTestPlanTPC-DS.jmx

mv DremioSummary-tpc-ds.csv /mnt/test-data/results/dremio-tpc-ds-cold.csv

echo "Second Run"

jmeter -n -t /mnt/test-plan/DremioTestPlanTPC-DS.jmx

mv DremioSummary-tpc-ds.csv /mnt/test-data/results/dremio-tpc-ds-warm.csv

echo "Done"
