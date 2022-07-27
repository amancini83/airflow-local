# Setting the Airflow user
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

# Build images
COLOR_LIGHT_BLUE="$(tput setaf 81)"
COLOR_REST="$(tput sgr0)"
echo "$COLOR_LIGHT_BLUE 🧑‍🔧 Building docker-compose images... $COLOR_REST"
docker-compose build
echo "$COLOR_LIGHT_BLUE ✨ docker-compose images are built! $COLOR_REST"

# Done!
echo
echo "$COLOR_GREEN Airflow in Docker setup ready! ✨$COLOR_REST"
echo "$COLOR_MAGENTA     ./run.sh$COLOR_REST"