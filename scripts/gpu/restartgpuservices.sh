#!/bin/bash
sleep 1
sudo systemctl restart gpuoc.service
sleep 2
sudo systemctl restart gpufan.service
sleep 2
sudo systemctl restart gpupl.service

