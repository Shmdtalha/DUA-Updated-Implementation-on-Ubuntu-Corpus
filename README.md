# DUA-Updated Implementation on Ubuntu Corpus
This repository provides an updated implementation of Modeling Multi-turn Conversation with Deep Utterance Aggregation (DUA) on the Ubuntu Dialogue Corpus.
## Requirements
gensim \
numpy \
scipy \
scikit-learn

## Install Theano
This implementation uses the [Theano GitHub Repository](https://github.com/sklearn-theano/sklearn-theano). The last two lines allow for installation while suppressing output.
```python
!git clone https://github.com/sklearn-theano/sklearn-theano 2>&1 >/dev/null
%cd sklearn-theano
!python setup.py develop 2>&1 >/dev/null
!python setup.py install 2>&1 >/dev/null
```

## Dataset
If you want to train this model on the Ubuntu Corpus Dataset, you can access the files here: [Ubuntu Dialogue Corpus](https://drive.google.com/drive/folders/1cm1v3njWPxG5-XhEUpGH25TMncaPR7OM?usp=sharing) 

## Pretraining
The word2vec model needs to be pretrained before preprocessing begins.
```python
!python train_word2vec.py ./data/train.txt embedding
```

## Preprocessing
Before preprocessing, a few modifications are required to Theano. Instead of using the code below, you may modify the lines in the files directly. These are provided to indicate the changes required.
```python
with open('/usr/local/lib/python3.10/dist-packages/theano/configdefaults.py', 'r') as file:
    lines = file.readlines()

# Modify line 1284
lines[1283] = "            blas_info = np.distutils.__config__.blas_ilp64_opt_info\n"

with open('/usr/local/lib/python3.10/dist-packages/theano/configdefaults.py', 'w') as file:
    file.writelines(lines)

with open('/usr/local/lib/python3.10/dist-packages/theano/scalar/basic.py', 'r') as file:
    lines = file.readlines()

# Modify line 2323
lines[2322] = "        self.ctor = bool\n"

with open('/usr/local/lib/python3.10/dist-packages/theano/scalar/basic.py', 'w') as file:
    file.writelines(lines)

with open('/usr/local/lib/python3.10/dist-packages/theano/tensor/basic.py', 'r') as file:
    lines = file.readlines()

# Modify line 2323
lines[380] = "        complex(data, 0)  # works for all numeric scalars"

with open('/usr/local/lib/python3.10/dist-packages/theano/tensor/basic.py', 'w') as file:
    file.writelines(lines)
```
Now preprocessing can begin. You may use the ECD samples as well.
```python
!python PreProcess.py --train_dataset ./data/train.txt --valid_dataset ./data/valid.txt --test_dataset ./data/test.txt --pretrained_embedding embedding --save_dataset ./data/all
```

## Training
Set the Theano environment variable first
```python
import os
os.environ['THEANO_FLAGS'] = 'floatX=float32'
```
Now, you may begin training
```python
!bash train.sh
```

## Evaluation
```python
!python data/evaluation.py
```
If you would like to evaluate the model without training, use the checkpoint files. \
[DUA Checkpoint Files](https://drive.google.com/file/d/1ne0SJ_5YVTmajYcdkJdT5VWy4y0gsZvQ/view?usp=drive_link)
## Monitoring Output
You may view the outputs by viewing the output log manually or using the following script. This will assist with debugging if you plan to use a different dataset.
```python
!watch -n 1 cat output.log
```
## Acknowledgements
[DUA GitHub Repository](https://github.com/cooelf/DeepUtteranceAggregation) \
[Modeling Multi-turn Conversation with Deep Utterance Aggregation](https://aclanthology.org/C18-1317/)
