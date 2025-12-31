# Pokemon Crystal Catalan Translation

## Project Arktosmos - Git SSH Configuration

### SSH Key Setup

This repository is configured to use the project-arktosmos SSH key for all git operations.

**Key location:** `~/.ssh/id_ed25519_arktosmos`
**GitHub identity:** `project-arktosmos`

### Configuration

The repo-local git config has been set to use the arktosmos key and identity:

```bash
# SSH key for push/pull authentication
git config core.sshCommand "ssh -i ~/.ssh/id_ed25519_arktosmos"

# Git author identity for commits
git config user.name "project-arktosmos"
git config user.email "projectarktosmos@gmail.com"
```

### Committing and Pushing

Standard git workflow works automatically with the correct identity:

```bash
# Stage changes
git add .

# Commit
git commit -m "Your commit message"

# Push (uses arktosmos key automatically)
git push origin main
```

### Manual SSH Key Usage

If you need to explicitly use the arktosmos key for a one-off command:

```bash
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_arktosmos" git push origin main
```

### Verifying Identity

To confirm which GitHub identity the key authenticates as:

```bash
ssh -i ~/.ssh/id_ed25519_arktosmos -T git@github.com
```

Expected output: `Hi project-arktosmos! You've successfully authenticated...`

### Troubleshooting

If authentication fails, clear the SSH agent cache and retry:

```bash
ssh-add -D
ssh -i ~/.ssh/id_ed25519_arktosmos -T git@github.com
```

---

This is a Catalan translation of Pokemon Crystal (pokecrystal disassembly).

## Build Instructions

```bash
make clean && make -j4
```

The output ROM is `pokemon-cristall.gbc`.

## Translation Guidelines

### Language
- Use **IEC standard Catalan** (neutral dialect, not Valencian or Balearic specific)
- Keep **Pokemon names in English** (e.g., PIKACHU, BULBASAUR)
- Keep **move names in English** unless they have official Catalan translations
- Keep **item names in English** unless commonly translated

### Text Constraints
- **Maximum 18 visible characters per line** - the textbox cannot display more
- Use the `tools/fix_line_lengths.py` script to automatically fix violations

### Text Directives
- `text` - Start new textbox, place on top line
- `line` - Place on bottom line (line 2)
- `cont` - Scroll up, place on bottom line
- `para` - Clear textbox, place on top line
- `done` / `prompt` - End text

Proper sequence: `text` → `line` → `cont` → `cont` ...
After `para`: `para` → `line` → `cont` → `cont` ...

### Control Codes (expand to visible text)
- `#` → "POKé" (4 chars)
- `<PLAYER>` / `<PLAY_G>` → Player name (max 7 chars)
- `<RIVAL>` → Rival name (max 7 chars)
- `<USER>` / `<TARGET>` → Pokemon name (max 10 chars)
- `@` → String terminator (not visible)

### Line Length Fix Script

After translating, run:
```bash
python3 tools/fix_line_lengths.py --dry-run   # Preview changes
python3 tools/fix_line_lengths.py --apply     # Apply fixes
```

The script:
- Scans all text files for lines > 18 visible characters
- Automatically wraps long lines with correct directives
- Handles control codes and variables correctly
- Fixes `line` → `cont` directive sequences

## File Locations

### Core Text Files
- `data/text/common_1.asm` - Common text (Oak intro, etc.)
- `data/text/common_2.asm` - Common text continued
- `data/text/common_3.asm` - Common text continued
- `data/text/std_text.asm` - Standard text strings
- `data/text/battle.asm` - Battle text

### Menus & UI
- `engine/menus/main_menu.asm` - Main menu strings
- `engine/menus/init_gender.asm` - Boy/Girl selection
- `engine/rtc/timeset.asm` - Clock setting screen
- `home/menu.asm` - YES/NO menu

### Game Content
- `maps/*.asm` - Map dialogue and scripts
- `data/phone/text/*.asm` - Phone call text
- `data/pokemon/dex_entries/*.asm` - Pokedex entries
- `data/items/descriptions.asm` - Item descriptions
- `data/moves/descriptions.asm` - Move descriptions
- `data/battle_tower/trainer_text.asm` - Battle Tower trainer text

### Names
- `data/items/names.asm` - Item names
- `data/moves/names.asm` - Move names
- `data/trainers/class_names.asm` - Trainer class names
- `data/types/names.asm` - Type names

### Character Map
- `constants/charmap.asm` - Character encoding (includes Catalan accented chars)
- `gfx/font/font.png` - Font graphics

## Catalan Characters Available
The font supports: à, è, ò, í, ú, é, ó, ç, ï, ü, ·

## Git Workflow

Commit after each significant change:
```bash
git add -A
git commit -m "Translate [component]: [brief description]"
```

Do NOT push without explicit permission.

## Current Translation Status

### Completed
- Main menu (CONTINUAR, PARTIDA NOVA, OPCIONS)
- Gender selection (Noi/Noia)
- Clock setting (day names, time of day)
- YES/NO → SÍ/NO
- Oak intro text (partial)
- Pokedex entries (all 251)
- Item names, move names, type names, trainer classes

### In Progress
- Map dialogue
- Phone call text
- Battle Tower text
- Common text files
