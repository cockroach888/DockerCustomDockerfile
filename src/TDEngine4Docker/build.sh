#!/bin/bash
#

set -e
#set -x

# build.sh 
#             -c [arm64 | aarch64 | x64 | amd64]
#             -n [version number]
#             -f [package file]

# set parameters by default value
cpuType=""
cpuTypeAlias=""
version=""
pkgFile=""


while getopts "hc:n:f:" arg
do
  case $arg in
    c)
      #echo "cpuType=$OPTARG"
      cpuType=$(echo $OPTARG)
      ;;
    n)
      #echo "version=$OPTARG"
      version=$(echo $OPTARG)
      ;;
    f)
      #echo "pkgFile=$OPTARG"
      pkgFile=$(echo $OPTARG)
      ;;
    h)
      echo "Usage: `basename $0`  -c [arm64 | aarch64 | x64 | amd64] "
      echo "                      -n [version number] "
      echo "                      -f [package file] "
      exit 0
      ;;
    ?) #unknow option 
      echo "unkonw argument"
      exit 1
      ;;
  esac
done


dockername=${cpuType}
rm -rf ./setup/
mkdir ./setup/
cp -f /D/Software/TDengine/v${version}/${pkgFile}  ./setup/
cp ../refs/* ./setup/


echo "cpuType=${cpuType} version=${version} pkgFile=${pkgFile}"
echo "====NOTES: ${pkgFile} must be in the same directory as build.sh===="


if [[ "${cpuType}" == "x64" ]] || [[ "${cpuType}" == "amd64" ]]; then
    cpuTypeAlias="amd64"
elif [[ "${cpuType}" == "aarch64" ]] || [[ "${cpuType}" == "arm64" ]]; then
    cpuTypeAlias="arm64"
else
    echo "Unknown cpuType: ${cpuType}"
    exit 1
fi


docker build --rm -f "Dockerfile" --network=host -t tdengine/tdengine-${dockername}:${version} "." --build-arg FILENAME=${pkgFile} --build-arg CPUTYPE=${cpuTypeAlias}

rm -rf ./setup/