#!/usr/bin/env bash
# filename: format_str.sh

# 字符串练习，把一些功能写成函数，
# 类似于python字符串提供的功能一样

upper() {
  # 所有小写转大写
  # [root@localhost ~]# upper "abc"
  # ABC
  [[ $# -eq 0 ]] && return 1
  local replace=$@
  echo "$replace" | tr [a-z] [A-Z]
  return
}

lower() {
  # 所有大写转小写
  # [root@localhost ~]# lower "ABC"
  # abc
  [[ $# -eq 0 ]] && return 1
  local replace=$@
  echo "$replace" | tr [A-Z] [a-z]
  return
}

reverse() {
  # 字符串翻转
  # [root@localhost ~]# reversal 'abc'
  # cba
  [[ $# -eq 0 ]] && return 1
  local replace=$@
  echo "$replace" | rev
  return
}

len() {
  # 获取字符串长度
  # [root@localhost ~]# len "abcdefg"
  # 7
  [[ $# -eq 0 ]] && return 1
  local string=$@
  echo ${#string}
  return
}

strip() {
  # 切掉字符串空格
  # [root@localhost ~]# echo  "    a   b  c  d    f   " | sed  -n 's/ //gp'
  # abcdf
  [[ $# -eq 0 ]] && return 1
  local string=$@
  echo ${string} | sed -n 's/ //gp'
  return
}

isupper() {
  # [root@localhost ~]# isupper "ABC"
  # [root@localhost ~]# echo $?
  # 0
  # [root@localhost ~]# isupper "ABc"
  # [root@localhost ~]# echo $?
  # 1
  # if isupper "abc" &> /dev/null ; then
  #   echo "true"
  # else
  #   echo "false"
  # fi
  [[ $# -eq 0 ]] && return 1
  local string=$@
  if [[ ${string} == $(upper ${string}) ]]; then
    return
  fi
  return 1
}

islower() {
  # [root@localhost ~]# islower "ABC"
  # [root@localhost ~]# echo $?
  # 0
  # [root@localhost ~]# islower "ABc"
  # [root@localhost ~]# echo $?
  # 1
  # if islower "abc" &> /dev/null ; then
  #   echo "true"
  # else
  #   echo "false"
  # fi
  [[ $# -eq 0 ]] && return 1
  local string=$@
  if [[ ${string} == $(lower ${string}) ]]; then
    return 0
  else
    return 1
}