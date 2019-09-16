export current_branch=$(git branch | grep \\* | cut -d ' ' -f2) \
  && git checkout master \
  && git pull \
  && cp -fR src ~/Desktop/src_master \
  && git checkout $current_branch \
  && git checkout -b "rollback-$current_branch" \
  && rm -fR src \
  && mv ~/Desktop/src_master src \
  && git add . \
  && git commit -m "[rollback-$current_branch] rollback state"