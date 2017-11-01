#!/usr/bin/env bash
# filename: getopts.sh
# getopts是一个内置的命令行参数解析工具, 用它可以使你的脚本支持命令参数
# 用法: getopts optstr varname


while getopts :abc:d: argv; do
   case $argv in
     a) echo "-a选项的效果" ;;
     b) echo "-b选项的效果" ;;
     c) echo "-c选项的效果及参数值 ${OPTARG}" ;;
     d) echo "-d选项的效果及参数值 ${OPTARG}" ;;
   [?]) echo "无效的选项" ;;
     :) echo "选项丢失参数值" ;;
   esac
done

# (:abc:d:e) 这部分是optstr(选项), 使用的时候它会赋值给变量argv
# 像ab这种没有冒号的代表是普通选项，用的时候是(-a、-b)这样用
# 而像c:d:这种后面有冒号的选项, 必须要加参数值，用的时候是[-c xxx  -d xxx]这样用
# 第一个冒号代表, 如果选项不存在那么argv的值为？，如果选项没有参数则argv的值为: (建议)

# 执行结果
# [root@localhost tmp]# ./getopts.sh -a
# -a选项的效果
# [root@localhost tmp]# ./getopts.sh -b
# -b选项的效果
# [root@localhost tmp]# ./getopts.sh -ab
# -a选项的效果
# -b选项的效果
# [root@localhost tmp]# ./getopts.sh -c xxx
# -c选项的效果及参数值 xxx
# [root@localhost tmp]# ./getopts.sh -c 
# 选项丢失参数值
# [root@localhost tmp]# ./getopts.sh -f
# 无效的选项