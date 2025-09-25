#!/bin/bash
set -e

echo "📦 Checking build in debug..."
flutter build apk --debug

echo "⚡ Checking build in profile..."
flutter build apk --profile

echo "🚀 Checking build in release..."
flutter build apk --release

echo "✅ Build checks done!"
