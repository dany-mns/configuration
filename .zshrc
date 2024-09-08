function new_git_tag() {
    # Get the latest tag
    latestTag=$(git describe --tags --abbrev=0)

    # Strip the 'v' and increment the version number
    tagNumber=$((${latestTag/v/} + 1))
    tagName="v$tagNumber"

    # Create and push the new tag
    echo "Executing: git tag $tagName"
    git tag "$tagName"

    echo "Executing: git push origin $tagName"
    git push origin "$tagName"
}

# Create an alias to call the function
alias gitt=new_git_tag

function gitm() {
    # Check if a commit message was provided
    if [ $# -eq 0 ]; then
        echo "Error: No commit message provided."
        return 1
    fi

    # Add all files, commit with the provided message, and push to the repository
    git add .
    git commit -m "$*"
    git push
}

PROMPT="%F{green}%n%f %1~ $ "
alias ls='ls --color'
alias ll='ls -la'
