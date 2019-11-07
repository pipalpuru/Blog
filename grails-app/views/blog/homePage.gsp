<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="/myBlogApp/myBlogApp"/>
    <title> Home </title>
</head>
<body>
<g:each in="${record}" var="admin" status="i">
    <div class="card text-center">
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <h2>${admin?.name}</h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <a href="#">
                        <img src="${createLink(controller: "blogView", action: "displayBlogImage", params: [id: admin.id])}" width="800" height="300"/>
                        <br/>
                                                        <p class="text-center">${admin?.status?.toString()?.substring(0, admin?.status?.toString()?.toString()?.length() > 350 ? 350 : admin?.status?.toString()?.length())}
                    </a>
                    <br/>
                    <a href="${createLink(controller: "blogView", action: "blogView")}"
                       class="btn btn-primary">Read More</a>
                </div>

                <div class="col-md-1">
                </div>

                <div class="col-md-3">
                    <div class="card" style="width: 15rem;">
                        <img class="card-img-top" src="${createLink(controller: "blog", action: "displayUserImage", params: [id: admin.id])}" width="500" height="230"/>

                        <div class="card-body">
                            <h5 class="card-title">Full Name</h5>

                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="${createLink(controller: "userProfile", action: "profileUser")}" class="btn btn-primary"> View Profile </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/>
</g:each>
</body>
</html>