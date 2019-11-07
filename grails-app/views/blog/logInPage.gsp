<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="/myBlogApp/myBlogApp"/>
    <title> logIn </title>
</head>
<body>
<div class="container" >
    <g:form controller="blog" action="conform">
        <div class="row">
            <div class="col-md-12">
                <br/>
                <br/>
                <br/>
                <h1 align="center">  Log In To Post Content </h1>
            </div>
        </div>
        <div class="row">
        <div class="col-md-4">
        </div>
            <div class="col-md-8">
                <label> User Name:</label>
                <br/>
                    <input type="text" name="username" required/>
                <br/>
                <br/>
                <label> Password :</label>
                   <br/>
                    <input type="text" name="password" required/>
                <br/>
                    <button type="submit" class="btn btn-primary"> LOG IN </button>
                <br/>
                <br/>
    <label> IF YOU ARE NEW SIGN UP HERE </label>
    <a href="${createLink(controller: "blog", action: "newu1")}"> <button  type="button" class="btn btn-info"> SIGN UP </button></a>
        <p> If you are just visitor and want to read only just <a href="${createLink(controller: "blog", action: "home")}"> CLICK HERE TO SKIP </a>  </p>
        </div>
    </g:form>
</div>


</body>

</html>