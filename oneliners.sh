#logfile manipulation and firewall entries
for ip in `tail combined_log -n 100 | grep "POST /administrator/index.php HTTP/1.1" |grep " 200 "|cut -d' ' -f1|grep -i -v ":" |sort |uniq`; do echo "iptables -I FAIL2BAN -s $ip -j DROP"; done

cat /var/log/mail.log | grep "from=mail@mail.tld" | grep policy | cut -d "=" -f7 | cut -d "," -f1 | sort | uniq -c | sort -n

cat /var/www/domains/website/logs/combined_log | cut -d " " -f1 | sort -n | uniq -c | sort -n

for ip in `tail -n500 /var/log/apache2/all_domains_combined_log | grep -i "POST /wp-login.php" | cut -d ' ' -f2 | grep -i -v ":" | sort | uniq`; do echo "iptables -I FAIL2BAN -s $ip -j DROP"; done

for ip in `cat /var/www/domains/domain.nl/logs/combined_log | grep -i "bing" | cut -d ' ' -f1 | grep -i -v ":" | sort | uniq`; do echo "iptables -I FAIL2BAN -s $ip -j DROP"; done

for ip in `tail combined_log -n 100 | grep "GET /wp-login.php HTTP/1.0" |grep " 301 "|cut -d' ' -f1|grep -i -v ":" |sort |uniq`; do echo "iptables -I FAIL2BAN -s $ip -j DROP"; done

cat /var/log/apache2/all_domains_combined_log | zcat /var/log/apache2/all_domains_combined_log.* | grep -i "post /xmlrpc.php" | cut -d " " -f2 | sort -n | uniq -c | sort -n

less /var/log/apache2/access.log | cut -d " " -f1 | sort -n | uniq -c | sort -n

cat /var/log/mail.log | grep "from=mail@mail.com" | grep policy | cut -d "=" -f7 | cut -d "," -f1 | sort | uniq -c | sort -n

tail -n250 /var/www/domains/domain.nl/logs/combined_log | cut -d " " -f1 | sort -n | uniq -c | sort -


#scrape website and download result
/usr/bin/elinks "http://website.tld/file.xml" |  grep -o 'http:[^"]*' | grep mp3 | xargs wget -k -q -P /storage/

for i in {50000..60000}; do wget -O $i.jpg "http://www.website.tld/images/script/image.php?977="$i; done

# upgrade all pypi packages:
pip list --outdated | cut -d' ' -f1 | xargs pip install --upgrade

#filter IPv4 adres en uit logfile, na grep op 'bot', sorteer, tel aantal, en sorteer op IP
tail /var/log/apache2/access.log -n 100000 |grep bot |cut -d' ' -f1|sort|uniq -c |sort -n

#herhaal postqueue -f elke 30 seconden
while true; do postqueue -f; sleep 30; done;

#last edited files in current dir
find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head

#delete mailq mails with MAILER search tag
mailq | grep "MAILER" |cut -d' ' -f1|postsuper -d -

#opvragen HTTP headers
====CURL====
curl -I -L 0wnd.nl
curl -Ls -o /dev/null -w %{url_effective} http://www.domein.nl/
curl -i http://www.domein.nl/

====GET (libwwwperl):====

root@evenstar { ~ }$ GET -S -d -e http://google.com
GET http://google.com
302 Found
Cache-Control: private
Connection: close
Date: Mon, 30 Jan 2017 12:26:09 GMT
Location: http://www.google.nl/?gfe_rd=cr&ei=4TCPWMKwCbCk8wffjomgDg
Content-Length: 258
Content-Type: text/html; charset=UTF-8
Client-Date: Mon, 30 Jan 2017 12:26:09 GMT
Client-Peer: 172.217.17.46:80
Client-Response-Num: 1
Title: 302 Moved

GET http://www.google.nl/?gfe_rd=cr&ei=4TCPWMKwCbCk8wffjomgDg
200 OK
Cache-Control: private, max-age=0
Connection: close
Date: Mon, 30 Jan 2017 12:26:09 GMT
Accept-Ranges: none
Server: gws
Vary: Accept-Encoding
Content-Type: text/html; charset=ISO-8859-1
Expires: -1
Client-Date: Mon, 30 Jan 2017 12:26:09 GMT
Client-Peer: 172.217.17.35:80
Client-Response-Num: 1
Link: </images/branding/product/ico/googleg_lodp.ico>; rel="shortcut icon"
P3P: CP="This is not a P3P policy! See https://www.google.com/support/accounts/answer/151657?hl=en for more info."
Set-Cookie: NID=95=RbT6i6k9XEqzTYOdRr15R1rZfrdSAEMlnyTjJ8h9gyYmmoz-rC_ttZSXUaT5ptQQiDIr0n99PVU69Nzy0pcBQTDNS2j4CNjAH-6g_H-rV8vVWIlEGjnHaABUbhOtJ6G3; expires=Tue, 01-Aug-2017 12:26:09 GMT; path=/; domain=.google.nl; HttpOnly
Title: Google
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block

$ GET -S -d -e http://google.com
GET http://google.com --> 301 Moved Permanently
GET http://www.google.com/ --> 302 Found
GET http://www.google.ca/ --> 200 OK
Cache-Control: private, max-age=0
Connection: close
Date: Sat, 19 Jun 2010 04:11:01 GMT
Server: gws
Content-Type: text/html; charset=ISO-8859-1
Expires: -1
Client-Date: Sat, 19 Jun 2010 04:11:01 GMT
Client-Peer: 74.125.155.105:80
Client-Response-Num: 1
Set-Cookie: PREF=ID=a1925ca9f8af11b9:TM=1276920661:LM=1276920661:S=ULFrHqOiFDDzDVFB; expires=Mon, 18-Jun-2012 04:11:01 GMT; path=/; domain=.google.ca
Title: Google
X-XSS-Protection: 1; mode=block
