*** Settings ***
Library				Selenium2Library
Library				Collections
Library				OperatingSystem


*** Variables ***
${HOME URL}			https://www.google.com/
${BROWSER}			chrome


*** Keywords ***
Open Browser To Google Home Page
	[Documentation]	Open a browser window directly to the configured URL
    ${dc}   Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER  sys, selenium.webdriver
    Set To Dictionary   ${dc}       ignoreProtectedModeSettings     ${True}

    Open Browser    url=${HOME URL}    browser=${BROWSER}		remote_url=http://seleniumhub.com:4444/wd/hub		desired_capabilities=${dc}
    Maximize Browser Window
    Set Selenium Speed    0.1s