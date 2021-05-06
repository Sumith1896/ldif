import os
import sys
from pathlib import Path
from shutil import copy

shapes = ['04379243', '03001627']
splits = ['train', 'test', 'val']

data_source = Path('/viscam/u/sumith/sandbox/occupancy_networks/data/ShapeNet')
data_dest = Path('/viscam/u/sumith/ldif/data/ShapeNet')

def process(shape, split):
    models = []
    model_file = data_source / shape / (split + '.lst')
    with open(model_file, 'r') as f:
        models = [x.strip() for x in f.readlines()]
    for model in models:
        source_path = data_source / shape / model / 'mesh.ply'
        dest_path = data_dest / shape / split / (model + '.ply')
        copy(source_path, dest_path)

for shape in shapes:
    for split in splits:
        process(shape, split)