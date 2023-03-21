#!/bin/bash

url="$1"

IFS=$'\n'

for header in $(curl -I "$url" | rg 'x-archive-orig-(date|last-modified)'); do
  key="${header%%: *}"
  value="${header#*: }"
  echo -n "$key: "
  gdate +'%Y-%m-%d %H:%M:%S %z' -d "$value"
done
