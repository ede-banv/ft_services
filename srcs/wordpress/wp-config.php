<?php

#https://wiki.alpinelinux.org/wiki/WordPress
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', '__DB_NAME__' );

/** MySQL database username */
define( 'DB_USER', '__DB_USER__' );

/** MySQL database password */
define( 'DB_PASSWORD', '__DB_PASSWORD__' );

/** MySQL hostname */
define( 'DB_HOST', '__DB_HOST__' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '$yM~XUln%Smu7Z~r55LX1[U~DrCj=f-Mm[DM&cEHceVU|U+&II1*1|#,sf*N(tnM');
define('SECURE_AUTH_KEY',  'FJ#-)-Qr,|YS,]K~+aI3!q_ VTzTOE;R$`n%X<df7[+KXzIQF!<{)vii=yO-6Cq6');
define('LOGGED_IN_KEY',    'LQ+[AA][.`|COgs~n-NLyda:D+rk-cTV;}6G+]uo4A|SX{!>s7H~|G)E>8T^XSo5');
define('NONCE_KEY',        'k|;$L~5 >7U>7I-Yw[b+w^JyJ#-P H{#E|]DcbM;=6``wcv=ph]g@2a9c}Qi|&2+');
define('AUTH_SALT',        '-W4%(^Ke(,q;{^lW7p+|JK3!RY/l7_,K$KtzWK)1+4:)U(-wf1Evq;@tV}<>(rPE');
define('SECURE_AUTH_SALT', 'zIDm08!99HOfU-.Q*l>r;&=lz!c)1Q+U*E:l=wcptl+aV+ WlD[%?Wc5GJb^i-rw');
define('LOGGED_IN_SALT',   'uuJCWZE-fg5py!E(#y+J|?/Nqq*I<EBM*M}kaY$M])!Vuj+(cd:XA>@|ahSw@+74');
define('NONCE_SALT',       ' VSnyoW<Vl3R(9nx{dv8qR4!rfTX?$%5x3m;A],x!5G$C)=tO_c|gzq]]7^hjB*=');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', true);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', __DIR__ . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once ABSPATH . 'wp-settings.php';