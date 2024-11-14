# Install 
sudo apt-get install sox ffmpeg

# Setup virtual environment
. ./setup_cuda_env.sh /usr/local/cuda
. ./setup_anaconda.sh venv base 3.10.12

# Setup virtual environment
pip install pip==24.0
. ./activate_python.sh && pip install torch==2.1.0+cu121 torchvision==0.16.0+cu121 torchaudio==2.1.0+cu121 -f https://download.pytorch.org/whl/torch_stable.html

pip install -r ../requirements.txt
