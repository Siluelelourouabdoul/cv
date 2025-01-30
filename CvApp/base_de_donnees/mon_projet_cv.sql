-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 jan. 2025 à 13:21
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mon_projet_cv`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add competence', 6, 'add_competence'),
(22, 'Can change competence', 6, 'change_competence'),
(23, 'Can delete competence', 6, 'delete_competence'),
(24, 'Can view competence', 6, 'view_competence'),
(25, 'Can add experience professionnelle', 7, 'add_experienceprofessionnelle'),
(26, 'Can change experience professionnelle', 7, 'change_experienceprofessionnelle'),
(27, 'Can delete experience professionnelle', 7, 'delete_experienceprofessionnelle'),
(28, 'Can view experience professionnelle', 7, 'view_experienceprofessionnelle'),
(29, 'Can add formation', 8, 'add_formation'),
(30, 'Can change formation', 8, 'change_formation'),
(31, 'Can delete formation', 8, 'delete_formation'),
(32, 'Can view formation', 8, 'view_formation'),
(33, 'Can add langue', 9, 'add_langue'),
(34, 'Can change langue', 9, 'change_langue'),
(35, 'Can delete langue', 9, 'delete_langue'),
(36, 'Can view langue', 9, 'view_langue'),
(37, 'Can add loisir', 10, 'add_loisir'),
(38, 'Can change loisir', 10, 'change_loisir'),
(39, 'Can delete loisir', 10, 'delete_loisir'),
(40, 'Can view loisir', 10, 'view_loisir'),
(41, 'Can add model cv', 11, 'add_modelcv'),
(42, 'Can change model cv', 11, 'change_modelcv'),
(43, 'Can delete model cv', 11, 'delete_modelcv'),
(44, 'Can view model cv', 11, 'view_modelcv'),
(45, 'Can add user', 12, 'add_personne'),
(46, 'Can change user', 12, 'change_personne'),
(47, 'Can delete user', 12, 'delete_personne'),
(48, 'Can view user', 12, 'view_personne'),
(49, 'Can add cv', 13, 'add_cv'),
(50, 'Can change cv', 13, 'change_cv'),
(51, 'Can delete cv', 13, 'delete_cv'),
(52, 'Can view cv', 13, 'view_cv');

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_competence`
--

CREATE TABLE `cvapp_competence` (
  `id` bigint(20) NOT NULL,
  `competence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_cv`
--

CREATE TABLE `cvapp_cv` (
  `id` bigint(20) NOT NULL,
  `poste` varchar(225) NOT NULL,
  `description` longtext NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `terminer` tinyint(1) NOT NULL,
  `modele_id` bigint(20) NOT NULL,
  `personne_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_cv_competences`
--

CREATE TABLE `cvapp_cv_competences` (
  `id` bigint(20) NOT NULL,
  `cv_id` bigint(20) NOT NULL,
  `competence_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_cv_experiences`
--

CREATE TABLE `cvapp_cv_experiences` (
  `id` bigint(20) NOT NULL,
  `cv_id` bigint(20) NOT NULL,
  `experienceprofessionnelle_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_cv_formations`
--

CREATE TABLE `cvapp_cv_formations` (
  `id` bigint(20) NOT NULL,
  `cv_id` bigint(20) NOT NULL,
  `formation_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_cv_langues`
--

CREATE TABLE `cvapp_cv_langues` (
  `id` bigint(20) NOT NULL,
  `cv_id` bigint(20) NOT NULL,
  `langue_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_cv_loisirs`
--

CREATE TABLE `cvapp_cv_loisirs` (
  `id` bigint(20) NOT NULL,
  `cv_id` bigint(20) NOT NULL,
  `loisir_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_experienceprofessionnelle`
--

CREATE TABLE `cvapp_experienceprofessionnelle` (
  `id` bigint(20) NOT NULL,
  `job_titre` varchar(255) NOT NULL,
  `entreprise` varchar(255) NOT NULL,
  `localite` varchar(255) DEFAULT NULL,
  `periode` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_formation`
--

CREATE TABLE `cvapp_formation` (
  `id` bigint(20) NOT NULL,
  `etablissement` varchar(255) NOT NULL,
  `diplome` varchar(255) NOT NULL,
  `periode` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_langue`
--

CREATE TABLE `cvapp_langue` (
  `id` bigint(20) NOT NULL,
  `langue` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_loisir`
--

CREATE TABLE `cvapp_loisir` (
  `id` bigint(20) NOT NULL,
  `loisirs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_modelcv`
--

CREATE TABLE `cvapp_modelcv` (
  `id` bigint(20) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_personne`
--

CREATE TABLE `cvapp_personne` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cvapp_personne`
--

INSERT INTO `cvapp_personne` (`id`, `password`, `last_login`, `is_superuser`, `is_staff`, `is_active`, `date_joined`, `email`, `nom`, `prenom`, `telephone`, `adresse`, `photo`) VALUES
(1, 'pbkdf2_sha256$600000$wIjUHIzJFbus0jUu8C0q9b$qQrYBKpb8QGaeg5wbFYie4zf4U/eAKp5LM9p0SAng0c=', '2025-01-30 12:02:47.826784', 0, 0, 1, '2025-01-30 12:00:04.125462', 'karimsilue487@gmail.com', 'silue', 'Lelourou abdoul karim', '0779250252', 'Adjame', 'photos/photo_qdF2m6n.jpg'),
(2, 'pbkdf2_sha256$600000$jTbVgN0h3rh9WEkqmUgEKa$5GVY01cwsoD10qRNR5n09GWmOYhKmo7jt0H570N28T4=', NULL, 0, 0, 1, '2025-01-30 12:02:19.292352', 'karimsilue48@gmail.com', 'Konan', 'Abdoul', '0708829237', 'yopugon', 'photos/WhatsApp_Image_2023-11-15_à_14.30.30_cb1f77dc.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_personne_groups`
--

CREATE TABLE `cvapp_personne_groups` (
  `id` bigint(20) NOT NULL,
  `personne_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cvapp_personne_user_permissions`
--

CREATE TABLE `cvapp_personne_user_permissions` (
  `id` bigint(20) NOT NULL,
  `personne_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'CvApp', 'competence'),
(13, 'CvApp', 'cv'),
(7, 'CvApp', 'experienceprofessionnelle'),
(8, 'CvApp', 'formation'),
(9, 'CvApp', 'langue'),
(10, 'CvApp', 'loisir'),
(11, 'CvApp', 'modelcv'),
(12, 'CvApp', 'personne'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-01-30 11:57:34.099714'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-01-30 11:57:34.196863'),
(3, 'auth', '0001_initial', '2025-01-30 11:57:34.507576'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-01-30 11:57:34.597539'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-01-30 11:57:34.613616'),
(6, 'auth', '0004_alter_user_username_opts', '2025-01-30 11:57:34.620186'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-01-30 11:57:34.638277'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-01-30 11:57:34.638277'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-01-30 11:57:34.669818'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-01-30 11:57:34.681600'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-01-30 11:57:34.693742'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-01-30 11:57:34.713937'),
(13, 'auth', '0011_update_proxy_permissions', '2025-01-30 11:57:34.729174'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-01-30 11:57:34.742004'),
(15, 'CvApp', '0001_initial', '2025-01-30 11:57:36.363874'),
(16, 'admin', '0001_initial', '2025-01-30 11:57:36.547609'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-01-30 11:57:36.576482'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-30 11:57:36.605478'),
(19, 'sessions', '0001_initial', '2025-01-30 11:57:36.668184');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `cvapp_competence`
--
ALTER TABLE `cvapp_competence`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvapp_cv`
--
ALTER TABLE `cvapp_cv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CvApp_cv_modele_id_36fbe260_fk_CvApp_modelcv_id` (`modele_id`),
  ADD KEY `CvApp_cv_personne_id_4dfa59de_fk_CvApp_personne_id` (`personne_id`);

--
-- Index pour la table `cvapp_cv_competences`
--
ALTER TABLE `cvapp_cv_competences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_cv_competences_cv_id_competence_id_7982e508_uniq` (`cv_id`,`competence_id`),
  ADD KEY `CvApp_cv_competences_competence_id_fc3bdd13_fk_CvApp_com` (`competence_id`);

--
-- Index pour la table `cvapp_cv_experiences`
--
ALTER TABLE `cvapp_cv_experiences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_cv_experiences_cv_id_experienceprofessi_20485e9a_uniq` (`cv_id`,`experienceprofessionnelle_id`),
  ADD KEY `CvApp_cv_experiences_experienceprofession_daba1f0c_fk_CvApp_exp` (`experienceprofessionnelle_id`);

--
-- Index pour la table `cvapp_cv_formations`
--
ALTER TABLE `cvapp_cv_formations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_cv_formations_cv_id_formation_id_3fa0b630_uniq` (`cv_id`,`formation_id`),
  ADD KEY `CvApp_cv_formations_formation_id_40d5dfda_fk_CvApp_formation_id` (`formation_id`);

--
-- Index pour la table `cvapp_cv_langues`
--
ALTER TABLE `cvapp_cv_langues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_cv_langues_cv_id_langue_id_84896f26_uniq` (`cv_id`,`langue_id`),
  ADD KEY `CvApp_cv_langues_langue_id_e064f385_fk_CvApp_langue_id` (`langue_id`);

--
-- Index pour la table `cvapp_cv_loisirs`
--
ALTER TABLE `cvapp_cv_loisirs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_cv_loisirs_cv_id_loisir_id_a8a3eeb6_uniq` (`cv_id`,`loisir_id`),
  ADD KEY `CvApp_cv_loisirs_loisir_id_ed538d09_fk_CvApp_loisir_id` (`loisir_id`);

--
-- Index pour la table `cvapp_experienceprofessionnelle`
--
ALTER TABLE `cvapp_experienceprofessionnelle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvapp_formation`
--
ALTER TABLE `cvapp_formation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvapp_langue`
--
ALTER TABLE `cvapp_langue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvapp_loisir`
--
ALTER TABLE `cvapp_loisir`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvapp_modelcv`
--
ALTER TABLE `cvapp_modelcv`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvapp_personne`
--
ALTER TABLE `cvapp_personne`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telephone` (`telephone`);

--
-- Index pour la table `cvapp_personne_groups`
--
ALTER TABLE `cvapp_personne_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_personne_groups_personne_id_group_id_63ce63ae_uniq` (`personne_id`,`group_id`),
  ADD KEY `CvApp_personne_groups_group_id_d912b89e_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `cvapp_personne_user_permissions`
--
ALTER TABLE `cvapp_personne_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CvApp_personne_user_perm_personne_id_permission_i_02c103a9_uniq` (`personne_id`,`permission_id`),
  ADD KEY `CvApp_personne_user__permission_id_d301bbea_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_CvApp_personne_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `cvapp_competence`
--
ALTER TABLE `cvapp_competence`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_cv`
--
ALTER TABLE `cvapp_cv`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_cv_competences`
--
ALTER TABLE `cvapp_cv_competences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_cv_experiences`
--
ALTER TABLE `cvapp_cv_experiences`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_cv_formations`
--
ALTER TABLE `cvapp_cv_formations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_cv_langues`
--
ALTER TABLE `cvapp_cv_langues`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_cv_loisirs`
--
ALTER TABLE `cvapp_cv_loisirs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_experienceprofessionnelle`
--
ALTER TABLE `cvapp_experienceprofessionnelle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_formation`
--
ALTER TABLE `cvapp_formation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_langue`
--
ALTER TABLE `cvapp_langue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_loisir`
--
ALTER TABLE `cvapp_loisir`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_modelcv`
--
ALTER TABLE `cvapp_modelcv`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_personne`
--
ALTER TABLE `cvapp_personne`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cvapp_personne_groups`
--
ALTER TABLE `cvapp_personne_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cvapp_personne_user_permissions`
--
ALTER TABLE `cvapp_personne_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `cvapp_cv`
--
ALTER TABLE `cvapp_cv`
  ADD CONSTRAINT `CvApp_cv_modele_id_36fbe260_fk_CvApp_modelcv_id` FOREIGN KEY (`modele_id`) REFERENCES `cvapp_modelcv` (`id`),
  ADD CONSTRAINT `CvApp_cv_personne_id_4dfa59de_fk_CvApp_personne_id` FOREIGN KEY (`personne_id`) REFERENCES `cvapp_personne` (`id`);

--
-- Contraintes pour la table `cvapp_cv_competences`
--
ALTER TABLE `cvapp_cv_competences`
  ADD CONSTRAINT `CvApp_cv_competences_competence_id_fc3bdd13_fk_CvApp_com` FOREIGN KEY (`competence_id`) REFERENCES `cvapp_competence` (`id`),
  ADD CONSTRAINT `CvApp_cv_competences_cv_id_6fadffa6_fk_CvApp_cv_id` FOREIGN KEY (`cv_id`) REFERENCES `cvapp_cv` (`id`);

--
-- Contraintes pour la table `cvapp_cv_experiences`
--
ALTER TABLE `cvapp_cv_experiences`
  ADD CONSTRAINT `CvApp_cv_experiences_cv_id_7b03a11e_fk_CvApp_cv_id` FOREIGN KEY (`cv_id`) REFERENCES `cvapp_cv` (`id`),
  ADD CONSTRAINT `CvApp_cv_experiences_experienceprofession_daba1f0c_fk_CvApp_exp` FOREIGN KEY (`experienceprofessionnelle_id`) REFERENCES `cvapp_experienceprofessionnelle` (`id`);

--
-- Contraintes pour la table `cvapp_cv_formations`
--
ALTER TABLE `cvapp_cv_formations`
  ADD CONSTRAINT `CvApp_cv_formations_cv_id_f947b3ea_fk_CvApp_cv_id` FOREIGN KEY (`cv_id`) REFERENCES `cvapp_cv` (`id`),
  ADD CONSTRAINT `CvApp_cv_formations_formation_id_40d5dfda_fk_CvApp_formation_id` FOREIGN KEY (`formation_id`) REFERENCES `cvapp_formation` (`id`);

--
-- Contraintes pour la table `cvapp_cv_langues`
--
ALTER TABLE `cvapp_cv_langues`
  ADD CONSTRAINT `CvApp_cv_langues_cv_id_5d4cdfc0_fk_CvApp_cv_id` FOREIGN KEY (`cv_id`) REFERENCES `cvapp_cv` (`id`),
  ADD CONSTRAINT `CvApp_cv_langues_langue_id_e064f385_fk_CvApp_langue_id` FOREIGN KEY (`langue_id`) REFERENCES `cvapp_langue` (`id`);

--
-- Contraintes pour la table `cvapp_cv_loisirs`
--
ALTER TABLE `cvapp_cv_loisirs`
  ADD CONSTRAINT `CvApp_cv_loisirs_cv_id_d1c5144a_fk_CvApp_cv_id` FOREIGN KEY (`cv_id`) REFERENCES `cvapp_cv` (`id`),
  ADD CONSTRAINT `CvApp_cv_loisirs_loisir_id_ed538d09_fk_CvApp_loisir_id` FOREIGN KEY (`loisir_id`) REFERENCES `cvapp_loisir` (`id`);

--
-- Contraintes pour la table `cvapp_personne_groups`
--
ALTER TABLE `cvapp_personne_groups`
  ADD CONSTRAINT `CvApp_personne_groups_group_id_d912b89e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `CvApp_personne_groups_personne_id_b07ee925_fk_CvApp_personne_id` FOREIGN KEY (`personne_id`) REFERENCES `cvapp_personne` (`id`);

--
-- Contraintes pour la table `cvapp_personne_user_permissions`
--
ALTER TABLE `cvapp_personne_user_permissions`
  ADD CONSTRAINT `CvApp_personne_user__permission_id_d301bbea_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `CvApp_personne_user__personne_id_cde1b979_fk_CvApp_per` FOREIGN KEY (`personne_id`) REFERENCES `cvapp_personne` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_CvApp_personne_id` FOREIGN KEY (`user_id`) REFERENCES `cvapp_personne` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
