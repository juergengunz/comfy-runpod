# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.1.0-base

# install custom nodes using comfy-cli
RUN comfy-node-install rgthree-comfy ComfyUI_UltimateSDUpscale comfyui-propost comfyui_face_parsing

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/SG161222/RealVisXL_V5.0_Lightning/resolve/main/RealVisXL_V5.0_Lightning_fp16.safetensors --relative-path models/checkpoints --filename realvisxlV50_v50LightningBakedvae.safetensors
RUN comfy model download --url https://huggingface.co/juergengunz/skin-lora/resolve/main/skin_4-000015.safetensors --relative-path models/loras --filename skin_4-000015.safetensors
RUN comfy model download --url https://huggingface.co/juergengunz/skin-lora/resolve/main/8xNMKDFaces160000G_v10.pt --relative-path models/upscale_models --filename 8xNMKDFaces160000G_v10.pt

