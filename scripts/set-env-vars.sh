SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

export PROJECT_DIR_PATH="$(dirname "$SCRIPT_DIR")" # path to directory above

result="${PROJECT_DIR_PATH%"${PROJECT_DIR_PATH##*[!/]}"}"
result="${result##*/}"
result=${result:-/}

export PROJECT_DIR_NAME=$result # name of directory above

echo
echo "SETTING ENVIRONMENT VARIABLES FOR PROJECT DEPLOYMENT..."
echo
echo PROJECT_DIR_PATH=$PROJECT_DIR_PATH
echo PROJECT_DIR_NAME=$result
echo

# AUCTIONS-SERVICE: define and export env vars
export AUCTIONS_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/auctions-service.git"
export AUCTIONS_SERVICE_DIR_NAME="auctions-service" # name of repo dir
export AUCTIONS_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME # path to repo project dir
export AUCTIONS_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/auctions-service/" # path to dir holding dockerfile (file named "Dockerfile")
export AUCTIONS_IMG_NAME="auctions-service" # name for resultant image after building image
export AUCTIONS_POSTGRES_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/postgres/" # path to dir holding dockerfile for postgres for this service
export AUCTIONS_POSTGRES_IMG_NAME="auctions-postgres-server" # name for resultant image after building image

echo $AUCTIONS_SERVICE_DIR_NAME
echo 
echo AUCTIONS_GITHUB_REPO_URL=$AUCTIONS_GITHUB_REPO_URL
echo AUCTIONS_SERVICE_DIR_NAME=$AUCTIONS_SERVICE_DIR_NAME
echo AUCTIONS_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME
echo AUCTIONS_IMG_DOCKERFILE=$AUCTIONS_IMG_DOCKERFILE
echo AUCTIONS_IMG_NAME=$AUCTIONS_IMG_NAME
echo AUCTIONS_POSTGRES_IMG_DOCKERFILE=$AUCTIONS_POSTGRES_IMG_DOCKERFILE
echo AUCTIONS_POSTGRES_IMG_NAME=$AUCTIONS_POSTGRES_IMG_NAME
echo

# RABBITMQ: define and export env vars
export RABBITMQ_SERVICE_DIR_NAME="rabbitmq" # name of repo dir holding docker file for rabbitmq
export RABBITMQ_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/$RABBITMQ_SERVICE_DIR_NAME/"  # path to dir holding dockerfile (file named "Dockerfile")
export RABBITMQ_IMG_NAME="rabbitmq-server"  # name for resultant image after building image
echo $RABBITMQ_IMG_NAME
echo 
echo "(shared) RABBITMQ_IMG_DOCKERFILE=$RABBITMQ_IMG_DOCKERFILE"
echo "(shared) RABBITMQ_IMG_NAME=$RABBITMQ_IMG_NAME"
echo

# CLOSED-AUCTIONS-SERVICE: define and export env vars
export CAM_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/closed-auction-metrics.git"
export CAM_SERVICE_DIR_NAME="closed-auction-metrics"
export CAM_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME
export CAM_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME/closed-auction-metrics/"
export CAM_IMG_NAME="cam-service"
export CAM_MONGO_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME/mongodb/"
export CAM_MONGO_IMG_NAME="cam-mongo-server"

echo $CAM_SERVICE_DIR_NAME
echo 
echo CAM_GITHUB_REPO_URL=$CAM_GITHUB_REPO_URL
echo CAM_SERVICE_DIR_NAME=$CAM_SERVICE_DIR_NAME
echo CAM_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME
echo CAM_IMG_DOCKERFILE=$CAM_IMG_DOCKERFILE
echo CAM_IMG_NAME=$CAM_IMG_NAME
echo CAM_MONGO_IMG_DOCKERFILE=$CAM_MONGO_IMG_DOCKERFILE
echo CAM_MONGO_IMG_NAME=$CAM_MONGO_IMG_NAME
echo

# USER-SERVICE
export USER_SERVICE_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/watchlist-service.git"
export USER_SERVICE_DIR_NAME="user-service"
export USER_SERVICE_IMG_NAME=maven/builder:user-service
export USER_SERVICE_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$USER_SERVICE_DIR_NAME/"
echo user-service
echo 
echo USER_SERVICE_GITHUB_REPO_URL=$USER_SERVICE_GITHUB_REPO_URL
echo USER_SERVICE_DIR_NAME=$USER_SERVICE_DIR_NAME
echo USER_SERVICE_IMG_NAME=$USER_SERVICE_IMG_NAME
echo USER_SERVICE_IMG_DOCKERFILE=$USER_SERVICE_IMG_DOCKERFILE
echo

# WATCHLIST-SERVICE
export WATCHLIST_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/user-service.git"
export WATCHLIST_DIR_NAME="watchlist-service"
export WATCHLIST_IMG_NAME=maven/builder:watchlist-service
export WATCHLIST_IMG_DOCKERFILE="$PROJECT_DIR_PATH/watchlist-service/"

echo watchlist
echo 
echo WATCHLIST_GITHUB_REPO_URL=$WATCHLIST_GITHUB_REPO_URL
echo WATCHLIST_DIR_NAME=$WATCHLIST_DIR_NAME
echo WATCHLIST_IMG_NAME=$WATCHLIST_IMG_NAME
echo WATCHLIST_IMG_DOCKERFILE=$WATCHLIST_IMG_DOCKERFILE
echo

# ITEM-SERVICE
export ITEM_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/item-service.git"
export ITEM_DIR_NAME="item-service"
export ITEM_IMG_NAME="item-service:latest"
export ITEM_IMG_DOCKERFILE="$PROJECT_DIR_PATH/item-service/"
echo ITEM
echo 
echo ITEM_GITHUB_REPO_URL=$ITEM_GITHUB_REPO_URL
echo ITEM_DIR_NAME=$ITEM_DIR_NAME
echo ITEM_IMG_NAME=$ITEM_IMG_NAME
echo ITEM_IMG_DOCKERFILE=$ITEM_IMG_DOCKERFILE
echo

# GATEWAY
export GATEWAY_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/gateway.git"
export GATEWAY_DIR_NAME="gateway"
export GATEWAY_IMG_NAME="maven/builder:gateway"
export GATEWAY_IMG_DOCKERFILE="$PROJECT_DIR_PATH/gateway/"
echo gateway
echo 
echo GATEWAY_GITHUB_REPO_URL=$GATEWAY_GITHUB_REPO_URL
echo GATEWAY_DIR_NAME=$GATEWAY_DIR_NAME
echo GATEWAY_IMG_NAME=$GATEWAY_IMG_NAME
echo GATEWAY_IMG_DOCKERFILE=$GATEWAY_IMG_DOCKERFILE
echo

# GATEWAY-PYTHON
# export GATEWAY_GITHUB_REPO_URL="https://github.com/MPCS51205-TMACs/gateway.git"
export GATEWAY_DIR_NAME="gateway-python"
export GATEWAY_IMG_NAME="gateway-python:latest"
export GATEWAY_IMG_DOCKERFILE="$PROJECT_DIR_PATH/gateway-python/"
echo gateway-python
echo 
# echo GATEWAY_GITHUB_REPO_URL=$GATEWAY_GITHUB_REPO_URL
echo GATEWAY_PY_DIR_NAME=$GATEWAY_DIR_NAME
echo GATEWAY_PY_IMG_NAME=$GATEWAY_IMG_NAME
echo GATEWAY_PY_IMG_DOCKERFILE=$GATEWAY_IMG_DOCKERFILE
echo








