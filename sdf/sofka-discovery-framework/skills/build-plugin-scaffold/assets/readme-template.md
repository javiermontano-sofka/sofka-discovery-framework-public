# {Plugin Name}

{Plugin description in 1-2 sentences.}

## Installation

Install this plugin in Claude Code:

```bash
claude plugin add {plugin-path-or-url}
```

Or clone and link locally:

```bash
git clone {repository-url}
cd {plugin-name}
claude plugin link .
```

## Usage

```bash
# Most common commands
/{prefix}:{primary-command}     # {description}
/{prefix}:{secondary-command}   # {description}
/{prefix}:menu                  # Show all available commands
```

## Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/{prefix}:{command-1}` | `/{prefix}:{alias-1}` | {description} |
| `/{prefix}:{command-2}` | `/{prefix}:{alias-2}` | {description} |

## Skills

| Skill | Purpose |
|-------|---------|
| `{skill-1}` | {purpose} |
| `{skill-2}` | {purpose} |

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run `/{prefix}:validate` on your changes
5. Submit a pull request

## License

{License type}. See [LICENSE](LICENSE) for details.
