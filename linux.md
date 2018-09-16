```bash
!:-  #Insert the last command without the last argument (bash)
```

> 1. `/usr/sbin/ab2 -f TLS1 -S -n 1000 -c 100 -t 2 http://www.google.com/`
> 2. `!:- http://www.commandlinefu.com/`  
> *is the same as*
> 1. `/usr/sbin/ab2 -f TLS1 -S -n 1000 -c 100 -t 2 http://www.commandlinefu.com/`

Find file by name                 `find /usr/local/glassfish/ -type f -name "*.properties" 2>/dev/null | less `  
Find in jar                       `find "$1" -name "*.jar" -exec sh -c 'jar -tf {}|grep -H --label {} '$2'' \;`  
Find file containing string       `grep --exclude-dir='log' -rnw '.' -e 'search string'`  
Diff folder                       `diff -r /dir1 /dir2`  
List ports                        `netstat -an | grep LISTEN`  
List ports (MacOS)                `lsof -i -n -P | grep TCP`  
	
