- Important: do not use the `any` type when writing or editing code.
- Use `rm -f` to remove files. Normal `rm` and `yes | rm` won't work for you.
- We should never create barrel export files (IE, there should never be a file generated specifically to export imported variables from other files).

**Performance Rule**: If you can solve it in 1 CLI command, NEVER use multiple tool calls.

### Core BASH Tools (NO EXCEPTIONS)

# Pattern Search - USE 'rg' ONLY
rg -n "pattern" --glob '!node_modules/*'
rg -l "pattern"              # List matching files
rg -t py "pattern"           # Search Python files only

# File Finding - USE 'fd' ONLY
fd filename                  # Find by name
fd -e py                     # Find Python files
fd -H .env                   # Include hidden

# Bulk Operations - ONE command > many edits
rg -l "old" | xargs sed -i '' 's/old/new/g'

# Preview - USE 'bat'
bat -n filepath              # With line numbers
bat -r 10:50 file            # Lines 10-50

# JSON - USE 'jq'
jq '.dependencies | keys[]' package.json
