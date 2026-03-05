#!/bin/bash

echo '{"version": 1,"click_events": true}'
echo '['
echo '[]'

prev_idle=0
prev_total=0

print_n_calc_bar() {
	date_formatted=$(date "+%a %F %I:%M %p")
	cpu_stats=$(grep 'cpu ' /proc/stat)
	read -r _ user nice system idle iowait irq softirq steal _ <<< "$cpu_stats"
	curr_idle=$((idle + iowait))
	curr_total=$((user + nice + system + idle + iowait + irq + softirq + steal))
	diff_idle=$((curr_idle - prev_idle))
	diff_total=$((curr_total - prev_total))	

	if [ "$diff_total" -eq 0 ]; then
	    cpu_now="0.0"
	else
	    cpu_now=$(awk "BEGIN {printf \"%.1f\", 100 * ($diff_total - $diff_idle) / $diff_total}")
	fi

	layout=$(swaymsg -t get_inputs | grep "xkb_active_layout_name" | head -n1 | cut -c32-33)
	mem=$(free -h | awk '/^Mem:/ {print $3 "/" $2}' | tr -d 'i')



	echo ',[
		{"name":"CPU","full_text":"CPU '$cpu_now'%","separator":"false"},
		{"name":"sep","full_text":"|","separator":"false"},
		{"name":"RAM","full_text":"'$mem'","separator":"false"},
		{"name":"sep","full_text":"|","separator":"false"},
		{"name":"kb_layout","full_text":"'$layout'","separator":"false"},
		{"name":"sep","full_text":"|","separator":"false"},
		{"name":"clock","full_text":"'$date_formatted'","separator":"false","align":"right"},
		
    ]'
	prev_idle=$curr_idle
	prev_total=$curr_total
    
}

(while true; do
    print_n_calc_bar
    sleep 1
done) &

while read -r line; do
	[[ "$line" =~ \"x\":\ ([0-9]+),\ \"y\":\ ([0-9]+) ]] || continue
	    
done
