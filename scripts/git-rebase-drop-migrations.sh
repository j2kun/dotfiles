#!/bin/bash

for sha in $(git log --format=format:"%H %s" master..HEAD | grep -E "migration" | cut -d " " -f 1)
do
  sed -i.bak "s/pick ${sha:0:7}/drop ${sha:0:7}/" $@
done
