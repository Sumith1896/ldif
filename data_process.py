import os
import sys
import numpy as np
from pathlib import Path
from shutil import copy
from joblib import Parallel, delayed

shapes = ['04379243', '03001627']
splits = ['train', 'test', 'val']

data_source = Path('/viscam/u/sumith/sandbox/occupancy_networks/data/ShapeNet')
data_dest = Path('/viscam/u/sumith/ldif/data/ShapeNet')


def process_model(model, shape, split, data_dest, data_source):
    (data_dest / split / shape / model).mkdir(parents=True, exist_ok=True)
    source_path = data_source / shape / model / 'mesh.ply'
    dest_path = data_dest / split / shape / model / 'mesh.ply'
    copy(source_path, dest_path)
    return 0

def process(shape, split):
    (data_dest / split).mkdir(parents=True, exist_ok=True)
    (data_dest / split / shape).mkdir(parents=True, exist_ok=True)
    models = []
    model_file = data_source / shape / (split + '.lst')
    with open(model_file, 'r') as f:
        models = [str(x.strip()) for x in f.readlines()]

    for model in models:
        process_model(model, shape, split, data_dest, data_source)
    # import ipdb; ipdb.set_trace()
    # x = Parallel(n_jobs=20, backend='multiprocessing')\
    #     (delayed(process_model)((model, shape, split, data_dest, data_source) for model in models))

    # x = Parallel(n_jobs=20, backend='multiprocessing')\
    #     (delayed(np.sqrt)(i**2) for i in range(10000))

for shape in shapes:
    for split in splits:
        process(shape, split)

