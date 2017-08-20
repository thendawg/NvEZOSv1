#!/bin/bash
un="$(cat /nvezos/set/status/defaultuser.set)"
export DISPLAY=:0
sudo -u $un xhost +
nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:1]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:2]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:3]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:4]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:5]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:6]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:7]/GPUPowerMizerMode=1"
nvidia-settings -a "[gpu:0]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:1]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:2]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:3]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:4]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:5]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:6]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:7]/GPUGraphicsClockOffset[3]=0"
nvidia-settings -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:1]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:2]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:3]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:4]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:5]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:6]/GPUMemoryTransferRateOffset[3]=0"
nvidia-settings -a "[gpu:7]/GPUMemoryTransferRateOffset[3]=0"
sudo -u $un xhost -