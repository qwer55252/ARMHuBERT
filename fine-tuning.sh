python ./s3prl/s3prl/run_downstream.py \
-m train \
-u armhubert \
-n ARMHuBERT-ASR \
-d asr \
-k /home/kobie/workspace/weights/ARMHuBERT-960h.ckpt \
-g /home/kobie/workspace/ARMHuBERT/results/pretrain
  # You can set your exp name whatever you want

# /home/kobie/workspace/ARMHuBERT/s3prl/s3prl/run_downstream.py