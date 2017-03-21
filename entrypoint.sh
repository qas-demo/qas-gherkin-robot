#!/bin/bash

set -e

if [ "$1" =  "/bin/bash" ]
 	then
	 	/bin/bash
 elif [ "$1" =  "lint" ]
 	then
	 	echo "##################################"
     	echo "Generating Lint (using lint-rules)"
		echo "##################################"
	 	
		python -m rflint -A lint-rules .
		
		echo "##################################"

 elif [ "$1" =  "docs" ]
 	then
 		echo "##########################################"
		echo "Starting Document Hub"
		
		python -m rfhub ./step-definitions/
		
		echo "##########################################"
		echo "Open browser to http://localhost:7070/doc/"
		echo "##########################################"
elif [ $# -ne 0 ]
  then
	echo
	echo "#####################"
	echo "# Executing Tests   #"
	echo "#####################"
	echo

	rm -rf ./results/*
	python -m robot --outputdir ./results/ $@
	original_exit=$?

	#Ask user if any failed tests should be rerun
	if [ $original_exit -gt 0 -a $original_exit -lt 251 ]
		then
			echo
			echo
			echo -n "Rerun Failed Tests? [y/n]: "
			read -n 1 rerun

			#if yes
			if [ "$rerun" = "y" ]
   				then

					echo
					echo "######################"
					echo "# Rerun Failed Tests #"
					echo "######################"
					echo

					##Based on this work http://laurent.bristiel.com/re-executing-failed-test-cases-and-merging-outputs-with-robot-framework/

					# we keep a copy of the first log file
					cp results/log.html  results/first_run_log.html

					#rerun failed tests and generate new rerun file
					python -m robot --rerunfailed ./results/output.xml --output rerun.xml --outputdir ./results/ --nostatusrc $@

					# we keep a copy of the second log file
					cp results/log.html  results/second_run_log.html

					echo
					echo "### Merging Results Files ###"
					echo
					python -m robot.rebot --nostatusrc --outputdir ./results/ --output output.xml --merge ./results/output.xml ./results/rerun.xml
			fi
	fi

 fi