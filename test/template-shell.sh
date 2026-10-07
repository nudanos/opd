#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
# opd runs op-mode templates (on-enter, allowed) through a shell. They are
# written for bash -- ${var//x/y}, arrays such as COMP_WORDS=( ... ) -- and
# DANOS's image pointed /bin/sh at bash. Debian 13's /bin/sh is dash, which
# answers "opd: 1: Bad substitution", so opd must name bash itself.
set -eu
if grep -n '"sh", "-c"' cmd/opd/*.go | grep -v _test.go; then
    echo "template-shell: opd runs templates with sh (dash on Debian 13), not bash" >&2
    exit 1
fi
echo "template-shell: OK"
