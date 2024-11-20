#!/bin/bash
cp -r downstream/ctc/* ../../tools/venv/lib/python3.10/site-packages/s3prl/downstream/ctc/

while [[ $# -gt 0 ]]; do
    case "$1" in
        --gpu_idx)
            gpu_idx=$2
            shift 2
            ;;
        --model)
            model=$2
            shift 2
            ;;
        --config)
            config=$2
            shift 2
            ;;
        --type)
            type=$2
            shift 2
            ;;
        --expdir)
            expdir=$2
            shift 2
            ;;
    esac
done

# usage: . scripts/sf_mehubert.sh --gpu_idx 0 --model ../../MeHuBert/results/pretrain/MeHuBERT-tcd-cnncopy-immediate-rp6/last.ckpt --config ../../ARMHuBERT/results/pretrain/MeHuBERT-tcd-cnncopy-immediate-rp6/2024-08-07_11h51m22s.yaml --type mehubert --expdir MeHuBERT-tcd-cnncopy-immediate-rp6-SF

CUDA_VISIBLE_DEVICES=${gpu_idx} python3 run_downstream.py \
-m train \
-n ${expdir} \
-u ${type} \
-d ctc \
-k ${model} \
-g $config \
-c downstream/ctc/snips.yaml