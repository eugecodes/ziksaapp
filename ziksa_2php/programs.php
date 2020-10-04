<?php
require "config.php";
 
 if (isset($_SERVER['HTTP_ORIGIN'])) {
        header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Max-Age: 86400');    // cache for 1 day
    }
 
    // Access-Control headers are received during OPTIONS requests
    if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
 
        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         
 
        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
            header("Access-Control-Allow-Headers:        {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
 
        exit(0);
    }
    
    $postdata = file_get_contents("php://input");
     if (isset($postdata)) {
         $request = json_decode($postdata);
         $role_id = $request->role_id;
         $userid = $request->userid;
         $is_completed = $request->is_completed;
         $starttime = $request->starttime;
         $endtime = $request->endtime;
         if ($role_id != "") {
            // Create connection
            $conn = new mysqli($servernameDB, $usernameDB, $passwordDB, $dbnameDB);
            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            } 
            $sql = "SELECT coursetbl.course_description ,coursetbl.id as courseid ,coursetbl.preview_image,coursetbl.course_start_date ,coursetbl.course_end_date ,coursetbl.venue ,coursetbl.course_cost  ,coursetbl.course_pass_mark ,coursetbl.exams_enabled ,coursetbl.pretest_enabled ,coursetbl.trainerid ,count(users_programs.id) as attendance ";
            if($role_id ==1){
            $sql .= "FROM course coursetbl LEFT JOIN users_programs ON users_programs.programid = coursetbl.id ";
            }else{
            $sql .="FROM users_programs LEFT JOIN course coursetbl ON users_programs.programid = coursetbl.id ";
            }
            $sql .= " WHERE coursetbl.id != 0";
            if($is_trainer == 5){
                $sql .= " AND users_programs.userid = '$userid'";
            }
            if($is_completed == "true"){
                $today = date("Y-m-d");
                $sql .= " AND coursetbl.course_end_date <= '$today'";
            }
            if($starttime != '0000-00-00' && $endtime != '0000-00-00'){
                $sql .= " AND coursetbl.course_start_date > '$starttime'";
                /*$sql .= " AND coursetbl.course_end_date < '$endtime'";*/
            }
            $sql .=" GROUP BY coursetbl.course_description ,coursetbl.id ,coursetbl.preview_image,coursetbl.course_start_date ,coursetbl.course_end_date ,coursetbl.venue ,coursetbl.course_cost ,coursetbl.course_pass_mark ,coursetbl.exams_enabled ,coursetbl.pretest_enabled ,coursetbl.trainerid";
            //echo $sql;
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                $r2= array();
                while($row = $result->fetch_assoc()) {
                    $r=array("course_description"=>utf8_decode($row["course_description"])
                    ,"courseid"=>utf8_decode($row["courseid"])
                    ,"course_start_date"=>utf8_decode($row["course_start_date"])
                    ,"course_end_date"=>utf8_decode($row["course_end_date"])
                    ,"venue"=>utf8_decode($row["venue"])
                    ,"course_cost"=>utf8_decode($row["course_cost"])
                    ,"course_pass_mark"=> utf8_decode($row["course_pass_mark"])
                    ,"exams_enabled"=>utf8_decode($row["exams_enabled"])
                    ,"pretest_enabled"=>utf8_decode($row["pretest_enabled"])
                    ,"trainerid"=>utf8_decode($row["trainerid"])
                    ,"preview_image"=>utf8_decode($row["preview_image"])
                    );
                    array_push($r2,$r);
                }
                echo json_encode($r2, JSON_UNESCAPED_UNICODE);
            } else {
                echo "0 results";
            }
            $conn->close();
         }else {
         echo "Empty username parameter!";
         }
     }else {
        echo "Not called properly with username parameter!";
     }
?>