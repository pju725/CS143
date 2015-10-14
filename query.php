<html>
<head>
    <title>CS143 Project 1B</title>
</head>
<body>
    <p>Type an SQL query in the following box: </p>
    <p>Example: <tt>SELECT * FROM Actor WHERE id=10;</tt><br /></p
     <p>
        <form action="query.php" method="GET">
            <textarea name="query" cols="60" rows="8"></textarea><br />
            <input type="submit" value="Submit" />
        </form>
    </p>

    <?php
        $db_connection = mysql_connect("localhost", "cs143", "");
        $query = $_GET["query"];
        $query_to_issue = mysql_real_escape_string($query);
        if(!$db_connection){
            die('Error: Could not connect: ' . mysql_error());
        }
        mysql_select_db("TEST", $db_connection);
        $res = mysql_query($query_to_issue, $db_connection);

    ?>

    <p><small>Note: tables and fields are case sensitive.
    All tables in Project 1B are availale.</small>
    </p>

    <?php
        if($res){
            echo '<h3>Results from MySQL:</h3>';
            //Print Table Header
            echo '<table border=1 cellspacing=1 cellpadding=2><tr align=center>';
            $i = 0;
            while ($i < mysql_num_fields($res)){
                $column = mysql_fetch_field($res, $i);
                echo '<td><b>' . $column->name . '</b></td>';
                $i = $i + 1;
            }
            echo '</tr>';
            //Print Table Body
            while ($row =  mysql_fetch_row($res)){
                echo '<tr align=center>';

                $j = 0;
                while ($j < mysql_num_fields($res)){
                    if ($row[$j] === NULL){
                            echo '<td>  N/A </td>';
                    }
                    else{
                            echo '<td>' . $row[$j]  . '</td>';
                    }

                    $j = $j + 1;
                }

                echo '</tr>';
            }
        echo '</table>';
        }
        mysql_close($db_connection);
    ?>

</body>
</html>