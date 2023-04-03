#!/usr/bin/expect -f
set timeout -1
spawn bash /home/aggregate_core_6.20.00_unix-x64.sh
expect "Please select a language:"
send -- "2\r"
expect "OK [o, Enter], Cancel [c]"
send -- "o\r"
expect eof