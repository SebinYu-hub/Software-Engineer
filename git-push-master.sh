#!/bin/bash

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get current branch name
current_branch=$(git branch --show-current)

echo -e "${GREEN}Current branch: $current_branch${NC}"

# Check if there are any changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}No changes to commit!${NC}"
    exit 0
fi

# Add all changes to git
echo -e "\n${GREEN}Adding all changes...${NC}"
git add .

# Define commit types
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

# Show commit type options
echo -e "\n${GREEN}Select commit type:${NC}"
echo "1. FEAT - New feature"
echo "2. FIX - Bug fix"
echo "3. BUILD - Changes to build files"
echo "4. CHORE - Other minor changes"
echo "5. CI - Changes to CI configuration"
echo "6. DOCS - Documentation changes"
echo "7. STYLE - Code style or formatting"
echo "8. REFACTOR - Code refactoring"
echo "9. TEST - Test code changes"
echo "10. PERF - Performance improvement"
read -r selection

# Validate selection
if ! [[ "$selection" =~ ^[1-9]|10$ ]]; then
    echo -e "${RED}Invalid selection. Please choose a number between 1 and 10.${NC}"
    exit 1
fi

# Get commit type
commit_type="${commit_types[$((selection-1))]}"

# Check and switch input method for Korean users
current_input=$(defaults read com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)
if [[ $current_input == "com.apple.keylayout.2SetHangul" ]]; then
    osascript -e 'tell application "System Events" to keystroke space using {control down}'
    echo -e "${GREEN}Switched to English input${NC}"
fi

# Get commit message
echo -e "\n${GREEN}Enter commit message:${NC}"
read -r commit_message

# Create full commit message and commit
commit_message="[$commit_type] $commit_message"
echo -e "\n${GREEN}Committing with message: ${NC}$commit_message"
git commit -m "$commit_message"

# Fetch latest master
echo -e "\n${GREEN}Fetching latest master...${NC}"
git fetch origin master

# Check if local master is behind remote
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo -e "\n${GREEN}Local master is up to date${NC}"
elif [ $LOCAL = $BASE ]; then
    echo -e "\n${RED}Local master is behind remote. Please pull first.${NC}"
    exit 1
fi

# Push to master
echo -e "\n${GREEN}Pushing to master...${NC}"
git push origin master

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}✅ Successfully pushed to master!${NC}"
else
    echo -e "\n${RED}❌ Failed to push to master.${NC}"
    echo -e "${YELLOW}Please pull latest changes and try again:${NC}"
    echo -e "git pull origin master"
    exit 1
fi 