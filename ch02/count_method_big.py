import sys
sys.path.append('..')
import numpy as np
from common.util import most_similar, create_co_matrix, ppmi
from dataset import ptb

window_size = 2
wordvec_size = 100

corpus, word_to_id, id_to_word = ptb.load_data('train')
vocab_size = len(word_to_id)
print('Counting co-occurrence ...')
C = create_co_matrix(corpus, vocab_size, window_size)
print('Calculating PPMI ...')
W = ppmi(C, verbose=True)
print("Calculating SVD ...")
U, S, V = np.linalg.svd(W)

word_vecs = U[:, :wordvec_size]

queries = ['you', 'year', 'car', 'toyota']
for q in queries:
    most_similar(q, word_to_id, id_to_word, word_vecs, top=5)
