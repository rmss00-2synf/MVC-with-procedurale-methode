/* Testé sous MySQL 5.x */

drop table if exists T_COMMENTAIRE;
drop table if exists T_BILLET;


CREATE TABLE T_BILLET( 
   BIL_ID INT primary key auto_increment, 
   BIL_DATE DATETIME NOT NULL, 
   BIL_THEME VARCHAR(50) NOT NULL, 
   BIL_TITRE VARCHAR(100) NOT NULL, 
   BIL_CONTENU TEXT NOT NULL 
)ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;   

CREATE TABLE T_COMMENTAIRE( 
   COM_ID INT primary key auto_increment, 
   COM_DATE DATETIME NOT NULL, 
   COM_AUTEUR VARCHAR(100) NOT NULL,
   COM_CONTENU VARCHAR(255) NOT NULL,
   BIL_ID INT NOT NULL, 
   FOREIGN KEY(BIL_ID) REFERENCES T_BILLET(BIL_ID) 
)ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;   

CREATE TABLE T_INSCRIT( 
   INS_ID INT primary key auto_increment, 
   INS_NOMS VARCHAR(200) NOT NULL, 
   INS_MAIL VARCHAR(50) NOT NULL
)ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;   

CREATE TABLE INSCRIT_COMMENTER( 
   BIL_ID INT, 
   INS_ID INT, 
   COM_DATE DATETIME NOT NULL, 
   COM_CONTENU VARCHAR(255) NOT NULL, 
   PRIMARY KEY(BIL_ID, INS_ID,COM_DATE), 
   FOREIGN KEY(BIL_ID) REFERENCES T_BILLET(BIL_ID), 
   FOREIGN KEY(INS_ID) REFERENCES T_INSCRIT(INS_ID) 
)ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;   

CREATE TABLE INSCRIT_LIKER( 
   BIL_ID INT, 
   INS_ID INT, 
   LIKE_TYPE INT NOT NULL, 
   LIKE_DATE DATETIME NOT NULL, 
   PRIMARY KEY(BIL_ID, INS_ID), 
   FOREIGN KEY(BIL_ID) REFERENCES T_BILLET(BIL_ID), 
   FOREIGN KEY(INS_ID) REFERENCES T_INSCRIT(INS_ID) 
)ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;   


insert into T_BILLET(BIL_DATE,BIL_THEME, BIL_TITRE, BIL_CONTENU) values
(NOW(),'Greeting', 'Premier billet', 'Bonjour monde ! Ceci est le premier billet sur mon blog.');
insert into T_BILLET(BIL_DATE,BIL_THEME, BIL_TITRE, BIL_CONTENU) values
(NOW(),'Work', 'Au travail', 'Il faut enrichir ce blog dès maintenant.');
insert into T_BILLET(BIL_DATE,BIL_THEME, BIL_TITRE, BIL_CONTENU) values
(NOW(),'Technology', 'Les NTIC, une avancee vertigineuse', 'Les techologies de l\'information ont connu des progres significative....');
insert into T_BILLET(BIL_DATE,BIL_THEME, BIL_TITRE, BIL_CONTENU) values
(NOW(),'health', 'La sante au coeur du monde', 'L\'emencipation des NTIC a favorise la proliferation et surtout la degradation de l\'environnement.');
insert into T_BILLET(BIL_DATE,BIL_THEME, BIL_TITRE, BIL_CONTENU) values
(NOW(),'Automobile', 'Tesla au coeur du debat', 'Comme le dit on, l\'oeuvre humaine est tres loin de perfection, c\'est ce que tesla nous montre avec son premier accident....');

insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, BIL_ID) values
(NOW(), 'A. Nonyme', 'Bravo pour ce début', 1);
insert into T_COMMENTAIRE(COM_DATE, COM_AUTEUR, COM_CONTENU, BIL_ID) values
(NOW(), 'Moi', 'Merci ! Je vais continuer sur ma lancée', 1);