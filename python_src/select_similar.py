# -*- coding: utf-8 -*-
import numpy as np
import in_out, os
	
def calc_dist(a, b):
	N = len(a)
	tmp_Matrix = a-b
	val = 0
	mat = np.fabs(tmp_Matrix)
	return mat.sum()

def find_similar_patient(pid, plist, tmp_m):
        min_value = 100000
        min_id = 0
        for i in plist:
                tmp_min = calc_dist(tmp_m[int(i)], tmp_m[int(pid)])
                if int(min_value) > int(tmp_min):
                        min_value = tmp_min
                        min_id = i
        return min_id

if __name__ == "__main__":
        files  = os.listdir("data")
        plist = np.arange(len(files))
        
        with open("build/Neighbor_mat.npy", "rb") as npy:
                tmp_m = np.load(npy)

        f = open("build/similar_list.txt", "w")
        for pid in plist:
	    similar_pid = find_similar_patient(pid, plist, tmp_m)
	    f.write(str(pid)) 
            f.write(",")
	    f.write(str(similar_pid)) 
            f.write("\n")
        f.close()
