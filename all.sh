#!/usr/bin/env bash

slides <(for f in [0-9]*.md; do cat "$f"; echo "---"; done)
