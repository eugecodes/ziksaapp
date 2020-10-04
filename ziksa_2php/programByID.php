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
         $courseid = $request->courseid;
         if ($role_id != "") {
            // Create connection
            $conn = new mysqli($servernameDB, $usernameDB, $passwordDB, $dbnameDB);
            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            } 
            $sql = "SELECT * FROM course WHERE id = '$courseid'";
            $result = $conn->query($sql);
            $r2= array();
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $r=array("course_description"=>utf8_decode($row["course_description"])
                    ,"courseid"=>utf8_decode($row["id"])
                    ,"course_start_date"=>utf8_decode($row["course_start_date"])
                    ,"course_end_date"=>utf8_decode($row["course_end_date"])
                    ,"venue"=>utf8_decode($row["venue"])
                    ,"course_cost"=>utf8_decode($row["course_cost"])
                    ,"course_pass_mark"=> utf8_decode($row["course_pass_mark"])
                    ,"exams_enabled"=>utf8_decode($row["exams_enabled"])
                    ,"pretest_enabled"=>utf8_decode($row["pretest_enabled"])
                    ,"trainerid"=>utf8_decode($row["trainerid"])
                    ,"rating"=>utf8_decode($row["rating"])
                    ,"preview_image"=>utf8_decode($row["preview_image"])
                    );
                    array_push($r2,$r);
                }
            }
            $trainer = $r2[0]["trainerid"];
            $sql_trainer = "SELECT user.* FROM user WHERE user.id = '$trainer'";
            $result_trainer = $conn->query($sql_trainer);
            $r_trainer = array();
            if ($result_trainer->num_rows > 0) {
                while($row = $result_trainer->fetch_assoc()) {
                    $r=array("name"=>utf8_decode($row["name"])
                    ,"username"=>utf8_decode($row["username"])
                    ,"address"=>utf8_decode($row["address"])
                    ,"phone"=>utf8_decode($row["phone"])
                    ,"city"=>utf8_decode($row["city"])
                    ,"state"=>$row["state"]
                    ,"country"=>utf8_decode($row["country"])
                    ,"profile_img"=>utf8_decode($row["profile_img"])
                    );
                    array_push($r_trainer,$r);
                }
            }
            
            $sql_content = "SELECT * FROM course_unit WHERE course_id = '$courseid'";
            $result_content = $conn->query($sql_content);
            $r_content= array();
            if ($result_content->num_rows > 0) {
                while($row = $result_content->fetch_assoc()) {
                    $r=array("course_id"=>utf8_decode($row["course_id"])
                    ,"unit_description"=>utf8_decode($row["unit_description"])
                    ,"unit_id"=>utf8_decode($row["id"])
                    );
                    array_push($r_content,$r);
                }
            }
            $sql_att = "SELECT count(user.id) as attendance FROM users_programs INNER JOIN user ON users_programs.userid = user.id WHERE users_programs.programid = '$courseid' AND user.role_id != 1";
            $result_att = $conn->query($sql_att);
            $r_att= array();
            if ($result_att->num_rows > 0) {
                while($row = $result_att->fetch_assoc()) {
                    $r=array("attendance"=>utf8_decode($row["attendance"]));
                    array_push($r_att,$r);
                }
            }
            $sql_att = "SELECT user.name FROM users_programs INNER JOIN user ON users_programs.userid = user.id WHERE users_programs.programid = '$courseid' AND user.role_id != 1 GROUP BY user.name";
            $result_att = $conn->query($sql_att);
            $r_users= array();
            if ($result_att->num_rows > 0) {
                while($row = $result_att->fetch_assoc()) {
                    $r=array("name"=>utf8_decode($row["name"]));
                    array_push($r_users,$r);
                }
            }
            $resultcomplete = array();
            $resultcomplete["info"] = $r2;
            $resultcomplete["content"] = $r_content;
            $resultcomplete["attendance"] = $r_att;
            $resultcomplete["users"] = $r_users;
            $resultcomplete["trainer_info"] = $r_trainer;
            
            echo json_encode($resultcomplete, JSON_UNESCAPED_UNICODE);

            $conn->close();
         }else {
         echo "Empty username parameter!";
         }
     }else {
        echo "Not called properly with username parameter!";
     }
?>