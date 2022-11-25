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
export AUCTIONS_SERVICE_DIR_NAME="auctions-service" # name of repo dir
export AUCTIONS_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME # path to repo
export AUCTIONS_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/auctions-service/" # path to dir holding dockerfile (file named "Dockerfile")
export AUCTIONS_IMG_NAME="auctions-service" # name for resultant image after building image
export AUCTIONS_POSTGRES_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/postgres/" # path to dir holding dockerfile for postgres
export AUCTIONS_POSTGRES_IMG_NAME="auctions-postgres-server" # name for resultant image after building image

echo $AUCTIONS_SERVICE_DIR_NAME
echo 
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
export CAM_SERVICE_DIR_NAME="closed-auction-metrics"
export CAM_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME
export CAM_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME/closed-auction-metrics/"
export CAM_IMG_NAME="cam-service"
export CAM_MONGO_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME/mongodb/"
export CAM_MONGO_IMG_NAME="cam-mongo-server"

echo $CAM_SERVICE_DIR_NAME
echo 
echo CAM_SERVICE_DIR_NAME=$CAM_SERVICE_DIR_NAME
echo CAM_SERVICE_DIR_PATH=$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME
echo CAM_IMG_DOCKERFILE=$CAM_IMG_DOCKERFILE
echo CAM_IMG_NAME=$CAM_IMG_NAME
echo CAM_MONGO_IMG_DOCKERFILE=$CAM_MONGO_IMG_DOCKERFILE
echo CAM_MONGO_IMG_NAME=$CAM_MONGO_IMG_NAME
echo









