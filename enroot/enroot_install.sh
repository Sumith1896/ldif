###################### Michael's starter script
# # Install required dependencies for igibson
# apt-get update && apt-get install -y --no-install-recommends \
#     cmake \
#     curl \
#     g++ \ 
#     git \
#     make \
#     vim \                                      
#     wget \
#     ssh-client \
#     cuda-command-line-tools-11-3 && \ 
#     rm -rf /var/lib/apt/lists/*


# # Install micromamba
# wget -qO- https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba    
# # Build environment
# micromamba create -f /Repositories/ssg/environment_torch_19.yml --yes
# # Set up shell hooks
# micromamba shell init -s bash
# # Set default conda environment
# echo "micromamba activate ssg_pytorch_19" >> /root/.bashrc
# # micromamba run -n ssg          
# cp -r /Repositories/ssg /ssg 
# rm -rf /ssg/dependencies/iGibson/igibson/render/openvr/samples
# cd /ssg 
# micromamba run -n ssg_pytorch_19 bash install.sh && rm -rf /root/.cache                            
# # Copy ssh key                   
# cp -r /ssh /root/.ssh

##########################
# apt-get update && apt-get install -y git wget build-essential vim && \
#  apt-get install -y mesa-common-dev libglew-dev libglu1-mesa-dev libosmesa6-dev libxi-dev libgl1-mesa-dev && \
#  apt-get install -y --reinstall libgl1-mesa-glx && \
#  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
#  bash Miniconda3-latest-Linux-x86_64.sh -b && \
#  rm -f Miniconda3-latest-Linux-x86_64.sh 

# sed -i 's/\#undef GLAPI/\/\* \#under GLAPI \*\//g' /usr/include/GL/glew.h

cd /ldif 
export PATH="/root/miniconda3/bin:${PATH}"
# conda env create --name ldif -f environment.yml  
# conda init bash
eval "$(conda shell.bash hook)"
conda activate ldif

# ./build_gaps.sh 
# ./gaps_is_installed.sh
# ./build_kernel.sh 
./unit_test.sh