# -*- coding: utf-8 -*-
import json, random, MeCab, os
import codecs
import collections
import numpy as np
import dictionarize, in_out, neighbor_matrix

if __name__ == "__main__":
        files = os.listdir("data")

        #Unidentified two spaces
        num_patients = len(files)
	print "Number of Patient is %s"%num_patients

	m = MeCab.Tagger ("-Owakati")
	
	tmp = []
	fp = open("build/patient_id.txt", "w")
	for file in files:
                f = open("data/%s"%file, "r")
                text = f.read()
		tmp.append(in_out.parse_text(text, m))
	fp.close()

        print tmp

	#1文字ずつ分けて辞書作っている
	vec_corpus, index_corpus = dictionarize.vec(tmp)
	#vec_corpus, index_corpus = dictionarize.vec_oneword(tmp)

	np.save('build/patients.npy', vec_corpus)

	f = codecs.open("build/word_index.txt","w","utf-8")
	for word in index_corpus:
		f.write(word)
		f.write(",")
	f.close()

	#word neighbor MATRIX
	w_range = 5 #ここの実装はまだ
	sm_tensor = []
        
        for file in files:
                f = open("data/%s"%file, "r")
                text = f.read()
		arr_text = in_out.parse_text(text, m)
		mat = neighbor_matrix.neighbor_matrix(arr_text, index_corpus)
		sm_tensor.append(mat)
	np.save('build/Neighbor_mat.npy', sm_tensor)
	#tmp = np.load('processed_data/Neighbor_mat.npy')
