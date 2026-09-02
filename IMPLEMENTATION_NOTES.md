# Organisation par domaines — Robot Framework + Selenium

## Organisation

Les nouveaux lots sont organisés en paires de dossiers : un dossier `resources/<domaine>/` contient les mots-clés du domaine et un dossier `tests/<domaine>/` contient les cas qui utilisent ces mots-clés. Les suites historiques `auth/`, `createMission/`, `planning/`, `profile/` et `reportBugs/` ont été conservées et ne sont pas réimplémentées.

## Domaines ajoutés

| Domaine | Ressource | Suite de tests | Cas ajoutés |
|---|---|---|---:|
| Gestion de mission | `resources/gestion_mission/` | `tests/gestion_mission/` | 2 contrôles critiques |
| Gestion des documents | `resources/gestion_documents/` | `tests/gestion_documents/` | 2 contrôles critiques |
| Gestion de planification | `resources/gestion_planification/` | `tests/gestion_planification/` | 2 contrôles critiques |
| Information d’entreprise | `resources/information_entreprise/` | `tests/information_entreprise/` | 2 contrôles critiques |
| Information de sécurité | `resources/information_securite/` | `tests/information_securite/` | 2 contrôles critiques |
| Gestion de banque | `resources/gestion_banque/` | `tests/gestion_banque/` | 2 contrôles critiques |
| SOS | `resources/sos/` | `tests/sos/` | 2 contrôles critiques |
| Gestion de facture | `resources/gestion_facture/` | `tests/gestion_facture/` | 2 contrôles critiques |
| Incidents et signalement de bugs | `resources/incidents_signalement/` | `tests/incidents_signalement/` | 2 contrôles critiques |
| Autres modules | `resources/autres_modules/` | `tests/autres_modules/` | 2 contrôles critiques |

Chaque ressource contient les mots-clés d’ouverture navigateur, de connexion avec le compte agent CI, de navigation vers les routes DEV et d’attente du rendu React.

## Validation

Le dry-run de l’ensemble des nouveaux dossiers passe avec **20 tests sur 20**. L’exécution réelle de `gestion_mission` passe avec **2 tests sur 2**. L’exécution réelle de `gestion_documents` passe avec **2 tests sur 2** après sélection explicite de l’onglet Documents. Le lot critique historique précédemment ajouté a également été exécuté avec succès avant la réorganisation.

Commande de validation syntaxique :

```bash
robot --dryrun --include critical --outputdir results tests/gestion_mission tests/gestion_documents tests/gestion_planification tests/information_entreprise tests/information_securite tests/gestion_banque tests/sos tests/gestion_facture tests/incidents_signalement tests/autres_modules
```

Commande CI par domaine :

```bash
robot --include critical --outputdir results tests/<domaine>
```

## Limites de couverture

L’export Squash contient davantage de cas métier détaillés que les contrôles smoke ajoutés ici. Les cas nécessitant création/annulation de mission, paiements, cartes bancaires, IBAN, OTP e-mail/SMS, upload de fichiers, traitement administrateur ou données métier préexistantes doivent être implémentés dans des sous-suites dédiées avec des fixtures contrôlées. Ils ne sont pas simulés ni marqués comme réussis sans vérification réelle.

Les comptes fournis sont centralisés dans `config/CredentialsDetails.robot`. Les données sensibles doivent idéalement être remplacées par des variables CI protégées avant utilisation sur un dépôt partagé.
