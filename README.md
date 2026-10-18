# DevOps Laboratory Project

This repository implements the Linux, Git, Docker, and Jenkins workflow for the six-week DevOps laboratory. The application prints student information, is tested with a shell test, runs in Docker, and is automated by a Jenkins declarative pipeline.

## Student information

- Name: Nurzhan
- Surname: Zhaugash
- Group: `IT2-2312`
- Student ID: `38387`
- Course: DevOps

Replace the two placeholder values in `Zhaugash_Nurzhan_info.txt`, `.env.example`, `app/student_app.sh`, `scripts/Zhaugash_Nurzhan_system.sh`, `docker-compose.yml`, and `Jenkinsfile` before submission.

To replace both values everywhere in one command, run:

```bash
./scripts/personalize.sh YOUR_GROUP YOUR_STUDENT_ID
```

## Project structure

```text
zhaugash-nurzhan-devops/
├── app/
│   └── student_app.sh
├── backup/
├── config/
│   └── app.conf
├── docs/
├── logs/
│   └── application.log       # local demonstration file, ignored by Git
├── scripts/
│   ├── Zhaugash_Nurzhan_system.sh
│   ├── log_demo.sh
│   ├── permissions_demo.sh
│   └── process_demo.sh
├── tests/
│   └── test_app.sh
├── .env.example
├── .gitignore
├── Dockerfile
├── Jenkinsfile
├── Makefile
├── docker-compose.yml
├── private.txt
├── public.txt
└── Zhaugash_Nurzhan_info.txt
```

## Linux demonstrations

Run the complete local verification:

```bash
make verify
```

Individual demonstrations:

```bash
pwd
ls -la
cd scripts
mkdir -p ../backup/demo
touch ../backup/demo/example.txt
cp ../backup/demo/example.txt ../backup/demo/example-copy.txt
mv ../backup/demo/example-copy.txt ../backup/demo/renamed.txt
cat ../Zhaugash_Nurzhan_info.txt
head -n 3 ../logs/application.log
tail -n 5 ../logs/application.log
rm ../backup/demo/renamed.txt

./scripts/log_demo.sh
./scripts/permissions_demo.sh
./scripts/Zhaugash_Nurzhan_system.sh
./scripts/process_demo.sh
```

Command meanings:

- `pwd` prints the current working directory.
- `ls` lists directory contents; `ls -l` also shows permissions, owner, size, and modification time.
- `cd` changes the current directory.
- `mkdir` creates directories, while `touch` creates an empty file or updates its timestamp.
- `cp` copies a file, `mv` moves or renames it, and `rm` removes it.
- `cat` prints the complete file; `head` and `tail` print its beginning and end.
- `find` searches the directory tree by criteria such as name and type.
- `grep` prints lines matching a pattern; `grep -c` counts matching lines.

### Permissions

`private.txt` uses mode `600`: the owner can read (`r`) and write (`w`), while group and others have no access. `public.txt` uses mode `644`: the owner can read and write, while group and others can read. Execute (`x`) allows a file to run as a program or a directory to be entered. These permissions differ because private notes should not be exposed, while public project information is safe to share.

### Processes

A process is a running instance of a program. Its PID is the unique process identifier assigned by the operating system. `ps` returns a snapshot; `top` continuously refreshes process and resource information. `scripts/process_demo.sh` shows PID, owner, CPU use, and memory use for the current shell process.

## Git and GitHub

The repository contains meaningful commits matching actual changes. Useful inspection commands are:

```bash
git status
git log --oneline --graph --decorate --all
git branch
git check-ignore -v logs/application.log backup/demo/example.txt
```

`.gitignore` prevents generated logs, backups, local environment variables, and machine-specific files from entering version control. This keeps the repository reproducible and prevents accidental leakage of secrets.

Branches isolate work so it can be reviewed and merged without destabilizing the main line. A typical feature workflow is:

```bash
git switch -c development
# make and commit a meaningful change
git switch main
git merge development
```

To publish after creating an empty GitHub repository named `zhaugash-nurzhan-devops`:

```bash
git remote add origin https://github.com/YOUR_USERNAME/zhaugash-nurzhan-devops.git
git push -u origin main
```

`git push` sends local commits to the remote repository. `git pull` fetches remote commits and integrates them into the current local branch.

## Docker

Create a local `.env` file before running Docker:

```bash
cp .env.example .env
# edit STUDENT_GROUP and STUDENT_ID
docker build -t zhaugash-nurzhan-devops .
docker images
docker run --name zhaugash-nurzhan-container --env-file .env zhaugash-nurzhan-devops
docker ps -a
docker logs zhaugash-nurzhan-container
docker start -a zhaugash-nurzhan-container
docker rm zhaugash-nurzhan-container
```

An environment variable is a named value supplied to a process at runtime. Environment variables make one image configurable across environments. Secrets should not be hard-coded because image layers and repository history can expose them; Jenkins credentials or another secret store should inject them at runtime.

A Docker image is an immutable application template. A container is a runnable instance of that image, with its own runtime state.

Docker Compose stores the service configuration as code and starts the application consistently:

```bash
docker compose up --build
docker compose ps
docker compose down
```

## Jenkins

Create a Pipeline job with the exact name `Zhaugash_Nurzhan_DevOps`. Choose **Pipeline script from SCM**, select Git, enter the GitHub repository URL, and use `Jenkinsfile` as the script path. Configure `STUDENT_GROUP` and `STUDENT_ID` with the real values before the final run.

The pipeline performs:

1. **Checkout** obtains the exact Git commit from GitHub.
2. **Build** prepares executable scripts and runs the application.
3. **Test** checks the required output and exits on failure.
4. **Docker Build** creates versioned and latest image tags.
5. **Docker Run** starts the container with student environment variables and displays its logs.

If any command returns a non-zero status, Jenkins stops the later dependent stages and marks the build as failed. The problem is fixed in the repository, committed, pushed, and then rebuilt.

The Jenkins machine must have Git and Docker installed, and its Jenkins user must have permission to access the Docker daemon.

## Integrated workflow

Linux provides the operating environment and command-line tools. Git records local changes. GitHub stores the shared remote repository. Jenkins checks out a selected GitHub commit, runs the test, builds a Docker image, and starts a container from the validated image. The container output is the deployable result of that commit.

```text
Linux -> Project files -> Git -> GitHub -> Jenkins
      -> Build -> Test -> Docker image -> Container -> SUCCESS
```

## Video checklist

In one continuous recording, show the student information, project tree, log searches, permissions, system script, process details, Git history, ignored files, branch graph, GitHub repository, Docker build/run/logs, Compose, Jenkins job, stage view, console output, image/container, and the commit used by Jenkins. Explain each command instead of only showing its result.
