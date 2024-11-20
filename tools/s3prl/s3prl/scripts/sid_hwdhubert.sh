#!/bin/bash
cp -r downstream/speech_commands/* ../../tools/venv/lib/python3.10/site-packages/s3prl/downstream/speech_commands/

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

# usage: . scripts/sid_mehubert.sh --gpu_idx 0 --model ../../MeHuBert/results/pretrain/MeHuBERT-tcd-cnncopy-immediate-rp6/last.ckpt --config ../../ARMHuBERT/results/pretrain/MeHuBERT-tcd-cnncopy-immediate-rp6/2024-08-07_11h51m22s.yaml --type mehubert --expdir MeHuBERT-tcd-cnncopy-immediate-rp6-SID

CUDA_VISIBLE_DEVICES=${gpu_idx} python3 run_downstream.py \
-m train \
-n ${expdir} \
-u ${type} \
-d voxceleb1 \
-k ${model} \
-g $config \
-c downstream/voxceleb1/config.yaml