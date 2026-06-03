# Mapular Homebrew Tap

Homebrew tap for the [Mapular](https://mapular.com) CLI — AI-powered location intelligence platform.

## Install

```sh
brew tap mapular/tap
brew install mapular
```

## What gets installed

| Command | Description |
|---------|-------------|
| `mapular` | Main CLI — login, status, and MCP server setup |
| `mapular-admin-mcp` | Admin MCP server for use with Claude Code |

Both are thin shims that delegate to `uvx` at runtime, so they always run the pinned version without polluting your Python environment.

## Usage

```sh
# Authenticate
mapular login

# Check connection
mapular whoami
mapular status

# Set up MCP servers in a project directory
cd your-project
mapular install
```

`mapular install` writes a `.mcp.json` and registers the MCP servers in `~/.claude.json` so they appear automatically in Claude Code.

## Requirements

- [uv](https://docs.astral.sh/uv/) (installed automatically as a dependency)
- Python 3.11+

## Updating

```sh
brew update && brew upgrade mapular
```

## More

- Docs: [mapular.com](https://mapular.com)
- Issues: [mapular/homebrew-tap](https://github.com/mapular/homebrew-tap/issues)
