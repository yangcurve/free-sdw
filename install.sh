cd /content

env PYTHONDONTWRITEBYTECODE=1

apt-get -y install -qq aria2 libcairo2-dev pkg-config python3-dev

git clone -b v2.2 https://github.com/camenduru/stable-diffusion-webui /content/drive/MyDrive/stable-diffusion-webui
git -C /content/drive/MyDrive/stable-diffusion-webui checkout -f v2.2
git -C /content/drive/MyDrive/stable-diffusion-webui reset --hard
git -C /content/drive/MyDrive/stable-diffusion-webui pull origin v2.2
git clone https://huggingface.co/embed/negative /content/drive/MyDrive/stable-diffusion-webui/embeddings/negative
git clone https://huggingface.co/embed/lora /content/drive/MyDrive/stable-diffusion-webui/models/Lora/positive
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/upscale/resolve/main/4x-UltraSharp.pth -d /content/drive/MyDrive/stable-diffusion-webui/models/ESRGAN -o 4x-UltraSharp.pth
wget https://raw.githubusercontent.com/camenduru/stable-diffusion-webui-scripts/main/run_n_times.py -O /content/drive/MyDrive/stable-diffusion-webui/scripts/run_n_times.py
rm -rf /content/drive/MyDrive/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui
git clone https://github.com/deforum-art/deforum-for-automatic1111-webui /content/drive/MyDrive/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui
rm -rf /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/camenduru/stable-diffusion-webui-images-browser /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/camenduru/stable-diffusion-webui-huggingface /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-huggingface
rm -rf /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-civitai-browser
git clone https://github.com/camenduru/sd-civitai-browser /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-civitai-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-additional-networks
rm -rf /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/Mikubill/sd-webui-controlnet /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet
rm -rf /content/drive/MyDrive/stable-diffusion-webui/extensions/openpose-editor
git clone https://github.com/fkunn1326/openpose-editor /content/drive/MyDrive/stable-diffusion-webui/extensions/openpose-editor
git clone https://github.com/jexom/sd-webui-depth-lib /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-depth-lib
git clone https://github.com/hnmr293/posex /content/drive/MyDrive/stable-diffusion-webui/extensions/posex
git clone https://github.com/nonnonstop/sd-webui-3d-open-pose-editor /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-3d-open-pose-editor
git clone https://github.com/camenduru/sd-webui-tunnels /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-tunnels
git clone https://github.com/etherealxx/batchlinks-webui /content/drive/MyDrive/stable-diffusion-webui/extensions/batchlinks-webui
rm -rf /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone https://github.com/camenduru/stable-diffusion-webui-catppuccin /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg
git clone https://github.com/ashen-sensored/stable-diffusion-webui-two-shot /content/drive/MyDrive/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-aspect-ratio-helper
cd /content/drive/MyDrive/stable-diffusion-webui

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

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11e_sd15_ip2p_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11e_sd15_shuffle_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_canny_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11f1p_sd15_depth_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_inpaint_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_lineart_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_mlsd_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_mlsd_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_normalbae_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_normalbae_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_openpose_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_scribble_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_scribble_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_seg_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_seg_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_softedge_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15s2_lineart_anime_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile_fp16.safetensors -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11f1e_sd15_tile_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11e_sd15_ip2p_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11e_sd15_ip2p_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11e_sd15_shuffle_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11e_sd15_shuffle_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_canny_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_canny_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11f1p_sd15_depth_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11f1p_sd15_depth_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_inpaint_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_inpaint_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_lineart_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_lineart_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_mlsd_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_mlsd_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_normalbae_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_normalbae_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_openpose_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_openpose_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_scribble_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_scribble_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_seg_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_seg_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_softedge_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_softedge_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15s2_lineart_anime_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15s2_lineart_anime_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11f1e_sd15_tile_fp16.yaml -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11f1e_sd15_tile_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_style_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_style_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_sketch_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_sketch_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_seg_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_seg_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_openpose_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_openpose_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_keypose_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_keypose_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_depth_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_depth_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_color_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_color_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_canny_sd14v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_canny_sd14v1.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_canny_sd15v2.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_canny_sd15v2.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_depth_sd15v2.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_depth_sd15v2.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_sketch_sd15v2.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_sketch_sd15v2.pth
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/t2iadapter_zoedepth_sd15v1.pth -d /content/drive/MyDrive/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o t2iadapter_zoedepth_sd15v1.pth

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/sd15/resolve/main/v1-5-pruned-emaonly.ckpt -d /content/drive/MyDrive/stable-diffusion-webui/models/Stable-diffusion -o v1-5-pruned-emaonly.ckpt

sed -i -e 's/    start()/    #start()/g' /content/drive/MyDrive/stable-diffusion-webui/launch.py
sed -i -e 's/checkout {commithash}/checkout --force {commithash}/g' /content/drive/MyDrive/stable-diffusion-webui/launch.py

mkdir /content/drive/MyDrive/stable-diffusion-webui/models/CLIP

cd /content/drive/MyDrive/stable-diffusion-webui
python launch.py --skip-torch-cuda-test