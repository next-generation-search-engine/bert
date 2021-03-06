# Path to the pre-trained model
BERT_BASE_DIR=/data/uncased_L-12_H-768_A-12

# Path to the squad dataset
SQUAD_DIR=/data/squad1

# Path to the checkpoint folder
OUTPUT_DIR=./tmp/squad_base_kungfu

# Path to the kungfu-run executable
KUNGFU_RUN=$HOME/KungFu/bin/kungfu-run

$KUNGFU_RUN -np 4 python3 run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v1.1.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v1.1.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$OUTPUT_DIR
