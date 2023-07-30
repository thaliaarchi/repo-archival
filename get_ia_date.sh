#!/bin/bash

url="$1"

IFS=$'\n'

for header in $(curl -Is "$url" | rg 'x-archive-orig-(date|last-modified)'); do
  key="${header%%: *}"
  value="${header#*: }"
  echo -n "$key: "
  TZ="${TZ-UTC}" gdate +'%Y-%m-%d %H:%M:%S %z' -d "$value"
done
