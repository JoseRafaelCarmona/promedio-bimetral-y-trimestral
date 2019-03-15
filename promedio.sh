#!/bin/bash
con=0
tri=0;
con1=0
num=0
prom=3
resultado=0
year=1990
opcionB=""
opcionT=""
opcionH=""
opcionM=""
while getopts ":bt" opt; do
    case $opt in
        b)
            opcionB="1"
        ;;
        t)
            opcionT="1"
        ;;
        h)
            opcionH="1"
        ;;
        m)
            opcionM="1"
        ;;
        "?")
            echo "opcion invalida -$OPTARG";
            opcionH="1"
            exit ;
            ;;
        :)
    esac
done
shift $((OPTIND-1)) 

if [ $opcionT ]; then
    for line in $(cat $1); do
        num=$line
        let con=con+1;
        let con1=con1+1;
        echo $line
        #suma=$(($suma + $num))
        suma=`echo $suma + $num | bc`
        if [ $con -eq 3 ]; then 
            let tri=tri+1;
            echo "++++++  AÑO: $year  ++++++"
            resultado=$(echo "scale=6;$suma / 3" | bc)
            #resultado=`echo $suma / $prom | bc`
            echo "$resultado" >> trimestral.txt
            #echo "$promedio" >> trimestral.txt
            echo " "
            echo "*********************************************"
            suma=0
            con=0
        fi
        if [ $con1 -eq 12 ]; then
            let year=year+1;
            con1=0
        fi
    done
fi 

if [ $opcionB ]; then
    for line in $(cat $1); do
        num=$line
        let con=con+1;
        let con1=con1+1;
        echo $line
        #suma=$(($suma + $num))
        suma=`echo $suma + $num | bc`
        if [ $con -eq 2 ]; then 
            let tri=tri+1;
            echo "++++++  AÑO: $year  ++++++"
            resultado=$(echo "scale=6;$suma / 2" | bc)
            #resultado=`echo $suma / $prom | bc`
            echo "su promedio es: $resultado"
            echo "$resultado" >> bimestral.txt
            echo " "
            echo "*********************************************"
            suma=0
            con=0
        fi
        if [ $con1 -eq 12 ]; then
            let year=year+1;
            con1=0
        fi
    done
fi 

if [ $opcionM ]; then
    echo "Este script realiza el promedio de que esta en un archivo de texto"
    for line in $(cat $1); do
        num=$line
        let con=con+1;
        let con1=con1+1;
        echo $line
        #suma=$(($suma + $num))
        suma=`echo $suma + $num | bc`
        if [ $con -eq 3 ]; then 
            let tri=tri+1;
            echo "++++++  AÑO: $year  ++++++"
            resultado=$(echo "scale=6;$suma / 3" | bc)
            #resultado=`echo $suma / $prom | bc`
            echo "$resultado" >> trimestral.txt
            #echo "$promedio" >> trimestral.txt
            echo " "
            echo "*********************************************"
            suma=0
            con=0
        fi
        if [ $con1 -eq 12 ]; then
            let year=year+1;
            con1=0
        fi
    done
fi