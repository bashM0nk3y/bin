#!/bin/sh

# like all my code it could probably be improved quite a bit but it does a good job!
#
# give it a name and run it with:
#
# script reponame
#
# you can add 'all':
#
# script reponame all - and it will tell you what isn't installed as well - i wouldn;t use it for extra and base tho but good for personal repos.
#
# You can save the pkg names that are installed to a file and simply do:
#
# pacman -R `cat file`
#
# to remove all the stuff from that repo - obviously use such stuff with caution - that's why it's not and option in the script.
#

pacman -Qi >./all_files

if [ -z "$1" ] ; then
    echo -e "33[0;37mNo repo given!"
    echo " usage: scriptname reponame"
fi

reponame=$1
list=$1_list
pacman -Sl $reponame >./$list
sed -i "s|$reponame |g|" ./$list
repo=`cat ./$list | cut --fields 2 --delim " "`

for pkg in $repo ; do
    if [[ $(cat ./all_files | grep -w "$pkg") ]] ; then
        echo -e "33[0;34m$pkg33[0;37m is installed"
        echo "$pkg" >>./installed_files
    elif [ "$2" == "all" ] ; then
        echo -e "33[0;31m$pkg33[0;37m is NOT installed"
    fi
done

echo
echo -n "Would you like to save the names of these pkgs to a file? (Y/n) "
read choice
if [ "$choice" == "Y" -o  "$choice" == "y" ] ; then
    echo "Currently in `pwd`"
    echo -n "    Save as: "
    read filename
    if [ -z $filename ] ; then
        echo "No name given saved as ./installed_files_$reponame"
        cp -u ./installed_files ./installed_files_$reponame
    else
        cp -u ./installed_files $filename
    fi
    rm ./installed_files
else
    rm ./installed_files
fi
rm ./$list ./all_files
