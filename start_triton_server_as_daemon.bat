echo "tritonserver --model-repository=/models --http-port=8006 --metrics-port=8008 --grpc-port=8007"
docker run --name=triton-inference-server --gpus=all -d -it --shm-size=256m --rm -p8000:8000 -p8001:8001 -p8002:8002 -v E:\coding\Machine_Learning\tc-triton-server\model_repo:/models nvcr.io/nvidia/tritonserver:23.11-py3

docker exec -it triton-inference-server tritonserver --model-repository=/models --exit-on-error=false
docker kill triton-inference-server
timeout 5
exit