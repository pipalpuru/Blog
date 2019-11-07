<!DOCTYPE HTML>
<html>

<head>
    <title></title>
    <asset:stylesheet src="/css/blog.css"/>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    %{--<asset:stylesheet src="/css/bootstrap.min.css.map"/>--}%
    %{--<asset:javascript src="/js/bootstrap.min.js"/>--}%
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
            crossorigin="anonymous"></script>

</head>
<body>
<div id="menubar">
    <ul id="menu">
        <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
        <li><a href="${createLink(controller: "blogView", action: "homePage")}"> Home </a></li>
        <li><a href="${createLink(controller: "blogView", action: "signUpPage")}"> Sign Up </a></li>
        <li><a href="${createLink(controller: "blogView", action: "loginPage")}"> Log In </a></li>
        <li><a href="${createLink(controller: "blogView", action: "adminPage")}"> Admin </a></li>
    </ul>
</ul>
</div>
<g:layoutBody/>
</body>
</html>
