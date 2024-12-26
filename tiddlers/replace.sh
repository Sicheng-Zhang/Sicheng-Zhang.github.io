#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sed -i "s/Back to \[\[Recipe\]\]/Back to \[\[Recipe\]\] \&emsp; /g" *.tid

