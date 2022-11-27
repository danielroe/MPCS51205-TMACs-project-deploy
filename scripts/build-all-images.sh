PATH_TO_DIR_HOLDING_THIS_SCRIPT==$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# silence the outputs of pushd, popd ocmmands
pushd () {
    command pushd "$@" > /dev/null
}
popd () {
    command popd "$@" > /dev/null
}

# (1) RUN set-env-vars.sh IF IT APPEARS PROJECT ENV VARS HAVE NOT BEEN SET
if [[ -z "${PROJECT_DIR_PATH}" ]]; then
    echo "project environment vars do not appear to be set...running set-env-vars.sh"
    . $PATH_TO_DIR_HOLDING_THIS_SCRIPT/set-env-vars.sh
else
    echo "project environment vars appear already set..."
fi

# (2) run clone-or-pull-repos.sh
# . $PATH_TO_DIR_HOLDING_THIS_SCRIPT/clone-or-pull-repos.sh

# (3) build the necessary images

# stop script upon encountering the first error
# without closing terminal window
set -e

#####
# this script builds all images for the project from
# dockerfiles
#####

# need: location of docker file for the image you want to build
# need: a name for the image you are going to create

echo
echo RUNNING SCRIPT TO BUILD PROJECT IMAGES...
echo SCRIPT_DIR=$SCRIPT_DIR
echo

# we create each image from a docker file, using the docker command:
# 'docker build -t IMAGETAGNAME:VERSION PATHTODOCKERFILE'

# auctions-service
# export POSTGRES_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/postgres/" # arbitrarily use dockerfile for postgres located in auctions repo
# export AUCTIONS_POSTGRES_IMG_NAME="postgres-server"
# echo POSTGRES_IMG_DOCKERFILE=$POSTGRES_IMG_DOCKERFILE
# echo AUCTIONS_POSTGRES_IMG_NAME=$AUCTIONS_POSTGRES_IMG_NAME
echo "building Postgres image ($AUCTIONS_POSTGRES_IMG_NAME) from dockerfile..."
docker build -t "$AUCTIONS_POSTGRES_IMG_NAME:latest" $AUCTIONS_POSTGRES_IMG_DOCKERFILE
echo

# export RABBITMQ_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/rabbitmq/"
# export RABBITMQ_IMG_NAME="rabbitmq-server"
# echo RABBITMQ_IMG_DOCKERFILE=$RABBITMQ_IMG_DOCKERFILE
# echo RABBITMQ_IMG_NAME=$RABBITMQ_IMG_NAME
echo "building RabbitMQ image ($RABBITMQ_IMG_NAME) from dockerfile..."
docker build -t "$RABBITMQ_IMG_NAME:latest" $RABBITMQ_IMG_DOCKERFILE
echo

# export AUCTIONS_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/auctions-service/"
# export AUCTIONS_IMG_NAME="auctions-service"
# echo AUCTIONS_IMG_DOCKERFILE=$AUCTIONS_IMG_DOCKERFILE
# echo AUCTIONS_IMG_NAME=$AUCTIONS_IMG_NAME
echo "building AuctionsService ($AUCTIONS_IMG_NAME) image from dockerfile..."
docker build -t "$AUCTIONS_IMG_NAME:latest" $AUCTIONS_IMG_DOCKERFILE
echo

# closed-auction-metrics

# export CAM_MONGO_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CLOSED_AUCTION_METRICS_SERVICE_DIR_NAME/CAM_MONGOdb/"
# export CAM_MONGO_IMG_NAME="cam-mongo-server"
# echo CAM_MONGO_IMG_DOCKERFILE=$CAM_MONGO_IMG_DOCKERFILE
# echo CAM_MONGO_IMG_NAME=$CAM_MONGO_IMG_NAME
echo "building CAM_MONGO image ($CAM_MONGO_IMG_NAME) from dockerfile..."
docker build -t "$CAM_MONGO_IMG_NAME:latest" $CAM_MONGO_IMG_DOCKERFILE
echo

# export CAM_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CAM_SERVICE_DIR_NAME/closed-auction-metrics/"
# export CAM_IMG_NAME="cam-service"
echo CAM_IMG_DOCKERFILE=$CAM_IMG_DOCKERFILE
echo CAM_IMG_NAME=$CAM_IMG_NAME
echo "building ClosedAuctionMetricsService ($CAM_IMG_NAME) image from dockerfile..."
docker build -t "$CAM_IMG_NAME:latest" $CAM_IMG_DOCKERFILE
echo


# user-service
echo "building user-service image ($USER_SERVICE_IMG_NAME) from dockerfile..."
docker build -t $USER_SERVICE_IMG_NAME $USER_SERVICE_IMG_DOCKERFILE
# docker build -t maven/builder:user-service $USER_SERVICE_IMG_DOCKERFILE

# watchlist-service
echo "building watchlist-service image ($WATCHLIST_IMG_NAME) from dockerfile..."
docker build -t $WATCHLIST_IMG_NAME $WATCHLIST_IMG_DOCKERFILE

# user-service
echo "building user-service image ($ITEM_IMG_NAME) from dockerfile..."
docker build -t $ITEM_IMG_NAME $ITEM_IMG_DOCKERFILE

# notification-service
echo "building notification-service image ($NOTIFICATION_IMG_NAME) from dockerfile..."
docker build -t $NOTIFICATION_IMG_NAME $NOTIFICATION_IMG_DOCKERFILE

# gateway
echo "building gateway image ($GATEWAY_IMG_NAME) from dockerfile..."
docker build -t $GATEWAY_IMG_NAME $GATEWAY_IMG_DOCKERFILE

# # gateway-python
# echo "building gateway-python image ($GATEWAY_PY_IMG_NAME) from dockerfile..."
# docker build -t $GATEWAY_PY_IMG_NAME $GATEWAY_PY_IMG_DOCKERFILE

echo "done"