#!/bin/bash
set -e

REQUIRED_TOOLS=("curl" "tar")
NEWLEY_INSTALLED_TOOLS=()
APT_UPDATED=false

# Install the needed tools
setup() {
    for tool in "${REQUIRED_TOOLS[@]}"; do
        if ! dpkg -s "$tool" >/dev/null 2?&1; then
            echo "$tool is not installed. Installing..."

            if [ "$APT_UPDATED" = false ]; then
                apt-get update -y
                APT_UPDATED=true
            fi

        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends "$tool"
        NEWLY_INSTALLED_TOOLS+=("$tool")

        else
            echo "$tool is already installed."
        fi
    done
}

cleanup() {
    for tool in "${NEWLEY_INSTALLED_TOOLS[@]}"; do
        echo "Removing $tool"
        apt-get purge -y "$tool"
    done
}

install_argocd_autopilot() {

if [ -n "$VERSION" || "$VERSION" == "latest" ]; then
    VERSION=$(curl --silent "https://api.github.com/repos/argoproj-labs/argocd-autopilot/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
fi

# download and extract the binary
curl -L --output - https://github.com/argoproj-labs/argocd-autopilot/releases/download/$VERSION/argocd-autopilot-linux-amd64.tar.gz | tar zx

ls
# move the binary to your $PATH
mv ./argocd-autopilot-* /usr/local/bin/argocd-autopilot

# check the installation
argocd-autopilot version
}

setup
install_argocd_autopilot
cleanup
# apt-get update -y

# apt-get install -y curl tar

# get the latest version or change to a specific version
# LATEST=$(curl --silent "https://api.github.com/repos/argoproj-labs/argocd-autopilot/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

# # download and extract the binary
# curl -L --output - https://github.com/argoproj-labs/argocd-autopilot/releases/download/$VERSION/argocd-autopilot-linux-amd64.tar.gz | tar zx

# # move the binary to your $PATH
# mv ./argocd-autopilot-* /usr/local/bin/argocd-autopilot

# # check the installation
# argocd-autopilot version