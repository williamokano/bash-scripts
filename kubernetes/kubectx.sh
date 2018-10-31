#!/bin/bash

options=$(kubectl config get-contexts -o name | awk '{print $0 " " $0}')

option=$(dialog \
    --stdout \
    --title 'Choose Context' \
    --menu 'Choose k8s context' \
    0 0 0 \
    $options)

if [ -n "$option" ];then
    kubectl config use-context $option
    dialog --title 'Context set' --msgbox "Context set to '$option'" 7 40
fi

clear