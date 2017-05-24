<html>
<head><META HTTP-EQUIV='REFRESH' CONTENT='10'></head>
<body>
<h1>Sysinfo</h1>
<pre>
<?php
echo system("/./home/myuser/loadavg.sh");
echo system("/./home/myuser/iostat.sh");
echo system("/./home/myuser/cpuLoad.sh");
echo system("/./home/myuser/df.sh");
echo system("/./home/myuser/inodes.sh");
#echo system("top -b -n 1 | head -n15");
?>
</pre>
</body>
</html>
