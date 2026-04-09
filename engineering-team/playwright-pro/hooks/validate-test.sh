#!/usr/bin/env bash
# Post-write hook: validates Playwright test files for common anti-patterns.
# Runs silently â€” only outputs warnings if issues found.
# Input: JSON on stdin with tool_input.file_path

set -euo pipefail

# Read the file path from stdin JSON
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    print(data.get('tool_input', {}).get('file_path', ''))
except:
    print('')
" 2>/dev/null || echo "")

# Only check .spec.ts and .spec.js files
if [[ ! "$FILE_PATH" =~ \.(spec|test)\.(ts|js|mjs)$ ]]; then
    exit 0
fi

# Check if file exists
if [[ ! -f "$FILE_PATH" ]]; then
    exit 0
fi

WARNINGS=""

# Check for waitForTimeout
if grep -n 'waitForTimeout' "$FILE_PATH" >/dev/null 2>&1; then
    LINES=$(grep -n 'waitForTimeout' "$FILE_PATH" | head -3)
    WARNINGS="${WARNINGS}\nâš ï¸  waitForTimeout() found â€” use web-first assertions instead:\n${LINES}\n"
fi

# Check for non-web-first assertions
if grep -n 'expect(await ' "$FILE_PATH" >/dev/null 2>&1; then
    LINES=$(grep -n 'expect(await ' "$FILE_PATH" | head -3)
    WARNINGS="${WARNINGS}\nâš ï¸  Non-web-first assertion â€” use expect(locator) instead:\n${LINES}\n"
fi

# Check for hardcoded localhost URLs
if grep -n "http://localhost\|https://localhost\|http://127.0.0.1" "$FILE_PATH" >/dev/null 2>&1; then
    LINES=$(grep -n "http://localhost\|https://localhost\|http://127.0.0.1" "$FILE_PATH" | head -3)
    WARNINGS="${WARNINGS}\nâš ï¸  Hardcoded URL â€” use baseURL from config:\n${LINES}\n"
fi

# Check for page.$() usage
if grep -n 'page\.\$(' "$FILE_PATH" >/dev/null 2>&1; then
    LINES=$(grep -n 'page\.\$(' "$FILE_PATH" | head -3)
    WARNINGS="${WARNINGS}\nâš ï¸  page.\$() is deprecated â€” use page.locator() or getByRole():\n${LINES}\n"
fi

# Output warnings if any found
if [[ -n "$WARNINGS" ]]; then
    echo -e "\nðŸŽ­ Playwright Pro â€” Test Validation${WARNINGS}"
fi

