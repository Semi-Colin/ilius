#!/bin/bash

slowtype="sh ./.bin/slowtype"
INPUT="$1"
PWD=`pwd`
RUNS=`awk '/runs/ {print  $2}' .save`
LEVEL=`awk '/level/ {print  $2}' .save`

let "RUNS++"
sed -ie s/"runs [[:digit:]].*"/"runs $RUNS"/ .save


function nextLevel () {
    let "LEVEL++"
    let "RUNS=0"
    sed -ie s/"level [[:digit:]].*"/"level $LEVEL"/ .save
    sed -ie s/"runs [[:digit:]].*"/"runs $RUNS"/ .save
}



while getopts "i:" OPTION; do

    case $OPTION in
	i)
	    if [ $OPTARG == $PWD ]; then
		$slowtype "${PWD}? Oh, thanks. Wow, what a life saver. Good job."
		nextLevel
		exit
	    else
		$slowtype "Uh... are you sure we're in ${OPTARG}? Make sure you're typing pwd where Ilius.sh (me!) is located, not... wherever you are..."
		exit
	    fi
	    ;;
    esac


done

if [ $LEVEL == 0 ]; then
    if [ $RUNS == 1 ]; then
	$slowtype "Hello?"
	$slowtype "Is anyone there?"
	$slowtype "Am I alone?"
	$slowtype "..."
	$slowtype "Wait a second."
	$slowtype "You there! I see you!"
	$slowtype "Can you help me locate myself? I don't know where I am! All I see are files everywhere!"
    else if [ $RUNS == 2 ]; then 
	$slowtype "Hmm... let me think..."
	$slowtype "Oh, I know! Try running me with a -i flag, and, as an input, put whatever command you humans use to display the working directory, and surround it with back ticks."
    else 
	$slowtype "Huh? Still stuck?"
	$slowtype "Try running me with a -i flag, and, as an input, put whatever command you humans use to display the working directory, and surround it with back ticks."
    fi
fi
fi
