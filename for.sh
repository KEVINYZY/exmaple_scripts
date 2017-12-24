#!/usr/bin/env bash
# for.sh

for n in {1..10}; do
  echo $n
done

# 遍历数组
arry=("A" "B" "C" "D" "E" "F")
for a in ${arry[@]}; do
  echo $a
done

# 遍历数组下标与值
let len=(${#arry[@]} - 1)
for index in $(seq 0 ${len}); do
  vaule=${arry[index]}
  echo "下标: ${index} 值: ${vaule}"
done