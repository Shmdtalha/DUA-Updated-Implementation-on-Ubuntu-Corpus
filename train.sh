#!/bin/sh
THEANO_FLAGS='floatX=float32,device=cuda0' python main.py \
	--dataset "$1/all" \
	--save_result "$1/log" \
	--n_epoch 5 \
	--batch_size 10 \
	--max_length 50 \
	--hidden_size 200 \
	--word_embedding_size 200 \
	--session_hidden_size 50 \
	--session_input_size 50 \
	--model_name DUA.bin \
	--val_frequency 10 \
	--max_turn 10
