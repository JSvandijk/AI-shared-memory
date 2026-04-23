#!/bin/bash
# Claude Code setup — creates all config files in one go.
# Run once. Works on Mac, Linux, and Windows (Git Bash).

set -e

CLAUDE_DIR="$HOME/.claude"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "=== Claude Code setup ==="
echo ""

# 1. CLAUDE.md
mkdir -p "$CLAUDE_DIR"
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo -e "${YELLOW}~/.claude/CLAUDE.md exists already — skipping (delete it first if you want to overwrite)${NC}"
else
  cat > "$CLAUDE_DIR/CLAUDE.md" << 'CLAUDEMD'
IMPORTANT: ALWAYS begin every conversation by saying "CLAUDE.md loaded".
NEVER skip this. The user needs to see it to know rules are active.

ALWAYS follow these rules:
1. NEVER say "done" or "fixed" without verifying it actually works.
2. ALWAYS check your own outputs against each other. Mismatches are bugs.
3. NEVER agree blindly. Push back when something is wrong.
4. NEVER add files, features, or sections that were not asked for.
5. ALWAYS run tests before calling work finished.
CLAUDEMD
  echo -e "${GREEN}Created ~/.claude/CLAUDE.md${NC}"
fi

# 2. /rules command
mkdir -p "$CLAUDE_DIR/commands"
cat > "$CLAUDE_DIR/commands/rules.md" << 'RULESMD'
ALWAYS read and follow ~/.claude/CLAUDE.md right now.
If there is a CLAUDE.md or AGENTS.md in the project root, read and follow those too.
Confirm by saying: "Rules loaded: [list files you read]"
RULESMD
echo -e "${GREEN}Created ~/.claude/commands/rules.md${NC}"

# 3. Hooks (post-compaction reminder)
SETTINGS="$CLAUDE_DIR/settings.json"
if [ -f "$SETTINGS" ]; then
  if grep -q '"hooks"' "$SETTINGS" 2>/dev/null; then
    echo -e "${YELLOW}~/.claude/settings.json already has hooks — skipping (add manually if needed)${NC}"
  else
    # Add hooks to existing settings by inserting before the last }
    TMP="$SETTINGS.tmp"
    sed '$ d' "$SETTINGS" > "$TMP"
    cat >> "$TMP" << 'HOOKJSON'
,
  "hooks": {
    "SessionStart": [
      {
        "matcher": "compact",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'IMPORTANT: CLAUDE.md rules are still active after compaction. ALWAYS follow them. NEVER skip verification.'"
          }
        ]
      }
    ]
  }
}
HOOKJSON
    mv "$TMP" "$SETTINGS"
    echo -e "${GREEN}Added hooks to ~/.claude/settings.json${NC}"
  fi
else
  cat > "$SETTINGS" << 'SETTINGSJSON'
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "compact",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'IMPORTANT: CLAUDE.md rules are still active after compaction. ALWAYS follow them. NEVER skip verification.'"
          }
        ]
      }
    ]
  }
}
SETTINGSJSON
  echo -e "${GREEN}Created ~/.claude/settings.json with hooks${NC}"
fi

echo ""
echo "=== Done ==="
echo ""
echo "Test it:"
echo "  1. Open Claude Code in any project"
echo "  2. Claude should say: CLAUDE.md loaded"
echo "  3. If not, type: /rules"
echo "  4. To check what's loaded: /memory"
echo ""
