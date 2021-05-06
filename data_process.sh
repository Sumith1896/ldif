# /home/ldif/ldif/gaps/bin/x86_64/msh2msh 875d75a0aef86850b6b87e72ead132ed.obj 875d75a0aef86850b6b87e72ead132ed.ply 
# /home/ldif/ldif/gaps/bin/x86_64/msh2msh 879a8f69cd931fe9f64801ad2940cdd5.obj 879a8f69cd931fe9f64801ad2940cdd5.ply 
# /home/ldif/ldif/gaps/bin/x86_64/msh2msh ffdaed95c3063cdf3ce4891c7dcdfb1c.obj ffdaed95c3063cdf3ce4891c7dcdfb1c.ply 
# /home/ldif/ldif/gaps/bin/x86_64/msh2msh fff513f407e00e85a9ced22d91ad7027.obj fff513f407e00e85a9ced22d91ad7027.ply 
# /home/ldif/ldif/gaps/bin/x86_64/msh2msh 876127a17b7285b3c1fbdb352261d023.obj 876127a17b7285b3c1fbdb352261d023.ply 
# /home/ldif/ldif/gaps/bin/x86_64/msh2msh 879ebdd198cf4aa58f6810e1a2b6aa04.obj 879ebdd198cf4aa58f6810e1a2b6aa04.ply 
# /home/ldif/ldif/gaps/bin/x86_64/msh2msh ffef991d85e3136a9a6e43b878d5b335.obj ffef991d85e3136a9a6e43b878d5b335.ply 

# mkdir /home/ldif/data/input_data_proc
# mkdir /home/ldif/data/input_data_proc/train
# mkdir /home/ldif/data/input_data_proc/train/02691156

# /home/ldif/ldif/gaps/bin/x86_64/msh2df 875d75a0aef86850b6b87e72ead132ed.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/875d75a0aef86850b6b87e72ead132ed.ply
# rm tmp.grd

# /home/ldif/ldif/gaps/bin/x86_64/msh2df 879a8f69cd931fe9f64801ad2940cdd5.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/879a8f69cd931fe9f64801ad2940cdd5.ply
# rm tmp.grd

# /home/ldif/ldif/gaps/bin/x86_64/msh2df ffdaed95c3063cdf3ce4891c7dcdfb1c.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/ffdaed95c3063cdf3ce4891c7dcdfb1c.ply
# rm tmp.grd

# /home/ldif/ldif/gaps/bin/x86_64/msh2df fff513f407e00e85a9ced22d91ad7027.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/fff513f407e00e85a9ced22d91ad7027.ply
# rm tmp.grd

# /home/ldif/ldif/gaps/bin/x86_64/msh2df 876127a17b7285b3c1fbdb352261d023.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/876127a17b7285b3c1fbdb352261d023.ply
# rm tmp.grd

# /home/ldif/ldif/gaps/bin/x86_64/msh2df 879ebdd198cf4aa58f6810e1a2b6aa04.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/879ebdd198cf4aa58f6810e1a2b6aa04.ply
# rm tmp.grd

# /home/ldif/ldif/gaps/bin/x86_64/msh2df ffef991d85e3136a9a6e43b878d5b335.ply tmp.grd -estimate_sign -spacing 0.002 -v
# /home/ldif/ldif/gaps/bin/x86_64/grd2msh tmp.grd /home/ldif/data/input_data_proc/train/02691156/ffef991d85e3136a9a6e43b878d5b335.ply
# rm tmp.grd

# nvidia-docker build -t ldif-docker .
# nvidia-docker run -it -v /viscam/u/sumith/ldif/data:/home/ldif/data -v /viscam/u/sumith/ldif/trained_models:/home/ldif/trained_models ldif-docker bash

python meshes2dataset.py --mesh_directory /home/ldif/data/input_data_proc \
  --dataset_directory /home/ldif/data/output_data

python train.py --dataset_directory /home/ldif/data/output_data \
  --experiment_name dummy_v01 --model_type ldif