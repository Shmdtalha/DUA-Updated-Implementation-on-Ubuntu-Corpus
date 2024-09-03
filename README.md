# DUA-Updated Implementation on Ubuntu Corpus

This repository provides an updated implementation of Modeling Multi-turn
Conversation with Deep Utterance Aggregation (DUA) on the Ubuntu Dialogue
Corpus.

All the code in this repository is meant to be run under python 3.5. Use 
`anaconda` or `miniconda` to set up an environment, and then run:

```bash
pip install -r requirements.txt
conda install conda-forge::pygpu==0.6.9
```

## Dataset

Place the dataset in any folder, for example: `data/`, such that `train.txt`
is located at `data/train.txt`. The format for each line in `train.txt`, 
`valid.txt`, and `test.txt` is:

```
label \t conversation utterances (\t separated) \t response
```

## Training

1. Training embeddings: `./embedding.sh ./data`
2. Preprocessing: `./preprocess.sh ./data`
3. Training: `./train.sh ./data`

To monitor training, run: `tail -f ./data/log`

## Evaluation

> [!NOTE]
> NOT IMPLEMENTED

## Acknowledgements

[DUA GitHub Repository](https://github.com/cooelf/DeepUtteranceAggregation) \
[Modeling Multi-turn Conversation with Deep Utterance Aggregation](https://aclanthology.org/C18-1317/)
