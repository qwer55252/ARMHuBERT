venv_dir=$PWD/tools/venv
python_ver="3.10"

w2v2="fairseq/models/wav2vec"
rm -rf $venv_dir/lib/python${python_ver}/site-packages/${w2v2}/wav2vec2.py
cp code_dumps/${w2v2}/wav2vec2.py $venv_dir/lib/python${python_ver}/site-packages/${w2v2}

mha="fairseq/modules"
rm -rf $venv_dir/lib/python${python_ver}/site-packages/${mha}/multihead_attention.py
cp code_dumps/${mha}/multihead_attention.py $venv_dir/lib/python${python_ver}/site-packages/${mha}