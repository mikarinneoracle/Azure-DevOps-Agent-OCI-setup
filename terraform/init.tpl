#!/bin/bash

mkdir -p /home/opc/myagent && cd /home/opc/myagent
chown opc:opc /home/opc/myagent

wget ${filename} -O vsts-agent-linux-x64.tar.gz
chown opc:opc vsts-agent-linux-x64.tar.gz
tar zxvf vsts-agent-linux-x64.tar.gz

export AGENT_ALLOW_RUNASROOT=1

sh config.sh --unattended --url ${url} --auth PAT --token ${pat} --pool ${pool} > config.out

nohup sh run.sh > nohup.out