Reading from APIs
=================
We will focus on how to read data from application programming interfaces (APIs).
Many internet companies have APIs where we can download particular types of data.
To do so, we must create an account with the API or development team and submit an application.

For the sake of this lecture, we will use Twitter as an example.

We will also be using the **{httr}** package.
**{httr}** allows `GET`, `POST`, `PUT`, and `DELETE` requests if authorized. The package also works well with Facebook, Google, Github, etc.

Accessing Twitter from R
------------------------
```r
myapp = oauth_app("twitter", key = "consumerkey", secret = "consumersecret"
sig = sign_oauth1.0(myapp, token = "token", token_secret = "tokensecret")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
```

Use the **Resource URL** in the `GET` command.
    
Converting the json Object
--------------------------
```r
json1 = content(homeTL) # extracts json data
json2 = jsonlite::fromJSON(toJSON(json1))
```

The `content()` function extracts data and will automatically detect that it is in JSON format.
Meanwhile, `json2[1, 1:4]` displays a data frame, showing the first row and the first four columns.

Further Resources
-----------------
**Twitter Developers** | REST APIs: https://dev.twitter.com/docs/api/1.1/overview
