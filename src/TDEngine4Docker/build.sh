#!/bin/bash
#

set -e
#set -x

# build.sh 
#             -n [version number]
#             -f [package file]
#             -s [true is use slim | false is not]

# set parameters by default value
version=""
pkgFile=""
slimFlag="false"
slimFlagAlias=""


while getopts "hn:f:s:" arg
do
  case $arg in
    n)
      #echo "version=$OPTARG"
      version=$(echo $OPTARG)
      ;;
    f)
      #echo "pkgFile=$OPTARG"
      pkgFile=$(echo $OPTARG)
      ;;
    s)
      #echo "slimFlag=$OPTARG"
      slimFlag=$(echo $OPTARG)
      ;;
    h)
      echo "Usage: `basename $0`  -n [version number] "
      echo "                      -f [package file] "
      echo "                      -s [true is use slim | false is not] "
      exit 0
      ;;
    ?) #unknow option 
      echo "unkonw argument"
      exit 1
      ;;
  esac
done


if [ "${slimFlag}" == "true" ]; then
  slimFlagAlias="-slim"
fi


dockername=${slimFlagAlias}
dockerFileName="Dockerfile${slimFlagAlias}"

rm -rf ./setup/
mkdir ./setup/
cp -f /D/Software/TDengine/v${version}/${pkgFile}  ./setup/
cp ../refs/* ./setup/


echo "version=${version} pkgFile=${pkgFile}"
echo "====NOTES: ${pkgFile} must be in the same directory as build.sh===="


docker build --rm -f ${dockerFileName} --network=host -t tdengine/tdengine${dockername}:${version} "." --build-arg FILENAME=${pkgFile}

rm -rf ./setup/
