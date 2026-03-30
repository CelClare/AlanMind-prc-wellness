# 🧩 AlanMind – prc-wellness - API de contenu bien-être quotidien

Ce module Process API MuleSoft orchestre la gestion et la diffusion de contenus bien-être pour la plateforme AlanMind.

---

## 📄 Description

`prc-wellness` fait le lien entre la base de données (`sys-db`), les notifications par email (`sys-smtp`), et l’API d’exposition front (`exp-wellness`).

Il permet :
- la création de contenus bien-être (bulk ou unitaire)
- la planification et l’envoi quotidien de notifications aux abonné·e·s via CRON
- la centralisation des flux de validation et d’enrichissement contextuel (météo, humeur, etc.)

**Cas d’usage :**
Automatiser le “geste du jour” en orchestrant tous les systèmes (BDD, emails, enrichissement contextuel) afin que l’application AlanMind propose un contenu toujours à jour et contextualisé.

---

## 🛠️ Stack technique

- **MuleSoft 4.x**
- **API RAML 1.0**
- Orchestration de systèmes (DB, SMTP, météo, etc.)
- Gestion d’erreurs explicite (400, 404, 409, 500…)
- Couverture MUnit

---

## 🗝️ Endpoints principaux

### `POST /api/v1/wellness/bulk`
Créer plusieurs contenus bien-être en une seule requête.
- **Body :** tableau de contenus (sans ID, généré côté DB)
- **Réponse 207** : détail du statut pour chaque item (créé/conflit, etc.)

### `POST /api/v1/notifications/schedule`
Déclenche l’envoi des emails à tous·tes les abonné·e·s pour le jour courant.
- **Réponse 200** : message de succès si tout s’est bien passé

---

## 🤖 Notes

- Les modèles de données sont strictement validés à chaque étape.
- La gestion des erreurs est pensée pour le monitoring et le debug (retours précis côté front ou ops).
- Le module est pensé “middleware” : il ne stocke rien, mais orchestre tout.

---

## 📚 Autres modules associés

- [`sys-db`](https://github.com/CelClare/AlanMind-sys-db) : gestion BDD PostgreSQL
- [`sys-smtp`](https://github.com/CelClare/AlanMind-sys-smtp) : notifications email
- [`exp-wellness`](https://github.com/CelClare/AlanMind-exp-wellness) : exposition côté client/app

---

## 📅 TODOs et évolutions possibles

- Ajout de l’enrichissement météo contextuel automatisé
- Webhook ou callback sur succès d’envoi
- Intégration d’un log analytics centralisé
