Git Commands
================
Julian Martinez
4/1/2022

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
        -   `--list`: Combine with`-a`. With optional <pattern>…,
            e.g. git branch –list ’maint-\*’, list only the branches
            that match the pattern(s).
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

3.  Add your small changes of files to the index with `git add`.

    -   Stage each file individually with
        `git add "path/to/the/changed/file"`
    -   Stage all files with `git add .`

4.  See which files are staged & unstaged with `git status`

    -   `<option> -s --short`
        -   ?? = Untracked files
        -   A = Added
        -   D = Deleted
        -   M = Modified
        -   R = Renamed
        -   T = Type changed
    -   Files with red letter(s) = unstaged
    -   Files with green letter = staged

5.  Either a) make a commit that have changes that are all relevant
    or b) make a work in progress (WIP) that can still have some changes
    add to it.

    1.  `git commit -m "<Headline>" -m "<Description>"`

    2.  -   `git commit -m "WIP*"`
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
    commits into `<new_branch>`

    -   \*\*\*\*\*\*\*\*\* TO DO \*\*\*\*\*\*\*\*\*\*\*\* Add how to
        actually do this.

9.  Do a pull request by `git push <new_branch>`. Now go to Github and
    double check changes AND to make sure code passes QA and tests.
    \*\*\*\*\*\*\*\*\*\* TO D O\*\*\*\*\*\*\*\*\*.

10. Once pull request is accepted, complete the pull request by merging
    `<new_branch>` with `main` and deleting `<new_branch>`.

11. Delete `<new_branch>` locally with `git branch -D <new_branch>` and
    then `git pull` while in `main` branch.