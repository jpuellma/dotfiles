#!/usr/bin/env bash
slugify() {
  string="${*}"
  string="${string,,}"
  string="${string//[^[:alnum:]]/ }"
  string="$(echo "$string")"
  string="${string// /-}"
  echo "${string}"
}
