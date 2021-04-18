
#!/usr/bin/env bash

#LABEL script to build docker image delete docker file and directory

echo "What name would you like your dir to be called ?: "

read ifolder

mkdir ${ifolder} && cd ${ifolder} && touch dockerfile

echo "What is your base OS ? centos, alpine or ubuntu ?:"

read iname

echo "What port do you want to use ?: "

read p

echo "what version do you want to use ?: "

read MYV

if [[ ${iname} = centos ]];then
echo -e "FROM ${iname}:${MYV}""\nMAINTAINER ${USER}""\nEXPOSE ${p}""\nRUN yum update -y" > dockerfile
echo "Building ${iname} image."
 elif
 [[ ${iname} = alpine ]];then
 echo -e "FROM ${iname}:${MYV}""\nMAINTAINER ${USER}""\nEXPOSE ${p}""\nRUN apk update" > dockerfile
 echo "Building ${iname} image."
  else
  if
  [[ ${iname} = ubuntu ]]; then
  echo -e "FROM ${iname}:${MYV}""\nMAINTAINER ${USER}""\nRUN apt-get update -y""\nEXPOSE ${p}" > dockerfile
  echo "Building ${iname} image."
fi
 fi

docker image build -t ${USER}_${iname} .
if [[ $? -eq 0 ]];
then
rm -f dockerfile
cd -
rm -r ${ifolder}
echo "${iname} image built successfully and dockerfile and directory deleted."
exit 0
fi
