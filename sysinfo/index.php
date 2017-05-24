<html>
<head><META HTTP-EQUIV='REFRESH' CONTENT='10'></head>
<body>
<h1>Sysinfo</h1>
<pre>
<?php
$hdr = getallheaders();
$proxys = $hdr['X-NGX-VERSION'];
$client = $hdr['X-Real-IP'].":".$hdr['X-Real-Port'];
$redirc = $_SERVER['REMOTE_ADDR'].":".$_SERVER['REMOTE_PORT'];

echo "<tr><td> nginx:</td><td>" .$proxys. "</td></tr><br>";
echo "<tr><td>Nginx side:</td><td>".$client."</td></tr><br>";
echo "<tr><td>Apache side:</td> <td>".$redirc."</td></tr><br>";

echo system("/./home/myuser/loadavg.sh");
echo system("/./home/myuser/iostat.sh");
echo system("/./home/myuser/cpuLoad.sh");
echo system("/./home/myuser/df.sh");
echo system("/./home/myuser/inodes.sh");
echo system("/./home/myuser/ss.sh");
echo system("/./home/myuser/netLoad.sh");

#echo system("top -b -n 1 | head -n15");
?>
</pre></body></html>
