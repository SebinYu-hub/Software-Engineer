#!/bin/bash

# Add all changes to git
git add .

# Define commit types (using regular arrays)
commit_types=(
    "FEAT"
    "FIX"
    "BUILD"
    "CHORE"
    "CI"
    "DOCS"
    "STYLE"
    "REFACTOR"
    "TEST"
    "PERF"
)

echo "Select commit type:"
echo "1. FEAT - New feature"
echo "2. FIX - Bug fix"
echo "3. BUILD - Changes to build files / module installation or deletion"
echo "4. CHORE - Other minor changes"
echo "5. CI - Changes to CI configuration"
echo "6. DOCS - Documentation changes"
echo "7. STYLE - Code style or formatting"
echo "8. REFACTOR - Code refactoring"
echo "9. TEST - Test code changes"
echo "10. PERF - Performance improvement"
read -r selection

# Arrays in bash are 0-based
commit_type="${commit_types[$((selection-1))]}"

# Check and switch input method
current_input=$(defaults read com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID)
if [[ $current_input == "com.apple.keylayout.2SetHangul" ]]; then
    osascript -e 'tell application "System Events" to keystroke space using {control down}'
    echo "Switched to English input"
fi

echo "Enter commit message:"
read -r commit_message

commit_message="[$commit_type] $commit_message"
git commit -m "$commit_message"


