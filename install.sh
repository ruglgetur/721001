#!/usr/bin/env bash
set -euo pipefail

# Installer for huashu-design Claude Code skill
# Source: https://github.com/alchaincyf/huashu-design

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info()    { echo -e "${CYAN}[huashu-design]${NC} $*"; }
success() { echo -e "${GREEN}[huashu-design]${NC} $*"; }
warn()    { echo -e "${YELLOW}[huashu-design]${NC} $*"; }
error()   { echo -e "${RED}[huashu-design]${NC} $*" >&2; }

# ── Prerequisite: Node.js ────────────────────────────────────────────────────
if ! command -v node &>/dev/null; then
  error "Node.js is required but was not found."
  error "Install it from https://nodejs.org/ and re-run this script."
  exit 1
fi

NODE_MAJOR=$(node -e 'process.stdout.write(process.versions.node.split(".")[0])')
if [ "$NODE_MAJOR" -lt 18 ]; then
  warn "Node.js v${NODE_MAJOR} detected. v18 or newer is recommended."
fi

# ── Prerequisite: npx ───────────────────────────────────────────────────────
if ! command -v npx &>/dev/null; then
  error "npx is required but was not found (it ships with npm ≥ 5.2)."
  error "Upgrade npm with: npm install -g npm"
  exit 1
fi

info "Installing huashu-design skill via npx skills..."
echo

npx skills add alchaincyf/huashu-design --yes

echo
success "huashu-design installed successfully."
success "Restart Claude Code (or any supported agent) to activate the skill."
echo
info "Skill source : https://github.com/alchaincyf/huashu-design"
info "Usage docs   : https://github.com/alchaincyf/huashu-design/blob/master/README.md"
