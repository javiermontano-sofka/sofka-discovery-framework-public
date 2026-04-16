# Example: MOAT Directory Build Output

## Input

Skill: `validate-csv` with Deep MOAT allocation

## Expected Output — Generated Files

```
skills/validate-csv/
  SKILL.md                          # (already exists)
  references/
    csv-rfc-4180.md                 # CSV format specification digest
    encoding-detection-guide.md     # UTF-8, Latin-1, BOM handling
  examples/
    valid-csv.md                    # Clean CSV input + expected output
    invalid-csv.md                  # Malformed CSV + expected error report
    edge-case-csv.md                # Empty file, single column, 100K rows
  prompts/
    validation-prompt.md            # Reusable NL-HP prompt template
```

## Sample Reference File Content

```markdown
# CSV RFC 4180 Digest

> Key rules for CSV validation per RFC 4180.

1. Each record is on a separate line, delimited by CRLF
2. The last record may or may not have a CRLF
3. An optional header line with the same format as records
4. Fields may be enclosed in double quotes
5. Fields containing CRLF, double quotes, or commas MUST be enclosed in double quotes
6. Double quotes inside fields are escaped by doubling: ""
```
