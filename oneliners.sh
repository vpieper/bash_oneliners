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
