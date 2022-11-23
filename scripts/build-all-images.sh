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
export POSTGRES_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/postgres/" # arbitrarily use dockerfile for postgres located in auctions repo
export POSTGRES_IMG_NAME="postgres-server"
echo POSTGRES_IMG_DOCKERFILE=$POSTGRES_IMG_DOCKERFILE
echo POSTGRES_IMG_NAME=$POSTGRES_IMG_NAME
echo "building Postgres image ($POSTGRES_IMG_NAME) from dockerfile..."
docker build -t "$POSTGRES_IMG_NAME:latest" $POSTGRES_IMG_DOCKERFILE
echo

export RABBITMQ_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/rabbitmq/"
export RABBITMQ_IMG_NAME="rabbitmq-server"
echo RABBITMQ_IMG_DOCKERFILE=$RABBITMQ_IMG_DOCKERFILE
echo RABBITMQ_IMG_NAME=$RABBITMQ_IMG_NAME
echo "building RabbitMQ image ($RABBITMQ_IMG_NAME) from dockerfile..."
docker build -t "$RABBITMQ_IMG_NAME:latest" $RABBITMQ_IMG_DOCKERFILE
echo

export AUCTIONS_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$AUCTIONS_SERVICE_DIR_NAME/auctions-service/"
export AUCTIONS_IMG_NAME="auctions-service"
echo AUCTIONS_IMG_DOCKERFILE=$AUCTIONS_IMG_DOCKERFILE
echo AUCTIONS_IMG_NAME=$AUCTIONS_IMG_NAME
echo "building AuctionsService ($AUCTIONS_IMG_NAME) image from dockerfile..."
docker build -t "$AUCTIONS_IMG_NAME:latest" $AUCTIONS_IMG_DOCKERFILE
echo

# closed-auction-metrics
export MONGO_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CLOSED_AUCTION_METRICS_SERVICE_DIR_NAME/mongodb/"
export MONGO_IMG_NAME="mongo-server"
echo MONGO_IMG_DOCKERFILE=$MONGO_IMG_DOCKERFILE
echo MONGO_IMG_NAME=$MONGO_IMG_NAME
echo "building Mongo image ($MONGO_IMG_NAME) from dockerfile..."
docker build -t "$MONGO_IMG_NAME:latest" $MONGO_IMG_DOCKERFILE
echo

export CLOSED_AUCTION_METRICS_IMG_DOCKERFILE="$PROJECT_DIR_PATH/$CLOSED_AUCTION_METRICS_SERVICE_DIR_NAME/closed-auction-metrics/"
export CLOSED_AUCTION_METRICS_IMG_NAME="closed-auction-metrics"
echo CLOSED_AUCTION_METRICS_IMG_DOCKERFILE=$CLOSED_AUCTION_METRICS_IMG_DOCKERFILE
echo CLOSED_AUCTION_METRICS_IMG_NAME=$CLOSED_AUCTION_METRICS_IMG_NAME
echo "building ClosedAuctionMetricsService ($CLOSED_AUCTION_METRICS_IMG_NAME) image from dockerfile..."
docker build -t "$CLOSED_AUCTION_METRICS_IMG_NAME:latest" $CLOSED_AUCTION_METRICS_IMG_DOCKERFILE
echo

echo "done"