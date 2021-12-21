#!/bin/sh

# This script returns a CI service name based on the most recent commit. If we ever want to add a third
# service, we need to update the modulo on the line below.
case "$(( 0x$(git rev-parse HEAD | cut -c1) % 2 ))" in
  0) echo "circleci"
  ;;
  1) echo "github-actions"
  ;;
esac
