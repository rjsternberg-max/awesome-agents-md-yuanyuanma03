#!/usr/bin/env bash
#
# amd — the AGENTS.md CLI: init / check
# Part of the AGENTS.md best-practices & template collection.
# Requires: bash 3.2+, grep, sed, awk, mktemp. No other dependencies.
#
set -euo pipefail

VERSION="0.1.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TPL_DIR="$ROOT_DIR/templates"
REMOTE_TPL_BASE="https://raw.githubusercontent.com/YuanyuanMa03/awesome-agents-md/main/templates"

ASSUME_YES=0

err() { printf 'amd: error: %s\n' "$*" >&2; exit 1; }
msg() { printf '%s\n' "$*"; }

usage() {
cat <<'EOF'
amd — the AGENTS.md CLI

Usage:
  amd init [options]      Generate an AGENTS.md in the current directory
  amd check [files...]    Lint rules file(s) (default: ./AGENTS.md)
  amd help                Show this help

init options:
  --lang <zh|en>          Template language (default: zh)
  --name <name>           Project name (default: current directory name)
  --with-pr-checklist     Always include the PR checklist section
  --yes, -y               Non-interactive: accept all defaults
  --force                 Overwrite an existing AGENTS.md

check detects:
  [FAIL]  a secret-looking string (AWS keys, tokens, private keys)
  [FAIL]  full indirection — a stub file that only says "read AGENTS.md"
  [FAIL]  missing file
  [WARN]  more than 500 lines (Cursor's guidance for rules files)
  [WARN]  no executable commands (commands are the most-referenced content)
  [WARN]  vague persona phrases ("you are a helpful ...")
  [WARN]  no explicit boundaries (Never / 🚫 / 绝不)

Exit code: non-zero if any check FAILs.
EOF
}

# ask VAR "prompt" "default" — reads one line; honors ASSUME_YES.
ask() {
  local __var=$1 __prompt=$2 __def=$3 __ans=''
  if [[ $ASSUME_YES -eq 1 ]]; then
    __ans=$__def
  else
    read -r -p "$__prompt [$__def]: " __ans || true
    if [[ -z $__ans ]]; then __ans=$__def; fi
  fi
  printf -v "$__var" '%s' "$__ans"
}

# ask_yn VAR "prompt" y|n — sets VAR to 1 (yes) or 0 (no).
ask_yn() {
  local __var=$1 __prompt=$2 __def=$3
  local __hint='Y/n'
  if [[ $__def == n ]]; then __hint='y/N'; fi
  local __ans=''
  if [[ $ASSUME_YES -eq 1 ]]; then
    __ans=$__def
  else
    read -r -p "$__prompt ($__hint): " __ans || true
    if [[ -z $__ans ]]; then __ans=$__def; fi
    case $__ans in
      y|Y|yes|Yes|YES) __ans=y ;;
      n|N|no|No|NO)    __ans=n ;;
      *) err "please answer y or n" ;;
    esac
  fi
  if [[ $__ans == y ]]; then
    printf -v "$__var" '%s' 1
  else
    printf -v "$__var" '%s' 0
  fi
}

# resolve_tpl_dir — pick the local templates/ dir, or fetch a standalone copy
# (needed when the script runs straight from curl, where BASH_SOURCE is a fd).
resolve_tpl_dir() {
  if [[ -d $TPL_DIR ]]; then return 0; fi
  if ! command -v curl >/dev/null 2>&1; then
    err "templates not found next to the script and curl is unavailable — clone the repo instead: git clone https://github.com/YuanyuanMa03/awesome-agents-md.git"
  fi
  local tmp f
  tmp="$(mktemp -d)"
  for f in project.zh.md project.en.md snippets.zh.md snippets.en.md; do
    curl -fsSL "$REMOTE_TPL_BASE/$f" -o "$tmp/$f" \
      || err "failed to fetch template: $REMOTE_TPL_BASE/$f"
  done
  TPL_DIR="$tmp"
}

# esc_sed STRING — escape characters that are special inside s|...|...|.
esc_sed() {
  local s=$1
  s=${s//\\/\\\\}
  s=${s//&/\\&}
  s=${s//|/\\|}
  printf '%s' "$s"
}

# extract_section <lang> <Heading> — print one "## Heading" section from snippets.<lang>.md
extract_section() {
  local file="$TPL_DIR/snippets.$1.md"
  local section="$2"
  if [[ ! -f $file ]]; then err "snippets file not found: $file"; fi
  awk -v sec="## $section" '
    $0 == sec { found = 1 }
    found && /^## / && $0 != sec { exit }
    found { print }
  ' "$file"
}

append_section() { # append_section <outfile> <lang> <Heading>
  local out=$1 lang=$2 heading=$3 sec
  sec="$(extract_section "$lang" "$heading")"
  if [[ -z $sec ]]; then err "snippet '$heading' not found in snippets.$lang.md"; fi
  printf '\n%s\n' "$sec" >> "$out"
}

cmd_init() {
  local lang=zh name='' force=0 with_pr=0
  while [[ $# -gt 0 ]]; do
    case $1 in
      --lang)  [[ $# -ge 2 ]] || err "--lang requires a value"; lang=$2;  shift 2 ;;
      --name)  [[ $# -ge 2 ]] || err "--name requires a value"; name=$2;  shift 2 ;;
      --force) force=1;  shift ;;
      --with-pr-checklist) with_pr=1; shift ;;
      --yes|-y) ASSUME_YES=1; shift ;;
      *) err "unknown option for init: $1" ;;
    esac
  done
  case $lang in
    zh|en) ;;
    *) err "--lang must be zh or en" ;;
  esac

  resolve_tpl_dir

  local base="$TPL_DIR/project.$lang.md"
  if [[ ! -f $base ]]; then err "base template not found: $base"; fi
  if [[ -f AGENTS.md && $force -ne 1 ]]; then
    err "AGENTS.md already exists here (use --force to overwrite)"
  fi

  local dir_name
  dir_name="$(basename "$PWD")"

  local tech fast test lint build
  ask name  'Project name'                      "${name:-$dir_name}"
  ask tech  'Tech stack (with versions)'        'Node.js 20 + TypeScript 5'
  ask fast  'Fast check command'                'npx tsc --noEmit'
  ask test  'Test command'                      'npm test'
  ask lint  'Lint / format command'             'npm run lint'
  ask build 'Build command (slow, on demand)'   'npm run build'

  local want_boundaries want_testing want_pr=$with_pr
  ask_yn want_boundaries 'Include Boundaries section' y
  ask_yn want_testing    'Include Testing rules'      y
  if [[ $with_pr -ne 1 ]]; then
    ask_yn want_pr 'Include PR checklist section' n
  fi

  local out
  out="$(mktemp)"
  # The EXIT trap runs after this function returns and locals are gone,
  # so the expansion must tolerate an unset variable.
  trap 'rm -f "${out:-}" 2>/dev/null || true' EXIT

  sed \
    -e "s|{{PROJECT_NAME}}|$(esc_sed "$name")|g"   \
    -e "s|{{TECH_STACK}}|$(esc_sed "$tech")|g"     \
    -e "s|{{FAST_CMD}}|$(esc_sed "$fast")|g"       \
    -e "s|{{TEST_CMD}}|$(esc_sed "$test")|g"       \
    -e "s|{{LINT_CMD}}|$(esc_sed "$lint")|g"       \
    -e "s|{{BUILD_CMD}}|$(esc_sed "$build")|g"     \
    "$base" > "$out"

  if [[ $want_boundaries -eq 1 ]]; then append_section "$out" "$lang" 'Boundaries'; fi
  if [[ $want_testing    -eq 1 ]]; then append_section "$out" "$lang" 'Testing';    fi
  if [[ $want_pr         -eq 1 ]]; then append_section "$out" "$lang" 'PR Checklist'; fi

  mv "$out" AGENTS.md
  msg "Created $(pwd)/AGENTS.md (lang=$lang)"
  msg "Next: review it, commit it — and add a rule whenever the agent makes"
  msg "the same mistake twice. Run 'amd check' any time to lint it."
}

cmd_check() {
  local files=("$@")
  if [[ ${#files[@]} -eq 0 ]]; then files=(AGENTS.md); fi
  local fails=0 warns=0 total=0

  local f lines
  for f in "${files[@]}"; do
    total=$((total + 1))
    if [[ ! -f $f ]]; then
      printf 'FAIL  %s: file not found\n' "$f"
      fails=$((fails + 1))
      continue
    fi
    lines=$(wc -l < "$f" | tr -d '[:space:]')

    # [FAIL] secrets — the most serious problem a rules file can have.
    if grep -Eq '(AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{20,}|gho_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,}|-----BEGIN [A-Z ]*PRIVATE KEY-----|xox[baprs]-[A-Za-z0-9-]{10,})' "$f"; then
      printf 'FAIL  %s: looks like it contains a secret — remove it and rotate the credential now\n' "$f"
      fails=$((fails + 1))
    fi

    # [FAIL] full indirection — a stub that only redirects to another file.
    if [[ $lines -lt 15 ]]; then
      if grep -Eiq '(read|see|follow|strictly|参见|遵循|去看).*(agents\.md|claude\.md)' "$f"; then
        printf 'FAIL  %s: full indirection — %s lines that only point at another rules file; agents ignore redirected rules\n' "$f" "$lines"
        fails=$((fails + 1))
        continue
      fi
    fi

    # [WARN] length.
    if [[ $lines -gt 500 ]]; then
      printf 'WARN  %s: %s lines — Cursor guidance says keep rules under 500; every line costs context\n' "$f" "$lines"
      warns=$((warns + 1))
    fi

    # [WARN] executable commands.
    if ! grep -Eq '(npm |pnpm |yarn |bun |npx |uv run|pytest|make |cargo |go (build|test|vet)|gradle|mvn |tsc |eslint|prettier|ruff|mypy|golangci-lint)' "$f"; then
      printf 'WARN  %s: no executable commands found — commands are the most-referenced part of a rules file\n' "$f"
      warns=$((warns + 1))
    fi

    # [WARN] vague persona / advice phrases.
    if grep -Eiq '(you are a helpful|do your best|write clean code|你是一个乐于助人|请写干净的代码|尽力而为)' "$f"; then
      printf 'WARN  %s: vague persona phrases found — replace with specific, checkable rules\n' "$f"
      warns=$((warns + 1))
    fi

    # [WARN] explicit boundaries.
    if ! grep -Eq '(Never|never|🚫|绝不|禁止)' "$f"; then
      printf 'WARN  %s: no explicit boundaries (Never / 🚫 / 绝不) — consider a ✅/⚠️/🚫 section\n' "$f"
      warns=$((warns + 1))
    fi
  done

  printf -- '----\n%d file(s) checked: %d fail, %d warn\n' "$total" "$fails" "$warns"
  if [[ $fails -gt 0 ]]; then
    exit 1
  fi
  exit 0
}

main() {
  if [[ $# -eq 0 ]]; then
    usage >&2
    exit 1
  fi
  local cmd=$1
  shift
  case $cmd in
    init)  cmd_init "$@" ;;
    check) cmd_check "$@" ;;
    help|-h|--help) usage ;;
    version|-v|--version) msg "amd $VERSION" ;;
    *) err "unknown command '$cmd' — try: amd help" ;;
  esac
}

main "$@"
