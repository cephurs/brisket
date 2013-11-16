class Messages
  class << self
    def trim_opt_sel_err
      "[-] Usage: ./trim.rb <remote|apps|web|db|all> <masscan|nmap|zmap>"
    end
    def rub_opt_sel_err
    	"[-] Usage: ./rub.rb <apac|europe|us_east|us_west|us_all|south_america|all> <masscan|nmap|zmap>"
    end
    def timenow
      Time.new
    end
    def conf_txt
      "[+] Configuration files successfully generated for " +ARGV[0]+ " ports at " +timenow.inspect + "."
    end
    def scan_complete 
    	"[+] Scan completed for " + ARGV[0] + " at " + timenow.inspect + "."
    end
    def create_dir
    	"[+] The directory" + Directories.results_dir_date + " already exists, no need to create it."
    end
    def dir_exists
    	"[+] Created " + Directories.results_dir_date
    end
    def scanstart
      "[+] Beginning scan..."
    end
    def tbd
      "This code has not yet been written..."
    end

    def syslog_stamp
      `date "+%b %d %H:%I:%M"` + `hostname` + " "
    end

  end
end