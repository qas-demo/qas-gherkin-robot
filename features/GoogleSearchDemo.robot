*** Settings ***
Resource			../step-definitions/GoogleHomePage.robot

*** Test Cases ***
Fidelity Investments Is First Result in Google Search
	[Documentation]		Searching for 'Fidelity Investments' in google should show it as a financial services company
	Open Browser To Google Home Page
	Input Text						name=q							Fidelity Investments
	Click Button					name=btnG
	Wait Until Page Contains		Financial services company		5s

