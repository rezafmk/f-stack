#!/bin/bash

conf=multi-config
bin=./multi-example/helloworld2

for((proc_id=0; proc_id<4; ++proc_id))
do
    if ((proc_id == 0))
    then
        echo "${bin} --conf ${conf}${proc_id}.ini --proc-type=primary --proc-id=${proc_id} ${proc_id}"
        ${bin} --conf ${conf}${proc_id}.ini --proc-type=primary --proc-id=${proc_id} ${proc_id} &
        sleep 5
    else
        echo "${bin} --conf ${conf}${proc_id}.ini --proc-type=secondary --proc-id=${proc_id} ${proc_id}"
        ${bin} --conf ${conf}${proc_id}.ini --proc-type=secondary --proc-id=${proc_id} ${proc_id} &
    fi
done

ff_ifconfig f-stack-0 10.250.136.101 netmask 255.255.255.255 alias
ff_ifconfig f-stack-0 10.250.136.102 netmask 255.255.255.255 alias
ff_ifconfig f-stack-0 10.250.136.103 netmask 255.255.255.255 alias