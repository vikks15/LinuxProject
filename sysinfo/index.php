<html>
<head><META HTTP-EQUIV='REFRESH' CONTENT='10'></head>
<body>
<h1>Sysinfo</h1>
<pre>
<?php
echo system("/./home/myuser/loadavg.sh");
#echo system("cat /home/myuser/iorec");
echo system("/./home/myuser/iostat.sh");
echo system("/./home/myuser/cpuLoad.sh");
#echo system("top -b -n 1 | head -n15");
?>
</pre>

<body>
</html>
