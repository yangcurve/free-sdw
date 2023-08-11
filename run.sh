cd /content

env PYTHONDONTWRITEBYTECODE=1
env TF_CPP_MIN_LOG_LEVEL=1

apt -y update -qq
wget https://github.com/camenduru/gperftools/releases/download/v1.0/libtcmalloc_minimal.so.4 -O /content/libtcmalloc_minimal.so.4
env LD_PRELOAD=/content/libtcmalloc_minimal.so.4

apt -y install -qq aria2 libcairo2-dev pkg-config python3-dev
apt -y install -qq unionfs-fuse
pip install -q torch==2.0.0+cu118 torchvision==0.15.1+cu118 torchaudio==2.0.1+cu118 torchtext==0.15.1 torchdata==0.6.0 --extra-index-url https://download.pytorch.org/whl/cu118 -U
pip install -q xformers==0.0.19 triton==2.0.0 -U

mkdir /content/fused-models
mkdir /content/models
mkdir /content/fused-lora
mkdir /content/lora
unionfs-fuse /content/drive/MyDrive/stable-diffusion-webui/models/Stable-diffusion=RW:/content/models=RW /content/fused-models
unionfs-fuse /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-additional-networks/models/lora=RW:/content/drive/MyDrive/stable-diffusion-webui/models/Lora=RW:/content/lora=RW /content/fused-lora

cd /content/drive/MyDrive/stable-diffusion-webui

git reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/repositories/stable-diffusion-stability-ai reset --hard

git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-huggingface reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-huggingface pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-civitai-browser reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-civitai-browser pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-additional-networks reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-additional-networks pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/openpose-editor reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/openpose-editor pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-depth-lib reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-depth-lib pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/posex reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/posex pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-tunnels reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-tunnels pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/batchlinks-webui reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/batchlinks-webui pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-3d-open-pose-editor reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-3d-open-pose-editor pull
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-aspect-ratio-helper reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-aspect-ratio-helper pull

sed -i -e '''/    prepare_environment()/a\    os.system\(f\"""sed -i -e ''\"s/dict()))/dict())).cuda()/g\"'' /content/drive/MyDrive/stable-diffusion-webui/repositories/stable-diffusion-stability-ai/ldm/util.py""")''' /content/drive/MyDrive/stable-diffusion-webui/launch.py
sed -i -e 's/checkout {commithash}/checkout --force {commithash}/g' /content/drive/MyDrive/stable-diffusion-webui/launch.py

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://openaipublic.azureedge.net/clip/models/b8cca3fd41ae0c99ba7e8951adf17d267cdb84cd88be6f7c2e0eca1737a03836/ViT-L-14.pt -d /content/drive/MyDrive/stable-diffusion-webui/models/CLIP -o ViT-L-14.pt

python launch.py --listen --xformers --enable-insecure-extension-access --theme dark --gradio-queue --clip-models-path /content/drive/MyDrive/stable-diffusion-webui/models/CLIP --ckpt-dir /content/fused-models --lora-dir /content/fused-lora --multiple