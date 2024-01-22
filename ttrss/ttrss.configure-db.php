<?php
	function configure_db_query($link, $query, $die_on_error = true) {
           $result = pg_query($link, $query);
           if (!$result) {
              $query = htmlspecialchars($query); // just in case
              if ($die_on_error) {
                 die("Query <i>$query</i> failed [$result]: " . ($link ? pg_last_error($link) : "No connection"));
              }
           }
           return $result;
        }

	function configure_db_connect($host, $user, $pass, $db, $port) {
           $string = "dbname=$db user=$user";

           if ($pass) {
              $string .= " password=$pass";
           }

           if ($host) {
              $string .= " host=$host";
           }

           if ($port) {
              $string = "$string port=" . $port;
           }

           $link = pg_connect($string);

           return $link;
        }
        
        function configure_db_initialize($host, $user, $pass, $name, $port) {
           $link = configure_db_connect($host, $user, $pass, $name, $port);

           if (!$link) {
              die("Unable to connect to database");
           }

	   $result = @configure_db_query($link, "SELECT true FROM ttrss_feeds", false);

           if (!$result) {
              $lines = explode(";", preg_replace("/[\r\n]/", "", file_get_contents("schema/ttrss_schema_pgsql.sql")));

              foreach ($lines as $line) {
                 if (strpos($line, "--") !== 0 && $line) {
                    configure_db_query($link, $line);
                 }
              }
           }
        }
