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

# usage: . scripts/ks_mehubert.sh --gpu_idx 0 --model ../../MeHuBERT/results/pretrain/MeHuBERT-tcd-cnncopy-immediate/last.ckpt --config ../../MeHuBERT/results/pretrain/MeHuBERT-tcd-cnncopy-immediate/2024-07-30_23h53m27s.yaml --type mehubert --expdir MeHuBERT-tcd-cnncopy-immediate-KS

CUDA_VISIBLE_DEVICES=${gpu_idx} python3 run_downstream.py \
-m train \
-n ${expdir} \
-u ${type} \
-d speech_commands \
-k ${model} \
-g $config \
-c downstream/speech_commands/config.yaml