#!/usr/bin/env bash
# filename: format_str.sh

upper() {
  # 所有小写转大写
  # [root@vpnserver tmp]# upper "abc"
  # ABC
  [[ $# -eq 0 ]] && return 1
  local replace=$1
  echo "$replace" | tr [a-z] [A-Z]
  return
}

lower() {
  # 所有大写转小写
  # [root@vpnserver tmp]# lower "ABC"
  # abc
  [[ $# -eq 0 ]] && return 1
  local replace=$1
  echo "$replace" | tr [A-Z] [a-z]
  return
}

reverse() {
  # 字符串翻转
  # [root@python ~]# reversal 'abc'
  # cba
  [[ $# -eq 0 ]] && return 1
  local replace=$1
  echo "$replace" | rev
  return
}

len() {
  # 获取字符串长度
  # [root@vpnserver tmp]# len "abcdefg"
  # 7
  [[ $# -eq 0 ]] && return 1
  local string=$1
  echo ${#string}
  return
}

strip() {
  # 切掉字符串空格
  # [root@vpnserver tmp]# echo  "    a   b  c  d    f   " | sed  -n 's/ //gp'
  # abcdf
  [[ $# -eq 0 ]] && return 1
  local string=$1
  echo ${string} | sed -n 's/ //gp'
  return
}