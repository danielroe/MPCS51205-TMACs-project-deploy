# clone / pull all git repos into directory above
# clone repo if it does not exist and checkout specific commit;
# else, if the repo exists, pull specific commit

# stop script upon encountering the first error
# without closing terminal window
# set -e

cd $PROJECT_DIR_PATH
git clone $AUCTIONS_GITHUB_REPO_URL
git clone $CAM_GITHUB_REPO_URL
git clone $USER_SERVICE_GITHUB_REPO_URL
git clone $WATCHLIST_GITHUB_REPO_URL
git clone $ITEM_GITHUB_REPO_URL
git clone $NOTIFICATION_GITHUB_REPO_URL
git clone $SHOPPING_CART_GITHUB_REPO_URL
git clone $GATEWAY_GITHUB_REPO_URL

# PATH_TO_DIR_HOLDING_THIS_SCRIPT==$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# # silence the outputs of pushd, popd ocmmands
# pushd () {
#     command pushd "$@" > /dev/null
# }
# popd () {
#     command popd "$@" > /dev/null
# }

# # RUN set-env-vars.sh IF IT APPEARS PROJECT ENV VARS HAVE NOT BEEN SET
# if [[ -z "${PROJECT_DIR_PATH}" ]]; then
#     echo "project environment vars do not appear to be set...running set-env-vars.sh"
#     . $PATH_TO_DIR_HOLDING_THIS_SCRIPT/set-env-vars.sh
# else
#     echo "project environment vars appear already set..."
# fi

# ###################
# # AUCTIONS-SERVICE
# # params: define vars in set-env-vars.sh
# # STABLE_COMMIT=""
# # if repo has already been cloned, do a git pull; else, do a git clone
# echo "cloning / pulling repository: $AUCTIONS_SERVICE_DIR_NAME"
# if [ -d "$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME" ] 
# then
#     echo "repo already exists in directory above; doing git pull" 
#     pushd $PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME # go into repo; fancy version of cd command
#     git pull # pull any changes
# else
#     echo "repo does not exist in directory above; doing git clone" 
#     mkdir -p $PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME
#     git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME --quiet # put in directory above
#     pushd  $PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME # go into repo
# fi
# # git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet # checkout the commit stable with project
# # git checkout main --quiet # THIS WILL CHECKOUT THE LATEST COMMIT...NEED TO BE IN GIT DIR THOUGH SO CD THERE FIRST
# popd # go back to original location

# # ###################
# # # CLOSED-AUCTION-METRICS
# # # params: define vars in set-env-vars.sh
# # # do clone / pull
# # echo "cloning / pulling repository: $CAM_SERVICE_DIR_NAME"
# # if [ -d "$PROJECT_DIR_PATH/" ] 
# # then
# #     echo "repo already exists in directory above; doing git pull" 
# #     pushd $PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME
# #     git pull
# # else
# #     echo "repo does not exist in directory above; doing git clone" 
# #     git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME --quiet
# #     pushd  $PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME
# # fi
# # # git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet
# # # git checkout main --quiet # THIS WILL CHECKOUT THE LATEST COMMIT...NEED TO BE IN GIT DIR THOUGH SO CD THERE FIRST
# # popd

# # ###################
# # # USER-SERVICE
# # # params: define vars in set-env-vars.sh
# # GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/user-service.git"
# # # STABLE_COMMIT=""
# # # do clone / pull
# # echo "cloning / pulling repository: $USER_SERVICE_DIR_NAME"
# # if [ -d "$PROJECT_DIR_PATH/" ] 
# # then
# #     echo "repo already exists in directory above; doing git pull" 
# #     pushd $PROJECT_DIR_PATH/$USER_SERVICE_DIR_NAME
# #     git pull
# # else
# #     echo "repo does not exist in directory above; doing git clone" 
# #     git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$USER_SERVICE_DIR_NAME --quiet
# #     pushd  $PROJECT_DIR_PATH/$USER_SERVICE_DIR_NAME
# # fi
# # # git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet
# # # git checkout main --quiet # THIS WILL CHECKOUT THE LATEST COMMIT...NEED TO BE IN GIT DIR THOUGH SO CD THERE FIRST
# # popd

# # ###################
# # # WATCHLIST-SERVICE
# # # params: define vars in set-env-vars.sh
# # # STABLE_COMMIT=""
# # # do clone / pull
# # echo "cloning / pulling repository: $WATCHLIST_DIR_NAME"
# # if [ -d "$PROJECT_DIR_PATH/" ] 
# # then
# #     echo "repo already exists in directory above; doing git pull" 
# #     pushd $PROJECT_DIR_PATH/$WATCHLIST_DIR_NAME
# #     git pull
# # else
# #     echo "repo does not exist in directory above; doing git clone" 
# #     git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$WATCHLIST_DIR_NAME --quiet
# #     pushd  $PROJECT_DIR_PATH/$WATCHLIST_DIR_NAME
# # fi
# # # git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet
# # # git checkout main --quiet # THIS WILL CHECKOUT THE LATEST COMMIT...NEED TO BE IN GIT DIR THOUGH SO CD THERE FIRST
# # popd


# # ###################
# # # GATEWAY
# # # params: define vars in set-env-vars.sh
# # # STABLE_COMMIT=""
# # # do clone / pull
# # echo "cloning / pulling repository: $GATEWAY_DIR_NAME"
# # if [ -d "$PROJECT_DIR_PATH/" ] 
# # then
# #     echo "repo already exists in directory above; doing git pull" 
# #     pushd $PROJECT_DIR_PATH/$GATEWAY_DIR_NAME
# #     git pull
# # else
# #     echo "repo does not exist in directory above; doing git clone" 
# #     git clone $GITHUB_REPO_URL $PROJECT_DIR_PATH/$GATEWAY_DIR_NAME --quiet
# #     pushd  $PROJECT_DIR_PATH/$GATEWAY_DIR_NAME
# # fi
# # # git checkout $STABLE_COMMIT $PROJECT_DIR_PATH/$REPO_NAME --quiet
# # # git checkout main --quiet # THIS WILL CHECKOUT THE LATEST COMMIT...NEED TO BE IN GIT DIR THOUGH SO CD THERE FIRST
# # popd
