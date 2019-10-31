---
title: "Bootstrap 3.3.7 Template"
date: 2019-10-31T18:00:00+09:00
type: posts
categories:
    - web
tags:
    - template
    - bootstrap
    - html
---

```html
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Hello, world!</title>
        <style>
        </style>
    </head>
    <body ">
        <div class="container-fluid ">
            <button type="button " class="btn btn-primary btn-test ">Test</button>
            <div class="ani ">
                <img src="https://www.sample-videos.com/img/Sample-jpg-image-50kb.jpg " height="50 " class=" ">
            </div>
        </div>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js "></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js " integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1 " crossorigin="anonymous "></script>
        <!-- Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js " integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa " crossorigin="anonymous "></script>
        <!-- Momentjs -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js " ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.26/moment-timezone-with-data.min.js " ></script>
        <script>
            $(function() {
                $(".btn-test ").click(function(e) {
                    
                });       
                
                $.ajax({
                  method: "POST",
                  url: "some.php",
                  data: { name: "John", location: "Boston" }
                }).done(function( msg ) {
                
                });
            
            });
        </script>
    </body>
</html>
```
