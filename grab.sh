	blue=''
	cyan=''
	green=''
	okegreen=''
	lightgreen=''
	white=''
	g=''
	b=''
	red=''
	yellow=''
	 clear
	checking(){	
		cekdir="ResultGrab"
	if [[ -d "$cekdir" ]];
		then
			echo " ${okegreen}[✓] Directory Result Found"
			sleep 1.2 
			clear
	else
		echo "${red}[X] Directory Result Not Found"
		sleep 1 
		mkdir ResultGrab
		touch ResultGrab/resultsgrab.txt
		echo "${okegreen}[+] Wait, Creating Directory"
		sleep 1.6 
		echo "${okegreen}[✓] SUCCESS !!!"
		sleep 1.5 
		clear
	fi }

	checking 
	CON=1
	grab(){ 
		domen=$(curl -s "https://www.sitesinformation.com/extension/${domain}/$page/" -L | grep -oE "/site/(.*?)/" | cut -d '>' -f2 | cut -d '<' -f1)
	if [[ $domen =~ '.' ]];
		then
			echo "$domen" >> ResultGrab/resultsgrab.txt
			regdomen=$(echo "$domen" | wc -l)
			domainnya=$(cat ResultGrab/resultsgrab.txt | wc -l)
			echo $cyan"================================================================"
		echo "${lightgreen}[✓] Page $white=>$red $page $white|$cyan Grabbing Domain $white=>$red $regdomen $white|$b All Total $white=>$yellow $domainnya"
	else
		echo "${red}[X] Error! Page not found."
	fi
	}
	banner() {
		echo $red"××××××××××××××××××××××××××××××××"
		echo $yellow"  Domain Grabber By good     "
		echo $yellow"  Copyleft sitesinformation.com       "
		echo $yellow"  Licence Mari mari     "
		echo $red"××××××××××××××××××××××××××××××××"
		echo $lightgreen"	
							Tool Information
							❖ Tool Name : Domain Grabber	
							❖ Description : Moga Aja Berguna	
							❖ Creator : AXVDIGITAL	
							❖ Version : 17.0	
							❖ Unlimited Page"
	
	echo $white"Available Domain :"
	echo $b" com | org | de | net | uk | edu | ca | nl | cn | au | fr | cz | pl | jp | it | br | ru | gov | eu | ch | us | in | info | se | es | nz | hu | dk | be | za | tw | lv | at | ro | no | ie | sk | fi | io | vn | co | ua | gr | mx | tr | sg | lt | ee | tv | pt | hk | my | hr | id | kr | me | rs | si | ar | biz | cl | ph | cc | ir | il | mil | pk | bg | th | ba | pe | cat | ae | is | by | nu | lk | ng | ke | int | ge | lu | fm | az | coop |ec | xyz | cy | bd | kz | mk | am | sa | asia | pro | uy | ws | to | al | ve | mt | mobi | tz | travel | bo | md | np | uz | ma | la | aero | name | su | eus | club | zw | gh | jobs | gt | do | cu | cr | ug | news | eg | lb | rw |


	"
	echo $white"Input Option"
	echo $cyan
	read -p "	[#] Input Domain => " domain;
	read -p "	[#] Input Page => " pagen;
	read -p "	[#] Input To Page => " pagenya;
	read -p "	[#] Threads => " THREADS;
	clear
	echo $yellow"Waiting... 1/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 2/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 3/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 4/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 5/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 6/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 7/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 8/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 9/10"
	sleep 0.3
	clear
	echo $yellow"Waiting... 10/10"
	sleep 0.6 
	clear
	}
	banner
		for page in `seq $pagen $pagenya`;
		do
		FAST=$(expr $CON % $THREADS)
		if [[ $FAST == 0 && $CON > 0 ]];
		then
		sleep 1
		fi
		grab 
		CON=$[$CON+1]
		done
		wait
		sleep 2
		echo $cyan"	================================================================"
	echo $lightgreen"	[✓] Success Grabbing ~>"	$yellow"	 $domainnya Domains | "	$lightgreen"	Saved in ~>"	$yellow"	 ResultGrab/resultsgrab.txt"

