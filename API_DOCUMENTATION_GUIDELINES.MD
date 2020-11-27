# Guidelines for API Documentation 
##### - [S Sandeep Pillai](https://github.com/Corruption13)

To make the integration of the backend with the front end client, we are required to document the backend in human readable form so that any front end developer with limited knowledge of the inner workings of your front end is able to easily understand the URL endpoints, the inputs and the outputs, of the API you have built. 

To ensure uniformity, we follow our own custom guidelines and rules in making the documentations. There is no need to follow the guidelines to the fullest, but try to follow the overall platform so that the front end team can effortlessly use your product.

# First step

Make a file called "APITABLES. MD" in the root of your backend project. Link the document within your "README. MD".  Use [TEXT] + (URL) to create hyperlinks. Example: [FREE COOKIES](https://www.youtube.com/watch?v=dQw4w9WgXcQ)  
Within it, create '# H1' titles of each of your sub applications, such as # USER,  # ADMIN, #BLOG etc.

Within each App section, make an index of API's defined for this section. For example, in the # USER section, we might have:
```
INDEX
    1) User Register 
    2) User Login
    3) GET User Data 
    4) SET User Data
    5) GET Additonal User Data 
    6) SET Additonal User Data 
```


# API Format
Now specify the details of your specific API. Title it with '### 1) UNDERSTANDABLE TITLE', that is, three '#'s
eg:
### 1) Customer Login API 
Below the heading, add the whole section below, each sub title having 4 "#'s
eg:
### Input
## URL Endpoint
Start the subtopic with the name of your API. Name it after the purpose it fullfils, and under it, specify the url of the endpoint, ommitting the domain. For instance, if your "Login API" is at localhost:8000/api/accounts/login, specify your url as
```
	URL Endpoint: api/accounts/login
```

## Input

Specify the allowed inputs to your endpoint, clearly stating the format of your body, and any additional headers required. If the content-type is not "application/json", specify that as well.

In the body section, specify the serializer constraints enforced on the input, **if any**, encapsulated within two triangle brackets, like so: << CONSTRAINT1 | CONSTRAINT2 >>

You can specify if an input key is optional my surrounding it with with a single <> bracket pair.


For example, if you have designed an "Edit Current User's Data" Endpoint, you will write this section as follows:

##### Header
```
HTTP_AUTH = TOKEN  // Pass your Access_Token here.
```
##### Body
```
{
	"email": "example@gmail.com", << Must be valid standard email format | Must be unique >>
	"phone_number": "+919999995999", << Must be International Phone Number format, with +Country_Code prefix >>
	"addresses":[
			{
				"street": "ABCDE",
				"city": "Kochi",
				"state": "Kerala",
				"pin": "682035" << Must be a valid pin | Min Length == 6 >>
			},
			<{..Address2 here..},>
			
	],
	"age": "21"
}
```
 
 ## Output
 Specify the format of the successful output(s) of your API endpoint below, following the above format for input.
 For Login, it might be something like this:
 ##### Output
 ```
 {
	"user_id": "Corruption13",
	"access_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJmOGI1NTdjMWNkMWUxZWM2ODBjZTkyYWFmY2U0NTIxMWUxZTRiNDEiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiVGVzdGluZzQ1NiIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9maW5pc2gtZmFjdG9yeS02NGEyMSIsImF1ZCI6ImZpbmlzaC1mYWN0b3J5LTY0YTIxIiwiYXV0aF90aW1lIjoxNjA1MTg0Mzk1LCJ1c2VyX2lkIjoidGdodGVjaDEiLCJzdWIiOiJ0Z2h0ZWNoMSIsImlhdCI6MTYwNTE4NDM5NSwiZXhwIjoxNjA1MTg3OTk1LCJlbWFpbCI6InRnaHRlY2hAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwaG9uZV9udW1iZXIiOiIrOTE5NDYyMjk0ODMwIiwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJwaG9uZSI6WyIrOTE5NDYyMjk0ODMwIl0sImVtYWlsIjpbInRnaHRlY2hAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.JcCYvKd9A1ztrsC1P0-HrHGRwFiQpMgJ6iTxAufGD2vtadOwA1JcNmE_8kLVHzRo0xfnVfm5xySydhHN1xLoYuCwJxFKKFswexMIEfKg9qKJucBSNLOumLiGj081-Wh42OtvKGPS2Oc1VnUTz6hTLRFVtaae-tw27Q52J7wTE5LXypl_nfJE5iC7CmtuQ6ZX_9g-rcGecJWQd2TY8_4cXTMs_Dfh0oZmL2s9-4IAZlKKhPvlWpMzmYmICp6ZF6D7Rf0Yq8FRP47XZIeepbe-ZNP_9hXsb8EggqMN7jQJe3i-Y_O7ge54M3LIfMlCog0R5yoUaf1HDjODPdLQmngaAg",
	<< Always 981 Character Length >> // Keep this token in persistant memory for all other future post requests.
	"last_login": "2014-01-01T23:28:56.782Z" <<Format: YY-MM-DDThh:mm:ss.ms>>
	
}
```

## < Error Codes >
Optionally, specify the error codes your API endpoint will return for all cases of outputs. While it is not nescessary to detail each and every error code, document the common error codes that might will be encountered.

For the "EDIT USER DATA" Endpoint as shown before, the error codes might be as follows:
			
			1) INVALID_EMAIL -> Email given wasn't conforming to the serializer requirements.
				Status Code: 400
					{
						"ERROR": "INVALID_EMAIL",
						"MESSAGE": "The given email 'dumb@dumber' is not a valid email format."
					} 
			2) INVALID_ADDRESS_PIN -> You get the point. 
				Status Code: 400
					{
						"ERROR": "INVALID_ADDRESS_PIN",
						"MESSAGE": "The given pin '125' is not a valid PIN format (MIN_LENGTH==6)."
					}
			3) ACCESS_TOKEN_EXPIRED -> Given HTTP_TOKEN Header has timed out.
				Status Code: 409
					{
						"ERROR": "ACCESS_TOKEN_EXPIRED"
						"MESSAGE": "Authorisation Token has expired. Please login again."
					}
			4) Etc..

## < Additional Notes >
Optionally, If there are any additinal information needed to be conveyed to the front end developer, specify  them here. Keep it short, no one wants to read your essay.
```
	The Edit User Endpoint seems to not crash when inputting special character literals, so
	please don't do that. I'll fix it in the next release.
```


##
Thanks for coming to my ted talk.
			
