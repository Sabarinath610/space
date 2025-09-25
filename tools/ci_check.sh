#!/bin/bash
set -e

echo "⚙️ Running CI checks..."
./tools/dev_check.sh
./tools/test_all.sh
./tools/build_check.sh
echo "✅ CI checks passed!"
