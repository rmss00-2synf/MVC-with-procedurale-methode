<?php
function getBillets(){
  $bdd = getBdd();  
  $billets = $bdd->query('select BIL_ID as id, BIL_DATE as date,'
  . 'BIL_THEME as theme, BIL_TITRE as titre, BIL_CONTENU as contenu from T_BILLET'
  . ' order by BIL_ID desc');
  return $billets;
}

function getBillet($idBillet){
  $bdd = getBdd();  
  $billet = $bdd->query('select BIL_ID as id, BIL_DATE as date, BIL_THEME as theme, BIL_TITRE as titre, BIL_CONTENU as contenu from T_BILLET where BIL_ID='.$idBillet);
  $billet->execute();
  if ($billet->rowCount() == 1)
    return $billet->fetch(); // Accès à la première ligne de résultat
  else
    throw new Exception("Aucun billet ne correspond à l'identifiant '$idBillet'");
}

function getCommentaires($idBillet) {
  $bdd = getBdd();
  $commentaires = $bdd->prepare('select COM_ID as id, COM_DATE as date,  COM_AUTEUR as auteur, COM_CONTENU as contenu from T_COMMENTAIRE where BIL_ID='.$idBillet);
  $commentaires->execute();
  return $commentaires;
}

function getBdd(){
  return $bdd = new PDO('mysql:host=localhost;dbname=monblog;charset=utf8',
  'root','', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
}