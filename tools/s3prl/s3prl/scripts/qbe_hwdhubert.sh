# usage: . ./scripts/qbe_mehubert.sh --gpu_idx 2 --model ../../MeHuBERT/results/pretrain/MeHuBERT-cnncopy-immediate-tcd-fzcnn/last.ckpt --config ../../MeHuBERT/results/pretrain/MeHuBERT-cnncopy-immediate-tcd-fzcnn/2024-08-07_11h41m53s.yaml --expdir MeHuBERT-cnncopy-immediate-tcd-fzcnn-QbE

dist_fn=cosine

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
        --layer)
            layer=$2
            shift 2
            ;;
    esac
done

CUDA_VISIBLE_DEVICES=${gpu_idx} python3 run_downstream.py -m evaluate -t 'test' -u $type \
-l ${layer} -d quesst14_dtw -n $expdir -o config.downsteam_expert.dtwrc.dist_method=$dist_fn \
-k $model -g $config