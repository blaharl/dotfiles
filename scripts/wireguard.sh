read server

cd /home/user/.dotfiles/private/mullvad_conf/

case $server in

	"jp1" | "tyo1")
		wg-quick down ./curr.conf
		cp jp-tyo-wg-001.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp2" | "tyo2")
		wg-quick down ./curr.conf
		cp jp-tyo-wg-002.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp3" | "tyo3")
		wg-quick down ./curr.conf
		cp jp-tyo-wg-201.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp4" | "tyo4")
		wg-quick down ./curr.conf
		cp jp-tyo-wg-202.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp5" | "tyo5")
		wg-quick down ./curr.conf
		cp jp-tyo-wg-203.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp6" | "osa1")
		wg-quick down ./curr.conf
		cp jp-osa-wg-001.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp7" | "osa2")
		wg-quick down ./curr.conf
		cp jp-osa-wg-003.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp8" | "osa3")
		wg-quick down ./curr.conf
		cp jp-osa-wg-004.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"jp6" | "osa1")
		wg-quick down ./curr.conf
		cp jp-osa-wg-001.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"sg1" | "sin1")
		wg-quick down ./curr.conf
		cp sg-sin-wg-001.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"sg2" | "sin2")
		wg-quick down ./curr.conf
		cp sg-sin-wg-002.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"sg3" | "sin3")
		wg-quick down ./curr.conf
		cp sg-sin-wg-003.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"sg4" | "sin4")
		wg-quick down ./curr.conf
		cp sg-sin-wg-101.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"sg5" | "sin5")
		wg-quick down ./curr.conf
		cp sg-sin-wg-102.conf ./curr.conf
		wg-quick up ./curr.conf
		;;
	"on")
		wg-quick down ./curr.conf
		wg-quick up ./curr.conf
		;;
	"off")
		wg-quick down ./curr.conf
		;;
	*)
		echo -n "unknown relay"
		;;
esac
	
	
