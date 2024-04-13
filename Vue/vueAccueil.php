<?php $titre = "Mon-Blog"; ?>
<?php ob_start();?>
<?php foreach ($billets as $billet):?>
    <div class="card">
        <div class="card__header">
            <img src="https://source.unsplash.com/600x400/?<?= $billet['theme'] ?>" alt="card__image" class="card__image" width="600">
        </div>
        <div class="card__body">
            <span class="tag tag-blue"><?= $billet['theme'] ?></span>
            <h4><?= $billet['titre'] ?></h4>
            <p><?= $billet['contenu'] ?></p>
        </div>
        <div class="card__footer">
            <div class="user">
                <div class="user__info">
                    <h5><span class="tag "><a href=<?= "index.php?action=billet&id=" . $billet['id'] ?>>Read more...</a></span></h5>
                    <small><?= $billet['date'] ?></small>
                </div>
            </div>
        </div>
    </div>
<?php endforeach; ?>
<?php $contenu = ob_get_clean();?>
<?php require "gabarit.php";?>