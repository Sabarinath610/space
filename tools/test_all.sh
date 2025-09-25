#!/bin/bash
set -e

echo "🧪 Running all tests..."
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
echo "✅ Tests complete. Open coverage/html/index.html in browser."
