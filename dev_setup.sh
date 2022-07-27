# Setting the Airflow user
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

# Build images
COLOR_LIGHT_BLUE="$(tput setaf 81)"
COLOR_REST="$(tput sgr0)"
echo "$COLOR_LIGHT_BLUE 🧑‍🔧 Building docker-compose images... $COLOR_REST"
docker-compose build
echo "$COLOR_LIGHT_BLUE ✨ docker-compose images are built! $COLOR_REST"


# Setup DBs
echo "$COLOR_LIGHT_BLUE 🧑‍🔧 Initializing Databases... $COLOR_REST"
docker-compose up airflow-init
echo "$COLOR_LIGHT_BLUE ✨ DBs ready to go! $COLOR_REST"

echo "$COLOR_LIGHT_BLUE ✨ Airflow is ready to go! $COLOR_REST"
echo "$COLOR_MAGENTA     ./run.sh $COLOR_REST"