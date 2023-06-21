#!/bin/bash

#Fix build fail cause by HOME or tmp disk not enough issue
source ./home_tmp_set.sh
#Fix vek280 part not found in 2023.1 issue
source ./enable_beta_device.sh

export XILINXD_LICENSE_FILE=2100@aiengine-eng

source /proj/xbuilds/2023.1_daily_latest/installs/lin64/Vitis/2023.1/settings64.sh

source /proj/petalinux/2023.1/petalinux-v2023.1_daily_latest/tool/petalinux-v2023.1-final/settings.sh

export BASE_XSA=/proj/xbuilds/2023.1_daily_latest/internal_platforms/xilinx_vek280_es1_base_202310_1/hw/hw.xsa

#export SYSROOT=/proj/xbuilds/2023.1_daily_latest/internal_platforms/sw/versal/xilinx-versal-common-v2023.1/sysroots/cortexa72-cortexa53-xilinx-linux/

#There is a petalinux minal build bug which add vdu patcket for all board that may have on vdo in part
#This issue happen after CR-1152465, and 0131 and before build is still work
export PTLNX_BSP=/proj/petalinux/2023.1/petalinux-v2023.1_01311535/bsp/release/xilinx-vek280-es1-v2023.1-final.bsp

cd ../

source ./settings.sh

cd ./designs/xgemm-gmio
LINUX="linux"
make AIEARCH=aie-ml OS=$LINUX

make AIEARCH=aie-ml OS=baremetal