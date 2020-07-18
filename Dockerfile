FROM deb_build_base:latest

ENV CONFIG_CROSS_COMPILER_PATH=/home/itron/uboot-toolchain/buildroot-gcc342/bin

USER root
RUN apt-get install -y gcc-multilib 
USER itron

RUN git clone --branch itronhab01 git@github.com:fherbert/linkit-smart-7688-uboot.git u-boot && \
    mkdir /home/itron/uboot-toolchain && tar xvfj u-boot/buildroot-gcc342.tar.bz2 -C /home/itron/uboot-toolchain
RUN cd u-boot && git pull && make 
WORKDIR /home/itron/u-boot

CMD ["bash"]
