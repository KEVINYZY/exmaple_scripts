#!/usr/bin/env bash
# filename: ping.sh
# 功能：
# ping 172.16.0.1至172.16.0.254之间的主机
# 如果通显示绿色(up)
# 否则显示红色(down)
# 并且写入日志(/tmp/ping.log)

log="/tmp/ping.log"

# 常量
GREEN="\e[1;32m"
RED="\e[1;31m"
YELLOW="\e[1;33m"
END="\e[1;0m"

green() {
  # 绿色输出
  local msg=$@
  [[ -z ${msg} ]] && return 2
  echo -e "${GREEN}${msg}${END}"
}

red() {
  # 红色输出
  local msg=$@
  [[ -z ${msg} ]] && return 2
  echo -e "${RED}${msg}${END}"
}

yellow() {
  # 黄色输出
  local msg=$@
  [[ -z ${msg} ]] && return 2
  echo -e "${YELLOW}${msg}${END}"
}

for n in {1..254}; do
  ip="172.16.0.${n}"
  ping -c1 -i0.5 ${ip} &> /dev/null
  if [[ $? -eq 0 ]]; then
    msg_up=$(green "${ip} is up.")
    echo $msg_up | tee -a $log
  else
    msg_down=$(red "${ip} is down.")
    echo $msg_down | tee -a $log
  fi
done

# sh ping.sh    //执行结果
# 172.16.0.1 is up.
# 172.16.0.2 is down.
# 172.16.0.3 is down.
# 172.16.0.4 is down.
# 172.16.0.5 is down.
# 172.16.0.6 is down.
# 172.16.0.7 is down.
# 172.16.0.8 is down.
# 172.16.0.9 is down.
# 172.16.0.10 is down.
# 172.16.0.11 is down.
# 172.16.0.12 is down.
# 172.16.0.13 is down.
