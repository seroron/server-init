#!/bin/bash

show_help()
{
    echo "Usage: ./setup.sh <role>"
    echo ""
    echo "Enable roles:"
    echo "   all <- execute all roles"
    for i in `ls roles/ | sed -E 's/^[0-9]+_//g'`; do
        echo "   $i"
    done
}

if [ $# -ne 1 ]; then
    show_help
    
elif [ $1 = "all" ]; then
    for i in roles/*/setup.sh; do
        echo "execute: $i"
        bash $i
    done

else
    b=0
    for i in roles/*; do
        r=$(echo $i | sed -E 's/^roles\/[0-9]+_//g')
        if [ "$r" = "$1" -a -f "$i/setup.sh" ]; then
           b=1
           echo "execute: $i"
           bash $i
        fi
    done

    if [ $b -eq 0 ]; then
        echo "role '$1' is not found."
        show_help
    fi
fi
