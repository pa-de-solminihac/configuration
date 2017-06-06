# Un meilleur "mergetool" pour git

La commande `gitmergetool` permet d'utiliser plus efficacement `vimdiff` pour résoudre les conflits Git.

## Définitions

- **LOCAL** : "vos modifications"

- **REMOTE** : "les modifications de la branche dans laquelle on merge"

C'est avez ces modifications que "vos modifications" rentrent en conflit.

- **BASE** : "la précédente version".

C'est l'ancêtre commun entre "les modifications de la branche dans laquelle on merge" et "vos modifications".

> **Résoudre le conflit** c'est mélanger harmonieusement **LOCAL** et **REMOTE**

## Utilisation

Lorsqu'on lance la commande `gitmergetool`, elle ouvre `vimdiff` avec 3 onglets permettant de mieux comprendre le contexte de chaque conflit : quel changement est apporté par quel commit ?

Chaque onglet présente un _two-way_ diff

### 1er onglet : résolution des conflits

```
    +-----------------------------------------------------------------+
    |  LOCAL Conflicts (solve here)  |        REMOTE conflicts        |
    +-----------------------------------------------------------------+
```

### 2ème onglet : "les modifications de la branche dans laquelle on merge"

diff entre "les modifications de la branche dans laquelle on merge" et la précédente version connue.

```
    +-----------------------------------------------------------------+
    |          REMOTE file           |           BASE file            |
    +-----------------------------------------------------------------+
```

### 3ème onglet : "vos modifications"

diff entre "vos modifications" et la précédente version connue.

```
    +-----------------------------------------------------------------+
    |           LOCAL file           |           BASE file            |
    +-----------------------------------------------------------------+
```

## Marche à suivre

Résolvez les conflits dans la **fenêtre de gauche** du **premier onglet**

Lorsque vous êtes satisfait de votre résolution de conflit : sauvegardez avec `:wqa`

> Vous pouvez quitter sans résoudre le conflit en cours avec `:cq`

Utilisez les touches `F1/F2` pour changer d'onglet

Utilisez `ctrl+w` `ctrl+w` pour changer de fenêtre au sein d'un onglet.

Lors que vous avez résolu tous les conflits, n'oubliez pas le `git commit` final pour valider le merge.
