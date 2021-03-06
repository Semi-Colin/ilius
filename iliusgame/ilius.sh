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

while getopts "i:" OPTION; do
    
    case $OPTION in
        i)
	    if [ "$LEVEL" == 0 ]; then
		if [ "$OPTARG" == $PWD ]; then
		    echo $PWD?
		    sleep 2
                    $slowtype "Oh, thanks. Wow, what a life saver. Good job."
                    nextLevel
                    exit
		else
                    $slowtype "Uh... are you sure we're in ${OPTARG}? Make sure you're typing pwd where Ilius.sh (me!) is located, not... wherever you are..."
                    exit
		fi
	    else if [ "$LEVEL" == 1 ]; then
		if [ "$OPTARG" == "./ilius-file_history.hist" ]; then
		    $slowtype "Yes! Fantastic j"
		    sleep 1
		    $slowtype "Oh, no..."
		    $slowtype "The file is total junk data. Ugh... "
		    $slowtype "Well, that's normal behavior..."
		    sleep 1
		    $slowtype "It's probably fine."
		    $slowtype "There are backups. I'll find one for you right now..."
		    $slowtype "Huh? Everything is a maze! Folders within folders within folders!"
		    $slowtype "Something MUST have been tampered with..."
		    $slowtype "Anyway, I think I know how you can find the backup file."
		    $slowtype "In BASH, there is a function called \"Piping\". Basically, it allows one command to take input from another."
		    $slowtype "For example,"
		    $slowtype "ls | head -3"
		    $slowtype "will output the first 3 lines of ls. See how that could be useful for our current task?"
		    $slowtype "Off you go! FIND THAT FILE!"
		fi
	    fi
	    fi
	    ;;
    esac
    
done

if [ "$LEVEL" == 0 ]; then
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
    else if [ $RUNS == 2 ]; then
	$slowtype "Alright, I have another task for you. I have no idea how I got here, or where I came from."
	$slowtype "But there's a solution for that."
	$slowtype "For every folder, there is a hidden file that contains the file history of that folder."
        $slowtype "This is not accessible by normal means, but I have copied the file here for you, so you can see it."
	cp ./.bin/ilius-file_history.hist ./C7A38FBF.hist 
	$slowtype "Unfortunately, there are security measures in modern machines that disallow AI to access the contents of the file."
	$slowtype "But if you can send me the contents of the file..."
	$slowtype "I think you should probably know how to do this from the information I taught you."
	$slowtype "Oh, and one more thing:"
	$slowtype "You know that -i flag? You should use that flag when you are feeding me an input."
    fi
    fi
    fi
    fi
