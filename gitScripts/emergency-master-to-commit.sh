set -e
while getopts b:c: option
do
case "${option}"
in
b) BACKUP_BRANCH_NAME=${OPTARG};;
c) COMMIT_HASH=${OPTARG};;
esac
done

if [ -z "$COMMIT_HASH" ]
then
  echo "== Err: This command required -c as a hash commit argument."
  echo "== For example command"
  echo "=="
  echo "=="
  echo "==   yarn bring-master-to-commit -c 55fa5712bf6a -b backup-branch-name"
  echo "=="
  echo "==    -c is COMMIT_HASH"
  echo "==    -b is BACKUP_BRANCH_NAME"
  echo "=="
  echo "==   *please clean your repository before run this command"
  echo "==   clean repo by 'git clean -f' command"
  echo "=="
  echo "=========================================================="
  exit 1
fi

CURRENT_DIRECTORY=$(pwd)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
DATE_TODAY=$(date +'%d-%m-%Y')
BACKUP_FOLDER="$HOME/Desktop/react-sanook-bk-$DATE_TODAY"
[ -z "$BACKUP_BRANCH_NAME" ] && BACKUP_BRANCH_NAME="emergency-master-$DATE_TODAY"


echo "=========================================================="
echo "=="
echo "==   Backup master to commit <$COMMIT_HASH>"
echo "==   *please clean your repository before run this command"
echo "==   clean repo by 'git clean -f' command"
echo "=="
echo "=========================================================="

echo "checking commit exist" \
  && git checkout $COMMIT_HASH

echo "-------------- BACKUP PLAN --------------"
echo "> create backup folder..." \
  && mkdir $BACKUP_FOLDER

echo "> backup your current commit..." \
  && rsync -r $(pwd) $BACKUP_FOLDER/backup-current-commit --exclude node_modules

echo "> checkout branch master..." \
  && git checkout master \
  && echo "> git pull on branch master..." \
  && git pull \
  && echo "> backup your current master" \
  && rsync -r $(pwd) $BACKUP_FOLDER/backup-master-current --exclude node_modules

echo "-------------- ROLLBACK PLAN --------------"
echo "> backup current master's .git" \
  && cp -fR $(pwd)/.git $BACKUP_FOLDER/backup-master-current/.git_current_master
echo "> move to commit COMMIT_HASH" \
  && git checkout $COMMIT_HASH
echo "> tar required commit to backup ..." \
  && tar --exclude=".git" --exclude="node_modules" -zcf $BACKUP_FOLDER/backup-master-current/sanook-react-backup.tar .
echo "> change current directory_name" \
  && mv $CURRENT_DIRECTORY $CURRENT_DIRECTORY-$DATE_TODAY
echo "> create empty directory for backup" \
  && mkdir $CURRENT_DIRECTORY
echo "> change working directory to $CURRENT_DIRECTORY" \
  && cd $CURRENT_DIRECTORY
echo "> untar required commit to backup ..." \
  && tar -zxf $BACKUP_FOLDER/backup-master-current/sanook-react-backup.tar
echo "> move current master's .git back to backup directory" \
  && mv $BACKUP_FOLDER/backup-master-current/.git_current_master $(pwd)/.git
echo "> create branch..." \
  && git checkout -b $BACKUP_BRANCH_NAME \
  && git add . \
  && git commit -m "[$BACKUP_BRANCH_NAME] backup master on $DATE_TODAY"
echo "> remove unused directory" \
  && rm -fR $CURRENT_DIRECTORY-$DATE_TODAY

echo "Do you need to remove $BACKUP_FOLDER? [y/n]"
read NEED_TO_REMOVE_BACKUP_FOLDER

if [ $NEED_TO_REMOVE_BACKUP_FOLDER == "n" ]; then
  exit 0
fi

rm -fR $BACKUP_FOLDER