<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $titre ?></title>
    <link rel="stylesheet" href="Contenu/style.css">
</head>
<body>
    <header>
      <center>
        <h1 id="titreBlog" style="color:blue; text-decoration: underline;">BLOG</h1>
        <p>Je vous souhaite la bienvenue sur ce modeste blog.</p>
        </center>
    </header>

    <div class="container">
        <?= $contenu ?>
      </div>
      <footer id="piedBlog">
                Blog réalisé avec PHP, HTML5, CSS et VUE JS.
      </footer>
</body>
</html>