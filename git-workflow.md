Git Commands
================
Julian Martinez
4/1/2022

# Prerequisites

## [Install choco](https://community.chocolatey.org/courses/installation/installing?method=installing-chocolatey)

-   REQUIRES ADMINISTRATOR ACCESS

## Install & Open lazygit

-   Open command prompt WITH ADMIN ACCESS

-   `choco install lazygit`

-   Shift + Right-click folder in File Explorer

-   “Open Powershell Window here”

-   Click on logo top-left

-   Preferences -> Colors -> Screen Background to BLACK (RBG all to 12)

-   Reopen Powershell

-   `lazygit`

-   Press `x` to see Menu commands (and hotkeys with each command)

    -   Scroll through commands with $\\\\downarrow$ & $\\\\uparrow$
    -   Press `enter` on a command to do it.
    -   `esc` to exit menu

-   Use `[` and `]` to switch tabs within a panel.

# Notes

-   Create branches off of main with a single goal, like
    updating/creating a function.
-   Make branch name have no spaces, use a hyphen `-` when you would use
    a space.
-   !!Make sure that there is no work in progress (WIP) on the current
    branch!! If there is, use GitKraken as it will make a stash of that
    WIP that you can add to the branch you created.
-   NEVER AMEND COMMITS THAT ARE PUBLISHED (i.e. appear on a remote
    repository)

# Git Commands & common options

-   `git remote --verbose`

    -   Shows the remotes you have setup. Github should be the origin.

-   `git remote show origin`

    -   Shows what branch the remote branch is tracking.
    -   Shows the local branch configured for `git pull`
    -   Shows the local ref(?) configured for `git push`

-   `git branch`

    -   List, create, or delete branches.

    -   `<new_branch>`: Create new branch

    -   `-a --all`: List both remote-tracking branches and local
        branches.

        -   `--list`: Combine with`-a`. With optional <pattern>…, e.g.
            git branch –list ‘maint-\*’, list only the branches that
            match the pattern(s).

    -   `-d --delete`: Delete a branch.

    -   `-m --move`: Move/rename a branch.

    -   `-t --track`: When creating a new branch, set up
        `branch.<name>.remote` to mark the start-point branch as
        “upstream” from the new branch. This configuration will tell git
        to show the relationship between the two branches in git status
        and git branch -v. Furthermore, it directs git pull without
        arguments to pull from the upstream when the new branch is
        checked out.

    -   `-v --verbose`: When in list mode, show sha1 and commit subject
        line for each head, along with relationship to upstream branch
        (if any).

    -   `-vv`: Print the path of the linked worktree (if any) and the
        name of the upstream branch, as well.

-   `git checkout`

    -   Switch branches or restore working tree files.

    -   `-b <new_branch>`: Create a new branch named `<new_branch>`

        -   `-t --track`: Set up “upstream” configuration to tell
            `<new_branch>` to track a remote branch for push/pull. Is
            usually named `origin/<new_branch>`

-   `git push`

    -   Update remote branches with commits.
    -   `<branch>`: Update remote <branch> with local one. If remote one
        doesn’t exist, it is created.
    -   `-u --set-upstream`: set upstream for git pull status.

-   `git commit`

    -   Record changes to repo

    -   `-a --all`: Tell the command to automatically stage files that
        have been modified and deleted, but new files you have not told
        Git about are not affected.

    -   `-m --message <msg>`: Use the given <msg> as the commit message.
        If multiple -m options are given, their values are concatenated
        as separate paragraphs.

        -   `git commit -m "<Headline>" -m "<Description>"`: Headline
            should be \< 50 characters and description is more thorough.

    -   `--amend`: Replace the tip of the current branch by creating a
        new commit.

        -   `--no-edit`: Amends a commit without changing its commit
            message.

# Git Workflow

1.  The first step involves creating a new branch off of main. Doing so
    depends on if a) the new branch has already been created on Github
    or b) if you are creating the branch locally first.

    1.  `git checkout -b <new_branch> -t origin/<new_branch>`
    2.  `git checkout -b <new_branch>` then
        `git push -u origin <new_branch>`

2.  Make changes to scripts and save changes.

3.  Add your small changes of files to the index with `git add`. - Stage
    each file individually with `git add "path/to/the/changed/file"` -
    Stage all files with `git add .`

4.  See which files are staged & unstaged with `git status` -
    `<option> -s --short` - ?? = Untracked files - A = Added - D =
    Deleted - M = Modified - R = Renamed - T = Type changed - Files with
    red letter(s) = unstaged - Files with green letter = staged

5.  Either

    1.  Make a commit that have changes that are all relevant.

        -   `git commit -m "<Headline>" -m "<Description>"`

    2.  make a work in progress (WIP) that can still have some changes
        add to it.

        -   `git commit -m "WIP*"`
        -   Make additional changes to files.
        -   Stage changes to index
        -   If changes aren’t final then do another intermidiate commit
            with `git commit --amend --no-edit`.
        -   If changes are final then
            `git commit --amend -m "<Headline>" -m "<Description>"`

6.  checkout main branch with `git checkout main`.

7.  Do a pull from Github (remote/origin) with `git pull` to see if any
    contributors have added new code (good practice even if you are the
    sole contributor).

8.  If local `main` was behind from `origin/main`, then cherrypick
    commits into `<new_branch>` - \*\*\*\*\*\*\*\*\* TO DO
    \*\*\*\*\*\*\*\*\*\*\*\* Add how to actually do this.

9.  Do a pull request by `git push <new_branch>`. Now go to Github and
    double check changes AND to make sure code passes QA and tests.
    \*\*\*\*\*\*\*\*\*\* TO DO \*\*\*\*\*\*\*\*\*.

10. Once pull request is accepted, complete the pull request by merging
    `<new_branch>` with `main` and deleting `<new_branch>` on origin.

11. Delete `<new_branch>` locally with `git branch -D <new_branch>` and
    then `git pull` while in `main` branch.

# Lazygit Workflow

1.  Either:

    1.  open a Command Prompt/Powershell in the Terminal Tab of RStudio
        or
    2.  Shift+RightClick repo in File Explorer and open a Powershell
        terminal.

2.  Focus on Panel 3 - **Local Branches** and create a `new_branch` off
    of main depending one of two things:

    -   If branch has not been made on origin:

        -   Press `n` to create a newName the new branch in the pop-up.
            Notice how you will automatically be checked out into new
            branch.
        -   Press `P (shift+p)` to push to origin.
        -   A “Enter upstream as <remote> <branchname>” will appear.
            Just press `<enter>`.

    -   If branch has been made on origin:

        -   Press `n` to create a newName the new branch in the pop-up.
            Notice how you will automatically be checked out into new
            branch.
        -   Press `P (shift+p)` to push to origin.
        -   Press `<tab>` to focus on **Suggestions** panel and the
            <new_branch> name you made should appear on suggestions.
            Highlight it and press `<enter>`

3.  Make changes to scripts and files.

4.  To stage files, While focused on Panel 2 - **Files**:

    -   Select individual files to stage with <space> and ↑ ↓
    -   `a` to stage all files

5.  To commit, while still focused Panel 2 - **Files**:

    -   `c` to commit and add a message within lazygit. Use alt+enter to
        add newlines (DOES NOT WORK IN WINDOWS COMMAND LINE, ONLY IN
        Rstudio)

    -   `C (shift+c)` to open text editor (currently set to vi) to
        create commit message

    -   `A (shift+a)` to amend previous commit.

        -   Focus to Panel 4 - **Commits** and select most recent
            commit.
        -   `r` to reword commit message within lazygit.
        -   `R (shift+r)` to reword commit message with text editor.

6.  Focus to Panel 3 - **Local Branches** and highlight `main` branch.

    -   Press `<space>` to checkout main branch.

7.  Pull from origin/main with `p` to see if any contributors have added
    new code.

8.  If local `main` was behind from `origin/main`, then cherrypick
    commits into `<new_branch>` - \*\*\*\*\*\*\*\*\* TO DO
    \*\*\*\*\*\*\*\*\*\*\*\* Add how to actually do this.

9.  Once `<new_branch>` is ready to push, open a pull request by
    focusing on Panel 3 - **Local Branches** and highlighting
    `<new_branch>`

    -   Press `o` to open a pull request which will take you to the
        Github repository page.

10. On Github double check changes AND make sure code passes QA and
    tests. \*\*\*\*\*\*\*\*\*\* TO DO \*\*\*\*\*\*\*\*\*.

11. Once pull request is accepted, complete the pull request by merging
    `<new_branch>` with `main` and deleting `<new_branch>` on origin.

12. Delete `<new_branch>` locally by focusing on Panel 3 - **Local
    Branches** and pressing `d` while `<new_branch>` is selected. Press
    `<enter>` when prompted if you are sure.

    -   If for some reason remote `<new_branch>` was not deleted, focus
        on Panel 3 - **Remotes**.
    -   Press `<enter>` and highlight `<new_branch>`.
    -   Press `d`.
