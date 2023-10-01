#export GIT_AUTHOR_DATE=$(date -d'2020-02-02 12:00:00')
#export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
#git commit --allow-empty --allow-empty-message -m 'test_message_for_02-02-2020'
#
#1672566924 = unix time stamp for jan 1 2023
#1662281724 = unix time stamp for sept 4 2022
#1641030924 = unix time stamp for jan 1 2022
UNIX_TIMESTAMP=1641030924
#86400 = 24 hrs; commit daily
INCREMENTER=86400
#number of days to commit until
NUM_OF_DAYS_TO_COMMIT=610
# 0 for almost 100%, 16383 for almost 50%
RNG_NUMERATOR=16383
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
#loop daily
for i in $(seq 1 1 $NUM_OF_DAYS_TO_COMMIT )
do
  #about 50% RNG
  if [ $RANDOM -gt $RNG_NUMERATOR ]
  then
    #echo commit date
    echo date +%F -d @$UNIX_TIMESTAMP
    #set git date globals
    export GIT_AUTHOR_DATE=$(date -d @$UNIX_TIMESTAMP)
    export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
    #make commit
    git commit --allow-empty --allow-empty-message -m 'commit message for '+"$(date -d @$UNIX_TIMESTAMP)"
  fi
  #increment date by INCREMENTER value
  UNIX_TIMESTAMP=$((UNIX_TIMESTAMP+INCREMENTER))
done