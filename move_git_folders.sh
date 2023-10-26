#!/bin/bash


push(){

folder_path=$1
dest_root_name=$2

for item in $folder_path/*
do
  root_folder_name=$(basename $item)
  dest_full_path=$dest_root_name/$root_folder_name
  mkdir $dest_full_path
  mv $folder_path/$root_folder_name/.git $dest_full_path
done
}

revert(){


folder_path=$1
dest_root_name=$2

for item in $folder_path/*
do
  root_folder_name=$(basename $item)
  dest_full_path=$dest_root_name/$root_folder_name
  mv $dest_full_path/.git $folder_path/$root_folder_name
done

}


if [ $# -lt 3 ]; then
  echo "Usage: sh script.sh function_name arg1 arg2"
  exit 1
fi

function_name=$1

case $function_name in
  push)
    push $2 $3
    ;;
  revert)
    revert $2 $3
    ;;
  *)
    echo "Invalid function name. Please choose from insert_data or drop_collection."
    exit 1
    ;;
esac
