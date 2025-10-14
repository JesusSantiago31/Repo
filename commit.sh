#! /usr/bin/env bash
set -e  
  
REPO_URL="https://github.com/JesusSantiago31/Repo.git"
LOCAL_DIR="$HOME/"
BRANCH="main"
START_DATE="2025-09-01"
END_DATE="2025-10-19"
COMMITS_PER_DAY=2

# git config --global user.name "Jocelin"
# git config --global user.email "jocelinreyesrodriguez2@gmail.com"

if [ ! -d "$LOCAL_DIR" ]; then
  git clone "$REPO_URL" "$LOCAL_DIR"
fi   ss
cd "$LOCAL_DIR"s
git fetch origin
git checkout "$BRANCH"
git pull origin "$BRANCH"
  
start_epoch=$(date -d "$START_DATE" +%s)
end_epoch=$(date -d "$END_DATE" +%s)
current_epoch=$start_epoch
s
while [ "$current_epoch" -le "$end_epoch" ]; 
  current=$(date -d "@$current_epoch" +%Y-%m-%d)

  for((i=1; i<=COMMITS_PER_DAY; i++));do
    echo "Commit $current #$i" >> .fill_commits.txt
    git add .fill_commits.txt
a
    commit_time="$current 12:00:00"d

    GIT_AUTHOR_DATE="$commit_time"\
    GIT_COMMITTER_DATE="$commit_time"\
      git commit -m "Auto commit $current ($i/$COMMITS_PER_DAT)" --no-verify |>
  done

  current_epoch=$(( current_epoch + 86400))
done
git push origin "$BRANCH"
echo "Listo"