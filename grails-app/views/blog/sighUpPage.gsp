<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="/myBlogApp/myBlogApp"/>
    <title> Sign Up </title>
</head>

<body class="p-3 mb-2 bg-primary">
<br/>
<br/>

<h1 align="center"> Fill Up Your Info </h1>
<g:uploadForm controller="blogView" action="newUser">
    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-3">
            <label> First Name:</label>
            <br/>
            <input type="text" name="firstName" value="" required>
            <br/>
            <label> Last Name :</label>
            <br/>
            <input type="text" name="lastName" value="" required>
            <br/>
            <label> Email:</label>
            <br/>
            <input type="email" name="email" value="" required>
            <br/>
            <label> Select Image </label>
            <input type="file" name="userImage">
        </div>

        <div class="col-md-6">
            <label> Username :</label>
            <br/>
            <input type="text" name="username" value="" required>
            <br/>
            <label> Password:</label>
            <br/>
            <input type="password" name="password1" value="" required>
            <br/>
            <label> Confirm Password:</label>
            <br/>
            <input type="password" name="password2" value="" required>
            <br/>
            <button type="submit" class="btn btn-primary"> Save </button>
        </div>
    </div>
</g:uploadForm>
</body>
</html>