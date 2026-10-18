# Video demonstration script

Target duration: 10 to 15 minutes. Record the screen and your own voice continuously.

## 1 Student introduction

Show `Zhaugash_Nurzhan_info.txt` and say:

> My name is Nurzhan Zhaugash. My group is IT2-2312, my Student ID is 38387, and this is my DevOps laboratory project.

## 2 Linux project and commands

Run:

```bash
pwd
find . -maxdepth 2 -type f | sort
make setup
./scripts/log_demo.sh
./scripts/permissions_demo.sh
./scripts/Zhaugash_Nurzhan_system.sh
./scripts/process_demo.sh
```

Explain that `find` searches the directory tree, `grep` filters matching lines, `grep -c` counts them, and `tail -n 5` prints the last five log messages. Explain that mode 600 protects private data, while mode 644 allows others to read public data. A process is a running program, and PID is its unique identifier. `ps` is a snapshot, while `top` refreshes continuously.

## 3 Git and GitHub

Run:

```bash
git status
git log --oneline --graph --decorate --all
git branch
git check-ignore -v logs/application.log
git remote -v
```

Point out the meaningful commits, the `development` branch, and the merge into `main`. Explain that Git records changes locally, GitHub stores the remote repository, `git push` uploads local commits, and `git pull` downloads and integrates remote commits.

Open the GitHub repository and show the project files and latest commit.

## 4 Docker

Run:

```bash
docker build -t zhaugash-nurzhan-devops .
docker images | head
docker run --name zhaugash-nurzhan-container \
  -e STUDENT_NAME=Nurzhan \
  -e STUDENT_SURNAME=Zhaugash \
  -e STUDENT_GROUP=IT2-2312 \
  -e STUDENT_ID=38387 \
  zhaugash-nurzhan-devops
docker ps -a --filter name=zhaugash-nurzhan-container
docker logs zhaugash-nurzhan-container
docker rm zhaugash-nurzhan-container
docker compose up --build --abort-on-container-exit
docker compose down
```

Explain that an image is an immutable template and a container is its runnable instance. Environment variables configure the application at runtime. Secrets should use protected credentials instead of image layers or repository files. Docker Compose records the service configuration and makes startup repeatable.

## 5 Jenkins

Open the job named `Zhaugash_Nurzhan_DevOps`. Show its GitHub repository configuration, then select **Build Now**.

Show the stages Checkout, Build, Test, Docker Build, and Docker Run. Open Console Output and identify the student information, Git commit, container log, and `Finished: SUCCESS`.

Explain that Jenkins checks out the selected Git commit, executes the application test, builds the Docker image, and runs a container. If one stage fails, Jenkins stops dependent stages and marks the build as failed.

## 6 Final workflow summary

Say:

> Linux provides the project environment. Git records changes. GitHub stores the remote source. Jenkins checks out a commit, builds and tests it, creates a Docker image, and runs a container. A successful pipeline connects the running result to version-controlled source.

Finish by showing the GitHub repository link, the PDF report, and the successful Jenkins pipeline.
