# LogParser
A ruby script for parsing log files

Recevies a log as an argument - e.g webserver.log

/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067
/about/2 444.701.448.104
/help_page/1 929.398.951.889
/index 444.701.448.104
/help_page/1 722.247.931.582
/about 061.945.150.735
/help_page/1 646.865.545.408
/home 235.313.352.950


Returns the following:

list of webpages with most page views ordered from most pages views to less page views 
e.g.:
/home 90 visits /index 80 visits etc... 

list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views /index 5 unique views etc.
