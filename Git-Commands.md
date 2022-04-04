Git Commands
================
Julian Martinez
4/1/2022

-   `git remote --verbose`

    -   Shows the remotes you have setup. Github should be the origin.

-   `git remote show origin`

    -   Shows what branch the remote branch is tracking.
    -   Shows the local branch configured for `git pull`
    -   Shows the local ref(?) configured for `git push`

# Git Workflow

1.  `git branch [BRANCH-NAME like create-function/function_name_version/fix-thing/update-thing]`

    -   Create a branch with a single goal.
    -   Make branch name have no spaces, use a hyphen `-` when you would
        use a space.
    -   ! Make sure that there is no work in progress (WIP) on the
        current branch!
    -   If there is use, GitKraken as it will make a stash of that WIP
        that you can add to the branch you created.

2.  `git checkout [BRANCH-NAME]`

    -   Switch to new branch

3.  `git push -u origin [BRANCH NAME]`

    -   Create new branch on remote origin repository on github and have
        your local new branch track the new remote branch (for push &
        pulls)
    -   `<option> -u --set-upstream`
        -   Adds upstream (tracking) reference.

4.  Make changes to scripts and save changes.

5.  `git status`

    -   See what has been changed in repo since last commit.
    -   `<option> -s --short`
        -   ?? = Untracked files
        -   A = Added
        -   D = Deleted
        -   M = Modified
        -   R = Renamed
        -   T = Type changed

6.  `git add path/to/the/changed/file`

    -   Stage small changes towards branch goal

7.  `git commit -m "WIP"`

    -   Save changes in a work in progress (WIP) commit.
    -   `-m` is the message in the commit.

8.  `git commit --amend --no-edit`

    -   After staging additional changes, amend additional changes to
        WIP commit.
    -   `--no-edit` retains the current message of WIP commit.

9.  `git commit --amend -m "Implement awesome feature; closes #43"`

    -   When you want the final changes for a commit, amend again but
        now add in the new message.

10. `git commit <options>` - `-a --all`

    -   Automatically stage all files that have been modified or
        deleted, but not new files that have been added(?).
    -   `-m --message`
        -   Commit message. begin the commit message with a single short
            (less than 50 character) line summarizing the change,
            followed by a blank line and then a more thorough
            description.
    -   Add two `-m` to have the first message act as a headline and the
        second message act as the description.

11. checkout main branch

12. `git pull` from github (origin)

13. Integrate any additional changes from origin into current work

14. merge feature branch to main branch

15. Before pushing new shit onto github, do a pull request to make sure
    code passes QA and tests.

16. `git push`

    -   Finally push changes to github
