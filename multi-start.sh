#!/bin/bash

conf=multi-config.ini
bin=./multi-example/helloworld2

for((proc_id=0; proc_id<8; ++proc_id))
do
    if ((proc_id == 0))
    then
        echo "${bin} --conf ${conf} --proc-type=primary --proc-id=${proc_id} ${proc_id}"
        ${bin} --conf ${conf} --proc-type=primary --proc-id=${proc_id} ${proc_id} &
        sleep 5
    else
        echo "${bin} --conf ${conf} --proc-type=secondary --proc-id=${proc_id} ${proc_id}"
        ${bin} --conf ${conf} --proc-type=secondary --proc-id=${proc_id} ${proc_id} &
    fi
done
