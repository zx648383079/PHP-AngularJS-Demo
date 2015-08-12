<?php

define ( 'APP_DIR', './' );
define ( 'APP_URL', 'http://a.test:8080/' );
define ( 'WEB_TITLE', '测试' );
define ( 'VERSION', time () );
define ( 'DEADLINE', '2015-07-15 23:59:59' );

/* Wechat */
define ( 'WX_ORIGINAL_ID', 'gh_56ebf26be70a' );
define ( 'WX_APP_ID', 'wx3d8c927a92bca56a' );
define ( 'WX_APP_SECRET', 'a308be386f098929f08a3059d97837c1' );
define ( 'WX_REDIRECT_URI', APP_URL . 'authorize.php' );
define ( 'WX_SHARE_TITLE', '测试' );
define ( 'WX_SHARE_DESC', '测试' );
define ( 'WX_SHARE_URL', APP_URL . 'index.php' );
define ( 'WX_SHARE_IMG', APP_URL . 'images/share.png' );

define ( 'SESSION_LOGGED', 'logged' );
define ( 'SESSION_UID', 'uid' );
define ( 'SESSION_USERNAME', 'username' );
define ( 'SESSION_LEVELS', 'levels' );
define ( 'SESSION_OPENID', 'openid' );
define ( 'SESSION_USER', 'user' );

//define ( 'API_URL', 'https://uat01.acxiom.com.cn/PRC/rest/customer/register' );
//define ( 'API_SOURCE_NAME', '5669eadfe06994640f11bd8ef694f9c5' );

/* MySQL Connection */
define ( 'DB_NAME', 'nways_wechat' );
define ( 'DB_USER', 'root' );
define ( 'DB_PASSWORD', 'root' );
define ( 'DB_PORT', '3306' );
define ( 'DB_HOST', 'localhost' );
define ( 'DB_TABLEPRE', 'havana_' );

?>