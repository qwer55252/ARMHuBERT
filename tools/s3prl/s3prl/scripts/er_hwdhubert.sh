#!/bin/bash
cp -r downstream/emotion/* ../../tools/venv/lib/python3.10/site-packages/s3prl/downstream/emotion/

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

# usage: . scripts/er_hwdhubert.sh --gpu_idx 0 --model ../../../results/pretrain/hwdhubert-S-100h/last.ckpt --config ../../../results/pretrain/hwdhubert-S-100h/2024-11-15_10h54m26s.yaml --type hwdhubert --expdir hwdhubert-S-100h-ER

CUDA_VISIBLE_DEVICES=${gpu_idx} python3 run_downstream.py \
-m train \
-n ${expdir} \
-u ${type} \
-d emotion \
-k ${model} \
-c downstream/emotion/config.yaml \
-o "config.downstream_expert.datarc.test_fold='fold1'" \
-g $config