#!/bin/bash
clear
echo "Info: Checking for the HPLIP latest version .."
FIND_STRING="latest_version = "
VERSION_HPLIP=`curl -s "http://hplip.sourceforge.net/hplip_web.conf" | grep "${FIND_STRING}" | sed -e "s/${FIND_STRING}//g;s/<\/p>//g"`
if [ -z ${VERSION_HPLIP} ]; then
	clear
	echo "Error: Can't get HPLIP latest version, please try again .."
	sleep 3
	exit 0
fi
FILENAME_HPLIP="hplip-${VERSION_HPLIP}.run"
PATHNAME_HPLIP="/tmp/UPDATEHPLIP${RANDOM}"
echo "Info: Downloading ${FILENAME_HPLIP} now .."
mkdir ${PATHNAME_HPLIP}
wget -N -P ${PATHNAME_HPLIP} http://jaist.dl.sourceforge.net/project/hplip/hplip/${VERSION_HPLIP}/${FILENAME_HPLIP}
if [ ! -f ${PATHNAME_HPLIP}/${FILENAME_HPLIP} ]; then 
	clear
	echo "Error: Can't get HPLIP file, please try again .."
	sleep 3
	exit 0
fi
echo "Info: Downloaded ${FILENAME_HPLIP} file at  .. ${PATHNAME_HPLIP}"
echo "Info: Ready to Execute ${FILENAME_HPLIP} ..."
sleep 3
bash ${PATHNAME_HPLIP}/${FILENAME_HPLIP}
echo "Info: Install and Update HPLIP to the latest version finish！！"
sleep 3
