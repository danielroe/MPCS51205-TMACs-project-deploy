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

# postgres (for auctions-service)
echo "building Postgres image ($AUCTIONS_POSTGRES_IMG_NAME) from dockerfile..."
docker build -t "$AUCTIONS_POSTGRES_IMG_NAME:latest" $AUCTIONS_POSTGRES_IMG_DOCKERFILE --no-cache

# rabbitmq (using dockerfile from auctions-service)
echo "building RabbitMQ image ($RABBITMQ_IMG_NAME) from dockerfile..."
docker build -t "$RABBITMQ_IMG_NAME:latest" $RABBITMQ_IMG_DOCKERFILE --no-cache

# auctions-service
echo "building AuctionsService ($AUCTIONS_IMG_NAME) image from dockerfile..."
docker build -t "$AUCTIONS_IMG_NAME:latest" $AUCTIONS_IMG_DOCKERFILE  --no-cache

# closed-auction-metrics
echo "building CAM_MONGO image ($CAM_MONGO_IMG_NAME) from dockerfile..."
docker build -t "$CAM_MONGO_IMG_NAME:latest" $CAM_MONGO_IMG_DOCKERFILE --no-cache

# closed-auction-metrics
echo "building ClosedAuctionMetricsService ($CAM_IMG_NAME) image from dockerfile..."
docker build -t "$CAM_IMG_NAME:latest" $CAM_IMG_DOCKERFILE --no-cache

# user-service
echo "building user-service image ($USER_SERVICE_IMG_NAME) from dockerfile..."
docker build -t $USER_SERVICE_IMG_NAME $USER_SERVICE_IMG_DOCKERFILE --no-cache

# watchlist-service
echo "building watchlist-service image ($WATCHLIST_IMG_NAME) from dockerfile..."
docker build -t $WATCHLIST_IMG_NAME $WATCHLIST_IMG_DOCKERFILE --no-cache

# item-service
echo "building item-service image ($ITEM_IMG_NAME) from dockerfile..."
docker build -t $ITEM_IMG_NAME $ITEM_IMG_DOCKERFILE --no-cache

# notification-service
echo "building notification-service image ($NOTIFICATION_IMG_NAME) from dockerfile..."
docker build -t $NOTIFICATION_IMG_NAME $NOTIFICATION_IMG_DOCKERFILE --no-cache

# shopping-cart-service
echo "building shopping-cart-service image ($SHOPPING_CART_IMG_NAME) from dockerfile..."
docker build -t $SHOPPING_CART_IMG_NAME $SHOPPING_CART_IMG_DOCKERFILE --no-cache

# gateway
echo "building gateway image ($GATEWAY_IMG_NAME) from dockerfile..."
docker build -t $GATEWAY_IMG_NAME $GATEWAY_IMG_DOCKERFILE --no-cache

# # gateway-python
# echo "building gateway-python image ($GATEWAY_PY_IMG_NAME) from dockerfile..."
# docker build -t $GATEWAY_PY_IMG_NAME $GATEWAY_PY_IMG_DOCKERFILE --no-cache

echo "done"