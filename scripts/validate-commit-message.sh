#!/bin/sh

commit_msg="$1"

pattern='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([a-z0-9._/-]+\))?(!)?: .+'

if ! printf '%s\n' "$commit_msg" | grep -Eq "$pattern"; then
    echo "ERROR: Invalid commit message."
    echo ""
    echo "Expected format:"
    echo "  type(scope): description"
    echo ""
    echo "Examples:"
    echo "  feat(terraform): initialize infrastructure"
    echo "  fix(airflow): resolve scheduler startup"
    echo "  docs: update README"
    exit 1
fi

exit 0