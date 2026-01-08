# The TWRP maintainer patch.
#!/usr/bin/env bash
set -e

# Fail if DEVICE_PATH is not set
if [ -z "$DEVICE_PATH" ]; then
  echo "DEVICE_PATH is not set. Export DEVICE_PATH before running this script."
  exit 1
fi

DEVICE_DIR="${GITHUB_WORKSPACE}/TWRP/${DEVICE_PATH}"
BOARDCONFIG="${DEVICE_DIR}/BoardConfig.mk"

echo ">>> Device path: $DEVICE_DIR"
echo ">>> BoardConfig: $BOARDCONFIG"

# Check file exists
if [ ! -f "$BOARDCONFIG" ]; then
  echo "BoardConfig.mk not found!"
  exit 1
fi

# Remove any existing TW_DEVICE_VERSION line
sed -i '/^[[:space:]]*TW_DEVICE_VERSION[[:space:]]*:=[[:space:]]*.*/d' "$BOARDCONFIG"

# Add our version tag
echo 'TW_DEVICE_VERSION := -lyntax_' >> "$BOARDCONFIG"

echo "Done. Applied TW_DEVICE_VERSION := -lyntax_"
