#!/bin/bash
set -e

echo "🧹 Fixing lints & formatting..."
dart fix --apply
dart format lib test
flutter analyze
