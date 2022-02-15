ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

COPY ./apt_requirements.txt /tmp/apt_requirements.txt

RUN apt update && \
    apt install -y $(grep -v "^#" /tmp/apt_requirements.txt)

# Build RISCV toolchain
ENV RISCV_TOOLCHAIN_DOWNLOAD_DIR=/tmp/riscv-gnu-toolchain
ENV RISCV_TOOLCHAIN_INSTALL_DIR=/opt/riscv_toolchain
RUN git clone https://github.com/riscv/riscv-gnu-toolchain ${RISCV_TOOLCHAIN_DOWNLOAD_DIR} && \
    cd ${RISCV_TOOLCHAIN_DOWNLOAD_DIR} && \
    ./configure \
    --prefix=${RISCV_TOOLCHAIN_INSTALL_DIR} \
    --with-arch=rv32imc \
    --with-abi=ilp32 && \
    make -j $(nproc) && \
    rm -rf ${RISCV_TOOLCHAIN_DOWNLOAD_DIR}
ENV PATH=${RISCV_TOOLCHAIN_INSTALL_DIR}/bin:${PATH}

# Build Magic VLSI
ENV MAGIC_VLSI_DOWNLOAD_DIR=/tmp/magic_vlsi
ENV MAGIC_VLSI_INSTALL_DIR=/opt/magic_vlsi
RUN git clone https://github.com/RTimothyEdwards/magic.git ${MAGIC_VLSI_DOWNLOAD_DIR} && \
    cd ${MAGIC_VLSI_DOWNLOAD_DIR} && \
    ./configure --prefix=${MAGIC_VLSI_INSTALL_DIR} --without-x && \
    make && \
    make install && \
    rm -rf ${MAGIC_VLSI_DOWNLOAD_DIR}
ENV PATH=${MAGIC_VLSI_INSTALL_DIR}/bin:${PATH}

# Build the PDKS with sram
# This copy should be removed in the future and volumes should be preferred
ARG CARAVEL_BUILD_DIRECTORY=/tmp/caravel_user_project
COPY . ${CARAVEL_BUILD_DIRECTORY}
ENV PDK_ROOT=/tmp/pdks
WORKDIR ${CARAVEL_BUILD_DIRECTORY}
RUN make install && \
    make install_mcw && \
    make pdk-with-sram && \
    rm -rf ${CARAVEL_BUILD_DIRECTORY}
