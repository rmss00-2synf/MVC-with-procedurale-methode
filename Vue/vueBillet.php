<?php $titre = "Mon Blog - " . $billet['titre']; ?>
<?php ob_start(); ?>
<article>
<main>
        <section>
            <h1 class="titreBillet"><?= $billet['titre'] ?></h1>
                <div class="h1-divider"></div>
                <p class="intro"><?= $billet['theme'] ?>.</p>

                <article>
                    <p><?= $billet['contenu'] ?></p>

                    <div class="placeHolder_img" style="background-image: url('https://source.unsplash.com/600x400/?<?= $billet['theme'] ?>');"></div>

                    <p> <time><?= $billet['date'] ?></time>. </p>
                </article>
                <div class="h1-divider"></div>
        </section>
    </main>
    <article>
        <?php foreach ($commentaires as $commentaire): ?>
            <p><?= $commentaire['auteur'] ?> dit :</p>
            <p><?= $commentaire['contenu'] ?></p>
        <?php endforeach; ?>
    </article>
</article>
<?php $contenu = ob_get_clean(); ?>

<?php require 'gabarit.php'; ?>