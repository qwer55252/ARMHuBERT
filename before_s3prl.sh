OUTPUT_DIR="hwdhubert"  # change
venv_dir=$PWD/tools/venv
python_ver="3.10"

rm -rf tools/s3prl/s3prl/upstream/$OUTPUT_DIR $venv_dir/lib/python${python_ver}/site-packages/s3prl/upstream/$OUTPUT_DIR
cp -r ./models/$OUTPUT_DIR tools/s3prl/s3prl/upstream/$OUTPUT_DIR

# add upstream importing line in <s3prl root>/s3prl/hub.py
# from s3prl.upstream.[model_name].hubconf import *
# Ex) from s3prl.upstream.armhubert.hubconf import *

rm -rf $venv_dir/lib/python${python_ver}/site-packages/s3prl/upstream $venv_dir/lib/python${python_ver}/site-packages/s3prl/hub.py
cp -r tools/s3prl/s3prl/upstream $venv_dir/lib/python${python_ver}/site-packages/s3prl/
cp -r tools/s3prl/s3prl/hub.py $venv_dir/lib/python${python_ver}/site-packages/s3prl/hub.py