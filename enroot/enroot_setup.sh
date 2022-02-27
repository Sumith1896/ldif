# Import docker container
enroot import docker://nvidia/cudagl:10.1-devel-ubuntu16.04
# Create the container                    
enroot create -n ldif_base nvidia+cudagl+10.1-devel-ubuntu16.04.sqsh
# Build container from install script 
enroot start --root --rw --mount enroot_install.sh:/enroot_install.sh --mount /viscam/u/sumith/ldif:/ldif --mount $HOME/.ssh:/ssh ldif_base sh enroot_install.sh
