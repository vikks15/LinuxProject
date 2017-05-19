<html>
<body>
<h1>Sysinfo</h1>
<pre>
<?php
echo system("./loadavg.sh");
echo system("./iostat.sh");
echo system("./cpuLoad.sh")
#echo system("top -b -n 1 | head -n15");
?>
</pre>

<body>
</html>
