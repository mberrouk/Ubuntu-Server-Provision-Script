#!/bin/bash

# Set transparency level (0 to 100)
TRANSPARENCY_LEVEL=$1

if [[ -z "$TRANSPARENCY_LEVEL" ]]; then
  echo "Usage: $0 <transparency-level>"
  echo "Transparency level should be between 0 (opaque) and 100 (fully transparent)."
  exit 1
fi

if [[ "$TRANSPARENCY_LEVEL" -lt 0 || "$TRANSPARENCY_LEVEL" -gt 100 ]]; then
  echo "Transparency level must be between 0 and 100."
  exit 1
fi

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ background-transparency-percent "$TRANSPARENCY_LEVEL"
