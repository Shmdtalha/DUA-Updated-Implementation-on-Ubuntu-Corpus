#!/bin/sh
python PreProcess.py \
	--train_dataset "$1/train.txt" \
	--valid_dataset "$1/valid.txt" \
	--test_dataset "$1/test.txt" \
	--pretrained_embedding "$1/embedding" \
	--save_dataset "$1/all"
