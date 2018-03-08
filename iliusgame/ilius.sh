#!/bin/bash

slowtype="sh ./.bin/slowtype" && #Defines where the slowtype program is
INPUT="$1"
PWD=`pwd`
RUNS=`awk '/runs/ {print  $2}' .save` && #Number of times program has run, reset every level
LEVEL=`awk '/^level/ {print  $2}' .save` && #Current level

let "RUNS++" 
#Increments RUNS by one every time the program is run
sed -ie s/"runs [[:digit:]].*"/"runs $RUNS"/ .save 
#Updates save file with appropriate information

function nextLevel () {
    let "LEVEL++" 
    #Increments level count  
    let "RUNS=0" 
    #Increments run count

    sed -ie s/"level [[:digit:]].*"/"level $LEVEL"/ .save 
    sed -ie s/"runs [[:digit:]].*"/"runs $RUNS"/ .save
    #Updates save file
}

if [ "$LEVEL" == 0 ]; then
    while getopts "i:" OPTION; do
	
	case $OPTION in
            i)
		if [ "$OPTARG" == $PWD ]; then
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
else if [ $LEVEL == 1 ]; then
    if [ $RUNS == 1 ]; then
	$slowtype "What you just did... surrounding anything with back ticks means that BASH will read what's inside those ticks, and run it as a script. It will then remove that back tick-surrounded text, and replace it with the output of said script."
	$slowtype "For example: \`pwd\` will become /directory/path/"
	$slowtype "Make sense?"
    else if [ $RUNS == 1 ]; then
	echo test
    fi
    fi
    fi
    fi
