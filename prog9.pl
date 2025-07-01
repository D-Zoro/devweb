#! usr/bin/perl 
print "Content-type: text/html\n\n";
print "<html><head><title> Result of the insert operation</title></head>";
use CGI ':standard';
use   DBI;
$dbh=DBI->connect("DBI:mysql:muz","apache","cool");
$name=param("name");
$age=param("age");
$qh=$dbh->prepare("insert into stud values('$name','$age')");
$qh->execute();
$qh=$dbh->prepare("select * from stud");
$qh->execute();
print"<table border size =1><tr><th>Name</th>Age</th></tr>";
while(($name,$age)=$qh->fetchrow()){
  print "<tr><td>$name</td><td>$age</td></tr>";
}
print "</table>";
$qh->finish();
$dbh->disconnect();
print"</html>";
