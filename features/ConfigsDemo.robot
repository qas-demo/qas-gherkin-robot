*** Settings ***
Library				Selenium2Library
Library				Collections
Library				OperatingSystem

Resource			../configs/allConfigs.robot

*** Variables ***


*** Test Cases ***
What is the Variables?
	[Documentation]		Log all the available variables in scope
	[Tags]				demo-test		regression-test			robot-demo
	Log Variables
	No Operation
