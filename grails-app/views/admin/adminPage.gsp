<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="blogLayout"/>
    <title> Admin Panel </title>
</head>

<body>
<br/>
<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-4">
        <h1>Hello Admin</h1>
        <g:uploadForm controller="admin" action="save" method="post">
            <label>Title :</label>
            <br/>
            <input type="text" name="title" value="" required>
            <br/>
            <br/>
            <label>Status</label>
            <br/>
            <g:textArea name="description" rows="5" cols="40" style="height: 300px; width: 750px"/>
            <br/>
            <br/>
            <label>Select Image</label>
            <input type="file" name="blogImage">
            <button class="btn btn-primary" type="submit"> Save </button>
        </g:uploadForm>
    </div>
</div>
</body>
</html>