#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

MODE="${1:---aab}"    # --aab (default) or --apk
CLEAN="${2:---clean}" # or --no-clean

echo "=> size_report.sh starting"
echo "Working directory: $(pwd)"
echo "Flutter version:"
flutter --version || { echo "Flutter not on PATH"; exit 1; }

if [ "$CLEAN" != "--no-clean" ]; then
  echo "Cleaning previous build artifacts..."
  flutter clean || echo "flutter clean failed (not fatal)"
fi

echo "Running flutter pub get..."
flutter pub get || { echo "flutter pub get failed"; exit 1; }

if [ "$MODE" = "--apk" ]; then
  echo "Building single-ABI APK for size analysis (android-arm64)..."
  # NOTE: analyze-size requires a single target platform; choose one below
  flutter build apk --release --target-platform=android-arm64 --analyze-size || { echo "flutter build apk failed"; exit 1; }
else
  echo "Building AAB for size analysis..."
  flutter build appbundle --release --analyze-size || { echo "flutter build appbundle failed"; exit 1; }
fi

REPORT_DIR="build/flutter-analysis-size"
if [ -d "$REPORT_DIR" ]; then
  echo "Size analysis generated at: $REPORT_DIR"
  echo "Files:"
  ls -la "$REPORT_DIR"
  HTML_FILE="$(find "$REPORT_DIR" -name '*.html' | head -n1 || true)"
  JSON_FILE="$(find "$REPORT_DIR" -name '*.json' | head -n1 || true)"
  echo "HTML: $HTML_FILE"
  echo "JSON: $JSON_FILE"
  if [ -n "$HTML_FILE" ]; then
    echo "Open the HTML file to inspect the breakdown (macOS):"
    echo "  open \"$HTML_FILE\""
  fi
  exit 0
else
  echo "ERROR: size analysis folder not found: $REPORT_DIR"
  exit 1
fi
