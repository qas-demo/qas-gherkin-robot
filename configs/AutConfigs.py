def getVariables(envArg):
	ENV = envArg

	#Define any env specific variables should be declared here
	if ENV == "DIT":
		API_HOST = "https://postman-echo.com"
	elif ENV == "SIT":
		API_HOST = "https://postman-echo.com"
	elif ENV == "UAT":
		API_HOST = "https://postman-echo.com"


	#Combine all variables into a single dictionary
	variables = {}
	
	variables["API HOST"] = API_HOST

	#return just the finally dictionary
	return variables
