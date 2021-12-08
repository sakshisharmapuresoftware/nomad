#!/usr/bin/env bash

set -o errexit

# Make sure you grab the latest version
VERSION=0.56.0
if [ `uname -m` = "aarch64" ] ; then
  arch="aarch64";
else
  arch="x86_64";
fi
DOWNLOAD=https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-Linux-${arch}

function install() {
  if command -v buf >/dev/null; then
    if [ "${VERSION}" = "$(buf  --version)" ] ; then
      return
    fi
  fi

  # Download
  curl -sSL --fail "$DOWNLOAD" -o /tmp/buf

  # make executable
  chmod +x /tmp/buf

  # Move buf to /usr/bin
  mv /tmp/buf /usr/bin/buf
}

install
