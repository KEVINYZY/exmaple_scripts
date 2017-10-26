#!/usr/bin/env bash

# 逐行读取文件, 对每行进行处理
while read line; do
  echo $line
done < /etc/passwd

# 统计每行有多少字符数
while read line; do
  count=$(echo ${line} | wc -L)
  echo "${line}: ${count}"
done < /etc/passwd

# 每2s监控下网站(获取状态码)
while true; do
  status_code=$(curl -I http://www.baidu.com -w %{http_code} -o /dev/null --silent)
  if [[ ${status_code} -ne 200 ]]; then
    echo 'service is down!'
  fi
  sleep 2
done


