#
#Commits from today's everyday into the future, 1 to 10 times each day.
#
UNIX_TIMESTAMP=$(date +%s)
#86400 = 24 hrs; commit daily
INCREMENTER=86400
# 0 for almost 100%, 16383 for almost 50%
RNG_NUMERATOR=$(echo $((1 + $RANDOM % 10)))
# for automating pushing, limit to 1000 commits per push will be tracked
COMMIT_COUNT=0
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#loop daily
while [ true ]
do
  COUNT=$RNG_NUMERATOR
  NOW=$(echo $(date +%F -d @$UNIX_TIMESTAMP))
  printf "\n\n\x1B[32mTracking ${COMMIT_COUNT} commits.\n${COUNT} commits to make on ${NOW}\x1B[0m\n"
  UNIX_TIMESTAMP=$((UNIX_TIMESTAMP-(COUNT*111)))
  for i in $(seq 1 1 $COUNT )
  do
    if [ -n $COUNT ]
    then
      COUNT=$((COUNT-1))
      #echo commit date
      echo date +%F -d @$UNIX_TIMESTAMP
      #set git date globals
      export GIT_AUTHOR_DATE=$(date -d @$UNIX_TIMESTAMP)
      export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
      #make commit
      git commit --allow-empty --allow-empty-message -m "commit message for "+"$(date -d @$UNIX_TIMESTAMP)"
      COMMIT_COUNT=$((COMMIT_COUNT+1))
      UNIX_TIMESTAMP=$((UNIX_TIMESTAMP+111))
    fi
  done
  RNG_NUMERATOR=$(echo $((1 + $RANDOM % 10)))
  #increment date by INCREMENTER value
  UNIX_TIMESTAMP=$((UNIX_TIMESTAMP+INCREMENTER))
  if [ $COMMIT_COUNT -gt 980 ]
  then
    printf "\n\n\x1B[33m Pushing ${COMMIT_COUNT} commits.\n\x1B[0m"
    COMMIT_COUNT=0
    git push
  fi
done