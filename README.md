# Aliases

A collection of shell aliases and helpers for Git, Docker, Docker Compose, Vagrant, and Kubernetes. Source the bundle or individual files in your shell config (e.g. `~/.bashrc` or `~/.zshrc`).

## Table of contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Contents](#contents)
- [Git aliases](#git-aliases)
- [Docker aliases](#docker-aliases)
- [Vagrant](#vagrant)
- [Kubectl](#kubectl)
- [General](#general)
- [.p (project paths)](#p-project-paths)
- [all](#all)

---

## Requirements

- Bash or Zsh
- Git, Docker, Vagrant, kubectl as needed for the aliases you use
- macOS for `dkreboot` (uses `osascript` / `open`); `countdown` is assumed to exist for that helper
- `jq` for `dkstate`

---

## Installation

**Load everything:**

```bash
source /path/to/aliases/all
```

**Load only specific sets:**

```bash
source /path/to/aliases/.git_aliases
source /path/to/aliases/.docker_aliases
source /path/to/aliases/.vagrant
source /path/to/aliases/.kubectl
source /path/to/aliases/.general
source /path/to/aliases/.p
```

To load automatically, add the `source` line to `~/.bashrc` or `~/.zshrc`.

---

## Contents

| File | Description |
|------|-------------|
| [.git_aliases](#git-aliases) | Git: commit, push, branch, prune |
| [.docker_aliases](#docker-aliases) | Docker & Docker Compose |
| [.vagrant](#vagrant) | Vagrant up/ssh/halt |
| [.kubectl](#kubectl) | kubectl shortcuts |
| [.general](#general) | General utilities (e.g. kill by port) |
| [.p](#p-project-paths) | Project paths and directory shortcuts |
| [all](#all) | Sources all of the above |

---

## Git aliases

All commit aliases support **multi-line messages**: pass multiple arguments and each becomes a paragraph, e.g.  
`gacp "feat: add login" "Implement OAuth." "Closes #123"`

| Alias | Description |
|-------|-------------|
| `gfc` *[message...]* | Stage all, commit (multi-line ok), skip hooks (`--no-verify`) |
| `gac` *[message...]* | Stage all and commit (multi-line ok) |
| `gacp` *[message...]* | Stage, commit, then push |
| `gacpb` *[message...]* | Stage, commit, push to origin and set upstream |
| `gfcpb` *[message...]* | Same as gacpb but with `--no-verify` |
| `gfcp` *[message...]* | `gfc` + push (no-verify) |
| `gp` | Pull current branch |
| `gfp` | Push current branch, skip hooks |
| `gfpb` | Push to origin, set upstream, skip hooks |
| `gb` *&lt;branch&gt;* | Create branch and switch to it |
| `gch` *&lt;branch&gt;* | Checkout branch or ref |
| `gchm` | Checkout default branch (master or main) |
| `gfpr` | Fetch all remotes and prune deleted remote-tracking branches |
| `gprune-local` | Fetch origin (prune), then delete every local branch that has no matching branch on origin (current branch is never deleted) |

---

## Docker aliases

### Docker

| Alias | Description |
|-------|-------------|
| `dk` | `docker` |
| `dki` | `docker images` |
| `dks` | `docker service` |
| `dkps` | `docker ps` with custom format (ID ~ Names ~ Status ~ Image) |
| `dkt` | `docker stats` (table: Name, CPU, Mem, NetIO) |
| `dkrm` | `docker rm` |
| `dkl` | `docker logs` |
| `dklf` | `docker logs -f` |
| `dkflush` | Remove all containers |
| `dkflush2` | Remove dangling images |
| `dkln` *&lt;name&gt;* | Follow logs of container matching name (grep) |
| `dke` *&lt;container&gt;* | `docker exec -it` with `/bin/sh` |
| `dkexe` *&lt;container&gt;* *&lt;cmd&gt;* | `docker exec -it` with custom command |
| `dkreboot` | Quit and reopen Docker app (macOS), then wait ~2 min |
| `dkstate` *&lt;container&gt;* | Container state (requires `jq`) |

### Docker Compose

| Alias | Description |
|-------|-------------|
| `dcu` | `docker compose up` |
| `dcud` | `docker compose up -d` |
| `dcd` | `docker compose down` |
| `dcr` | `docker compose run` |
| `dcst` | `docker compose stop` |
| `dce` | `docker compose exec` |
| `dcs` | `docker compose ps --services` |
| `dcrm` | `docker compose rm` |
| `dcre` | `docker compose restart` |
| `dcps` | `docker compose ps` |
| `dcl` | `docker compose logs` |
| `dclf` | `docker compose logs -f` |
| `dcrefresh` *&lt;service&gt;* | Stop, rm -f, up --build, then logs -f for service |
| `dcip` *&lt;container&gt;* | Container IP (inspect) |
| `dcss` *&lt;service&gt;* | Shell into service (bash if available, else sh as root) |

---

## Vagrant

| Alias | Description |
|-------|-------------|
| `vg` | `vagrant` |
| `vguss` *&lt;name&gt;* | `vagrant up` then `vagrant ssh` |
| `vgss` *&lt;name&gt;* | `vagrant ssh` |
| `vgh` *&lt;name&gt;* | `vagrant halt` |

---

## Kubectl

| Alias | Description |
|-------|-------------|
| `k` | `kubectl` |
| `kg` | `kubectl get` |
| `kgpod` | `kubectl get pod` |
| `kgall` | `kubectl get --all-namespaces all` |
| `kdp` | `kubectl describe pod` |
| `kap` | `kubectl apply` |
| `krm` | `kubectl delete` |
| `krmf` | `kubectl delete -f` |
| `kgsvc` | `kubectl get service` |
| `kgdep` | `kubectl get deployments` |
| `kl` | `kubectl logs` |
| `kei` | `kubectl exec -it` |

---

## General

| Command | Description |
|--------|-------------|
| `killport` *&lt;port&gt;* | Kill processes listening on TCP *port* (SIGTERM then SIGKILL; uses sudo if needed) |

---

## .p (project paths)

Sets `sp` and `spw` and provides directory / workflow shortcuts. **Paths are machine-specific** — edit `.p` to match your layout.

| Variable / Command | Description |
|--------------------|-------------|
| `sp` | Base path (e.g. project root) |
| `spw` | e.g. `$sp/single_vagrant` |
| `sibase` | `cd $sp` |
| `siops` | `cd $sp/single_devops` |
| `siops-vagrant` | `cd $sp/single_devops` then `vguss ansible` |
| `sidocker` | `cd $sp/single_vagrant/docker` then `docker compose up -d` |
| `sidocker-vagrant` | `cd $sp/single_vagrant` then `vguss docker` |

---

## all

Single entry script that sources (in order): `.p`, `.general`, `.vagrant`, `.git_aliases`, `.kubectl`, `.docker_aliases`. Use this to load the full alias set.
