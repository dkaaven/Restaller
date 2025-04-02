alias code = "codium"
alias docker = "podman"
alias docker-compose = "podman compose"

def new-git-repo [reponame] {
    git remote add origin git@github.com:dkaaven/$reponame.git
    git push -u origin main
}
alias new-repo = new-git-repo