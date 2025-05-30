#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "is unminimize installed" bash -c "command -v unminimize &> /dev/null"
check "is man-db installed" bash -c "command -v man &> /dev/null"
check "ubuntu has been unminized" bash -c "man man | cat | grep -v 'This system has been minimized' &> /dev/null"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults