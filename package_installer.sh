#!/bin/bash
#
# Bash script to install required packages or tools after installation of new Operating System.
#
#  Authour: Anji Babu Kapakyala
#           Dept. of Chemistry
#           C/O Prof. Nisanth N. Nair
#           IIT Kanpur, India.
#
#
#  USAGE:
#
#
#  Packages List:
#		VMD
#		CHIMERA
#               Paymol
#   		molden
#		WPS Office
#		xfig
#		gv
#		tree
#		gnuplot
#		Autodoc
#		grace
#		Anaconda
#		Imp Libraries [ sudo apt-get install csh flex patch gfortran g++ make xorg-dev libbz2-dev zlib1g-dev libboost-dev libboost-thread-dev libboost-system-dev ffmpeg]
#         	Amber
#		Gromacs
#		Plumed
#		ParmEd
#		LateX
# 		SSH server
#		gwenview
#		mendely desktop
#		gimp
#		Teamviewer
#		sublimetext3 ot Atom
#		git
#               Dropbox Desktop Clint
# 		VLC
#		mutt
#		shc
#		pdftk
#		Trash-Cli
#		
#=======================================================================#
#  Defining Colors
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
reset=$(tput sgr0)
bold=$(tput bold)
#-----------------------------------------------------------------------#
# Check internet connection before starting installations
# Download packages by webpages using wget
# wget "http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb"						  #WPS OFFICE#
# wget "http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_i86Linux2_1.5.6.tar.gz"				  #ATODOC#
# wget "https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2"								  #SUBLIMETEXT3#
# wget "https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh"								  #ANACONDA#
# wget "https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.3-stable_amd64.deb"		  #MENDELEY#
# wget "https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"                                      			  #TEAMVIEWER#
# wget "https://www.cgl.ucsf.edu/chimera/cgi-bin/secure/chimera-get.py?file=alpha/chimera-alpha-linux_x86_64.bin"                         #CHIMERA#
# sudo snap install molden  #ref: https://blog.linuxcoffee.eu/install-molden-5-7-on-ubuntu-16-04/ #					  #MOLDEN#
# git clone "https://github.com/plumed/plumed2.git"											  #PLUMED2#
# wget "https://atom-installer.github.com/v1.34.0/atom-amd64.deb"         								  #ATOM#
# dpkg -i atom-amd64.deb
# wget "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.01.31_amd64.deb"  						  #Dropbox Desktop#

#  From Repositories
#  Paymol, xfig, gv, tree, gnuplot, grace, Imp libraries, gromacs, latex, ssh-server-update,gimp, gwenview, ffmpeg, git, vlc, mutt, 




#-----------------------------------------------------------------------#
function check_for_sudo_privileges() {
root=`id -u`
if [ $root -eq 0 ]; then                      # id -u = 0 for root ( default)
echo "$bold $red Installing as sudo user... $reset"
else
echo
echo "$bold $red Access denied $reset"
echo "$bold $red Sudo privileges are required to install packages $reset"
echo
exit
fi
}
#-------------------------------------------------#
function check_network() {
echo
echo " $bold $ylw Checking for the Network Information $reset "
echo
#ping -c 1 google.com &> /dev/null && echo "$bold Internet    :$bold $red  Connected $reset" || echo "$bold Internet    :$bold $red Disconnected $reset"
#-------------------------------------------------#
ping -c 1 google.com &> /dev/null
if [ $? -eq 0 ]
then
echo "$bold Internet    :$bold $red  Connected $reset"
else
echo "$bold Internet    :$bold $red Not Connected $reset"
echo "$bold $red Fix Network Connection to install packages $reset"
echo "$bold $blu Thank you $reset"
exit
fi
#-------------------------------------------------#
#/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
#IP=`/sbin/ifconfig p1p1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
IP=`/sbin/ifconfig |grep -A4 "encap:Ethernet"|grep "inet addr" | cut -d ":" -f2 |awk '{ print $1}'`
#cho -e "Your IP address : $IP "
#echo -e "\e[31;44m Your IP Address : $IP \e[0m"
#
domine=`cat /etc/resolv.conf | sed  '/^#/d' | awk '{print $2}'|sed -n '1p'`
DNS1=`cat /etc/resolv.conf | sed  '/^#/d' | awk '{print $2}'|sed -n '2p'`
DNS2=`cat /etc/resolv.conf | sed  '/^#/d' | awk '{print $2}'|sed -n '3p'`
Mask=`/sbin/ifconfig |grep -A4 "encap:Ethernet" |grep 'Mask' |awk '{ print $4 }' |cut -d ":" -f2`
Gateway=`/sbin/ifconfig |grep -A4 "encap:Ethernet" |grep 'Mask' |awk '{ print $3 }' |cut -d ":" -f2`
host=`hostname`
#user=`logname`
user=`echo $USER`
echo "$bold IP Address  :$blue $IP $reset"
echo "$bold Username    :$blue $user $reset"
echo "$bold Host        :$blue $host $reset"
echo "$bold Domine      :$blue $domine $reset"
echo "$bold Gateway     :$blue $Gateway $reset"
echo "$bold Subnet Mask :$blue $Mask $reset"
echo "$bold DNS 1       :$blue $DNS1 $reset"
echo "$bold DNS 2       :$blue $DNS2 $reset"
}
#----------------------------------------#
# Update the Repository
function update_repository() {
apt-get update
echo "$bold $red Updating App repository $reset"
}
#----------------------------------------#



#----------------------------------------#
#   MAIN CODE
#----------------------------------------#
check_for_sudo_privileges
check_network
#update_repository
