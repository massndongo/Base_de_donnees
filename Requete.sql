#1
SELECT m.numMed,nomMed FROM medecin m, specialite s WHERE m.numSpec=s.numSpec AND nomSpec="S1" GROUP BY m.numMed;

 #2
 SELECT nomSpec FROM specialite;

 #3
 SELECT numMalade, nomMalade, dateNaissance FROM malade WHERE sexe="masculin" ORDER BY dateNaissance DESC;

 #4
 SELECT numMalade, nomMalade, dateNaissance FROM malade WHERE sexe="feminin" AND adresse LIKE "%p%" ORDER BY nomMalade ASC;

 #5
 SELECT m.numMalade, nomMalade, dateNaissance, c.numChambre, categorie,type FROM malade m, chambre c WHERE m.numDept=c.numDept;

 #6
 SELECT numMalade, nomMalade, dateNaissance, m.numDept, nomDept FROM malade m, departement d WHERE d.numDept=m.numDept AND dateNaissance="2012-04-22"

 #7
 SELECT ma.numMalade, nomMalade, dateNaissance FROM malade ma, medecin m, suivre s WHERE ma.numMalade=s.numMalade AND m.numMed=s.numMed AND nomMed="M3"
 
 #8
 SELECT ma.numMalade, nomMalade, dateNaissance FROM malade ma, medecin m, suivre s, lit l, occuper_lit o WHERE ma.numMalade=s.numMalade AND m.numMed=s.numMed AND nomMed="M3" AND ma.numMalade=o.numMalade AND l.numLit=o.numLit AND l.numLit=21

 #9
 SELECT ma.numMalade, nomMalade, dateNaissance FROM malade ma, lit l, occuper_lit o WHERE ma.numMalade=o.numMalade AND l.numLit=o.numLit AND l.numLit=21

 #10
 SELECT m.numMalade, nomMalade, dateNaissance,numFeuille,date FROM malade m, feuille f WHERE m.numMalade=f.numFeuille AND f.numMalade=11

 #11
 SELECT nomDept, COUNT(m.numMalade) AS Nbr_Malade FROM malade m, departement d WHERE m.numDept=d.numDept GROUP BY d.numDept

 #12
 SELECT ma.numMalade, nomMalade, adresse, nomMed FROM malade ma, medecin m, suivre s,departement d, intervenir_dept i WHERE ma.numMalade=s.numMalade AND m.numMed=s.numMed AND m.numMed=i.numMed AND d.numDept=i.numDept AND ma.numDept=d.numDept AND nomDept="D2"

 #13
 SELECT m.numMalade, nomMalade, adresse FROM malade m, feuille f WHERE m.numMalade=f.numMalade AND (EXTRACT(MONTH FROM f.date)=12 OR EXTRACT(MONTH FROM f.date)=2)

 #14
 SELECT c.numChambre, categorie, type, COUNT(m.numMalade) AS Nbre_Malade FROM chambre c, malade m, lit l, occuper_lit o WHERE c.numChambre=l.numChambre AND m.numMalade=o.numMalade AND l.numLit=o.numLit GROUP BY c.numChambre DESC LIMIT 1;

 #15
 SELECT d.numDept, nomDept, COUNT(m.numMalade) AS Nbre_Malade FROM departement d, malade m WHERE m.numDept=d.numDept GROUP BY d.numDept LIMIT 1

 #16

#17
SELECT m.numMed, nomMed, nomSpec,MAX(COUNT(ma.numMalade) AS nb) FROM malade ma, medecin m, suivre s, specialite sp WHERE ma.numMalade=s.numMalade AND m.numMed=s.numMed AND m.numSpec=sp.numSpec GROUP BY m.numMed

#18
SELECT ma.numMalade, nomMalade, dateNaissance, c.numChambre, l.numLit FROM malade ma, medecin m, suivre s, lit l, chambre c, occuper_lit o, specialite sp WHERE ma.numMalade=s.numMalade AND m.numMed=s.numMed AND ma.numMalade=o.numMalade AND l.numLit=o.numLit AND c.numChambre=l.numChambre AND sp.numSpec=m.numSpec AND nomSpec="S2" GROUP BY ma.numMalade

#19
SELECT infos FROM malade m, feuille f, departement d WHERE m.numMalade=f.numMalade AND m.numDept=d.numDept AND (EXTRACT(YEAR FROM f.date)=2020 AND EXTRACT(MONTH FROM f.date)=6)

#20
SELECT l.numLit FROM lit l, occuper_lit o WHERE l.numLit != o.numLit AND EXTRACT(MONTH FROM o.dateOccupation)=3

