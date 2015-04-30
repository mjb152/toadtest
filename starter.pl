#!/home/mojouser/perl5/perlbrew/perls/perl-5.20.2/bin/perl
use Toadfarm -init;

mount "./test1/script/test1" => { Host => "domain1.com", };
mount "./test2/script/test2" => { Host => "domain2.com", };

start ["http://*:80"];
