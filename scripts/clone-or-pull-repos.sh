# clone / pull all git repos into directory above
# clone repo if it does not exist and checkout specific commit;
# else, if the repo exists, pull specific commit

PATH_TO_DIR_HOLDING_THIS_SCRIPT==$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# silence the outputs of pushd, popd ocmmands
pushd () {
    command pushd "$@" > /dev/null
}
popd () {
    command popd "$@" > /dev/null
}

# RUN set-env-vars.sh IF IT APPEARS PROJECT ENV VARS HAVE NOT BEEN SET
if [[ -z "${PROJECT_DIR_PATH}" ]]; then
    echo "project environment vars do not appear to be set...running set-env-vars.sh"
    . $PATH_TO_DIR_HOLDING_THIS_SCRIPT/set-env-vars.sh
else
    echo "project environment vars appear already set..."
fi

###################
# AUCTIONS-SERVICE
# params
export AUCTIONS_SERVICE_DIR_NAME=$AUCTIONS_SERVICE_DIR_NAME
REPO_NAME=$AUCTIONS_SERVICE_DIR_NAME # e.g. "auctions-service"
GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/auctions-service.git"
STABLE_COMMIT="41231b3"
# if repo has already been cloned, do a git pull; else, do a git clone
echo "cloning / pulling repository: $REPO_NAME"
if [ -d "$PROJECT_DIR_PATH/$REPO_NAME" ] 
then
    echo "repo already exists in directory above; doing git pull" 
    pushd $PROJECT_DIR_PATH/$REPO_NAME # go into repo; fancy version of cd command
    git pull # pull any changes
else
    echo "repo does not exist in directory above; doing git clone" 
    git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$REPO_NAME --quiet # put in directory above
    pushd  $PROJECT_DIR_PATH/$REPO_NAME # go into repo
fi
git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet # checkout the commit stable with project
popd # go back to original location

###################
# CLOSED-AUCTION-METRICS
# params
export CLOSED_AUCTION_METRICS_SERVICE_DIR_NAME=$CLOSED_AUCTION_METRICS_SERVICE_DIR_NAME
REPO_NAME=$CLOSED_AUCTION_METRICS_SERVICE_DIR_NAME # e.g. "closed-auction-metrics"
GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/closed-auction-metrics.git"
STABLE_COMMIT="8abb8e3"
# do clone / pull
echo "cloning / pulling repository: $REPO_NAME"
if [ -d "$PROJECT_DIR_PATH/" ] 
then
    echo "repo already exists in directory above; doing git pull" 
    pushd $PROJECT_DIR_PATH/$REPO_NAME
    git pull
else
    echo "repo does not exist in directory above; doing git clone" 
    git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$REPO_NAME --quiet
    pushd  $PROJECT_DIR_PATH/$REPO_NAME
fi
git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet
popd