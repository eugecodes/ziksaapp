angular.module('starter.controllers', [])

.controller('DashCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {})

.controller('myProgramsCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams, Chats) {
    $scope.selection = {
        togglecomplete:false,
        time: "4"
    };
    $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.refreshdata = function(){
        var link = 'http://localhost/ziksa_2php/programs.php';
        var start_date ='0000-00-00';
        var end_date ='0000-00-00';
        var today = new Date();
        switch($scope.selection.time){
            case "1":
                end_date = (today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate()).toString();
                today.setMonth(today.getMonth()-1);
                start_date = (today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate()).toString();
                break;
            case "2":
                end_date = (today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate()).toString();
                today.setMonth(today.getMonth()-5);
                start_date = (today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate()).toString();
                break;
            case "3":
                end_date = (today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate()).toString();
                today.setFullYear(today.getFullYear()-1);
                start_date = (today.getFullYear() +"-"+(today.getMonth()+1)+"-"+today.getDate()).toString();
                break;
            case "4":
                start_date ='0000-00-00';
                end_date ='0000-00-00';     
                break;
            default:
                break;
        }
    $http.post(link, {role_id : $scope.userInfo.role ,userid: $scope.userInfo.userid,is_completed : $scope.selection.togglecomplete,starttime:start_date,endtime:end_date}).then(function (res){
        $scope.response = res.data;
        //console.log(res.data);
        $scope.selection.list = res.data;
        console.log($scope.selection.list);
    });
    };
    $scope.pushNotificationChange = function() {
        $scope.refreshdata();
        //console.log('Push Notification Change', $scope.formData.is_completed);
    };
    $scope.initialize = function(){
        $scope.show_loading();
        var db = window.openDatabase("database_temp", '1.0', 'Test DB', 2 * 1024 * 1024);
        db.transaction(function (tx) {
        tx.executeSql('SELECT * FROM LOGININFO', [], function (tx, results) {
           var len = results.rows.length, i;
           if(len > 0){
               $rootScope.userInfo = results.rows.item(i);
               //alert("done A"+ $scope.userInfo.name);
               $scope.hide_loading();
               $scope.refreshdata();
           }
        }, null);
     },function(){
       //error  
        $state.go("menu.login");
     },function(){
       //alert("sucess ");
       $timeout(function(){
        try{
        if($scope.userInfo.name == "" || $scope.userInfo.name == undefined ){
            //alert("sucess B");
            $state.go("menu.login");
        }
       }catch(e){
           $scope.hide_loading();
           $state.go("menu.login");
        }
       },200);

        //alert("done B"+ $scope.userInfo.username);
     });
    };
    $scope.initialize();
})

.controller('myPrograms2Ctrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams, Chats) {
  /*$scope.chat = Chats.get($stateParams.chatId);*/
})

.controller('myPrograms3Ctrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
})

.controller('myCalendarCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
})
.controller('myCalendar2Ctrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
})
.controller('myProfileSettingsCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
$scope.settings = {
    active:true,
    rating:0,
    corporate:true,
    password: "",
    confirm_password: ""
};
  var link_data = 'http://localhost/ziksa_2php/usersByID.php';
  var link_roles = 'http://localhost/ziksa_2php/getRoles.php';
  var link_save = "http://localhost/ziksa_2php/updateUserByID.php";
  $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.show_loading();
    var db = window.openDatabase("database_temp", '1.0', 'Test DB', 2 * 1024 * 1024);
    db.transaction(function (tx) {
        tx.executeSql('SELECT * FROM LOGININFO', [], function (tx, results) {
           var len = results.rows.length, i;
           if(len > 0){
               $rootScope.userInfo = results.rows.item(i);
               $scope.hide_loading();
               $scope.getdata();
           }
        }, null);
     },function(){//error  
        $state.go("menu.login");
     },function(){//sucess
       $timeout(function(){
        try{
        if($scope.userInfo.name == "" || $scope.userInfo.name == undefined ){
            $state.go("menu.login");
        }
       }catch(e){
           $scope.hide_loading();
           $state.go("menu.login");
        }
       },200);
     });
    $scope.getdata = function(){
        $http.post(link_roles, {}).then(function (res){
            $scope.response = res.data;
            $scope.settings.roles = res.data;
            console.log($scope.settings.roles);
        });
        $http.post(link_data, {userid: $scope.userInfo.userid}).then(function (res){
            $scope.response = res.data;
            $scope.settings.user = res.data[0];
            if($scope.settings.user.active == "1"){
                $scope.settings.active =true;
            }else{
                $scope.settings.active =false;
            }
            //$scope.settings.corporate
            $scope.settings.rating = $scope.settings.user.rating;
            console.log($scope.settings.user);
        });
    };
    $scope.save = function(){
        var vactive ="0";
        if($scope.settings.active == true){
            vactive ="1";
        }else{
            vactive ="0";
        }
        $http.post(link_save, {userid: $scope.userInfo.userid,rating: $scope.settings.rating,active: vactive}).then(function (res){
            $scope.response = res.data;
            //$scope.settings.roles = res.data;
            console.log($scope.response);
             var alertPopup = $ionicPopup.alert({
                 title: 'Changes Saved',
                 template: 'The changes have been saved successfully!'
               });
               alertPopup.then(function(res) { });
        });
    };
    $scope.changepassword = function(){
        if($scope.settings.password !="" && $scope.settings.confirm_password !="" && $scope.settings.password == $scope.settings.confirm_password){
        $http.post(link_save, { userid: $scope.userInfo.userid,password: $scope.settings.password }).then(function (res){
            $scope.response = res.data;
            //$scope.settings.roles = res.data;
            console.log($scope.response);
             var alertPopup = $ionicPopup.alert({
                 title: 'Password Saved',
                 template: 'The password has been changed successfully!'
               });
               alertPopup.then(function(res) { });
               });
        }else{
            if($scope.settings.password =="" || $scope.settings.confirm_password ==""){
             var alertPopup = $ionicPopup.alert({
                 title: 'Change Failed',
                 template: 'Please fill both fields'
               });
               alertPopup.then(function(res) {});
            }else if($scope.settings.password != $scope.settings.confirm_password){
             var alertPopup = $ionicPopup.alert({
                 title: "Change Failed",
                 template: "The passwords don't match!"
               });
            alertPopup.then(function(res) {});
            }
        }
    };
})
.controller('menuCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.gotosettings = function(){
      
  };
  $scope.gotoPrograms = function(){};
})
.controller('loginCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $ionicPopup, $stateParams) {
    $scope.loginData = {};
    var db = window.openDatabase("database_temp", '1.0', 'Test DB', 2 * 1024 * 1024);
    $scope.closeLogin = function() {};
    db.transaction(function (tx) {
        tx.executeSql('SELECT * FROM LOGININFO', [], function (tx, results) {
           var len = results.rows.length, i;
           if(len > 0){
               $rootScope.userInfo = results.rows.item(i);
               if($rootScope.userInfo.role == 1){
                    $rootScope.reloadpage = true;
                    $state.transitionTo("menu.myPrograms", null, {'reload':true});
               }else if($rootScope.userInfo.role == 2) {
                    $rootScope.reloadpage = true;
                    $state.transitionTo("menu.myPrograms3", null, {'reload':true});
               }else if($rootScope.userInfo.role == 3) {
                    $rootScope.reloadpage = true;
                    $state.transitionTo("menu.myPrograms2", null, {'reload':true});
               }
           }
        }, null);
     });
    $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.doLogin = function() {
        $scope.show_loading();
        db.transaction(function (tx) {
            tx.executeSql('DROP TABLE IF EXISTS LOGININFO;');
            tx.executeSql('CREATE TABLE IF NOT EXISTS LOGININFO(userid,name,role);');
        });
        var link = 'http://localhost/ziksa_2php/login.php';
        $http.post(link, {username : $scope.loginData.username,password : $scope.loginData.password}).then(function (res){
            $scope.hide_loading();
            $scope.response = res.data;
            $rootScope.userInfo = res.data;
            if($scope.userInfo.id === undefined){
               var alertPopup = $ionicPopup.alert({
                 title: 'Login Failed',
                 template: 'The username or password in incorrect!'
               });
               alertPopup.then(function(res) {
                 
               });
            }else{
                console.log($scope.userInfo);
                db.transaction(function (tx) {
                    tx.executeSql('INSERT INTO LOGININFO(userid,name,role) VALUES(?,?,?)',[$scope.userInfo.id +"", $scope.userInfo.name, $scope.userInfo.role_id]);
                });
                if($scope.userInfo.role_id == 1){
                    $state.transitionTo("menu.myPrograms", null, {'reload':false});
               }else if($scope.userInfo.role_id == 2) {
                    $state.transitionTo("menu.myPrograms3", null, {'reload':false});
               }else if($scope.userInfo.role_id == 3) {
                    $state.transitionTo("menu.myPrograms2", null, {'reload':false});
               }
            }
        });  
    };
})
.controller('signupCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
    $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.registerdata = {};
    $scope.registerdata.roles = 0;
    var link = 'http://localhost/ziksa_2php/signup.php';
     $scope.doRegister = function() {
        if($scope.registerdata.roles != 0 
        && $scope.registerdata.name != "" 
        && $scope.registerdata.username != "" 
        && $scope.registerdata.password != ""
        && $scope.registerdata.roles != undefined 
        && $scope.registerdata.name != undefined 
        && $scope.registerdata.username != undefined 
        && $scope.registerdata.password != undefined
        ){
        $scope.show_loading();
        $http.post(link, {name : $scope.registerdata.name,username : $scope.registerdata.username,password : $scope.registerdata.password,role:$scope.registerdata.roles}).then(function (res){
            $scope.response = res.data;
            $rootScope.userInfo = res.data;
            $scope.hide_loading();
            if($scope.userInfo.done === undefined){
               var alertPopup = $ionicPopup.alert({
                 title: 'Registration Failed',
                 template: 'Something went wrong, please try again after some minutes'
               });
               alertPopup.then(function(res) {});
            }else{   
              var alertPopup = $ionicPopup.alert({
                 title: 'Registration Successfully',
                 template: 'Congratulations! Your user has been registered successfully'
               });
               alertPopup.then(function(res) {
                 $state.go("menu.login");
               });
            }
        });
     }else{
         
        var alertPopup = $ionicPopup.alert({
         title: 'Registration',
         template: 'Please fill all the fields'
        });
        alertPopup.then(function(res) {});
     }
     };
})
.controller('logoutCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
    var db = window.openDatabase("database_temp", '1.0', 'Test DB', 2 * 1024 * 1024);
    $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.show_loading();
    db.transaction(function (tx) {
        tx.executeSql('DROP TABLE IF EXISTS LOGININFO;');
    });
    $timeout(function() {
        $scope.hide_loading();
        $state.go("menu.login");
    }, 500);  
})
.controller('programDetailsCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
})
.controller('profileCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
    $scope.settings = {};
  var link_data = 'http://localhost/ziksa_2php/usersByID.php';
  var link_roles = 'http://localhost/ziksa_2php/getRoles.php';
  var link_save = "http://localhost/ziksa_2php/updateUserByID.php";
  $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.show_loading();
    var db = window.openDatabase("database_temp", '1.0', 'Test DB', 2 * 1024 * 1024);
    db.transaction(function (tx) {
        tx.executeSql('SELECT * FROM LOGININFO', [], function (tx, results) {
           var len = results.rows.length, i;
           if(len > 0){
               $rootScope.userInfo = results.rows.item(i);
               $scope.hide_loading();
               $scope.getdata();
           }
        }, null);
     },function(){//error  
        $state.go("menu.login");
     },function(){//sucess
       $timeout(function(){
        try{
        if($scope.userInfo.name == "" || $scope.userInfo.name == undefined ){
            $state.go("menu.login");
        }
       }catch(e){
           $scope.hide_loading();
           $state.go("menu.login");
        }
       },200);
     });
    $scope.getdata = function(){
        $http.post(link_roles, {}).then(function (res){
            $scope.response = res.data;
            $scope.settings.roles = res.data;
            console.log($scope.settings.roles);
        });
        $http.post(link_data, {userid: $scope.userInfo.userid}).then(function (res){
            $scope.response = res.data;
            $scope.settings.user = res.data[0];
            if($scope.settings.user.active == "1"){
                $scope.settings.active =true;
            }else{
                $scope.settings.active =false;
            }
            //$scope.settings.corporate
            $scope.settings.rating = $scope.settings.user.rating;
            console.log($scope.settings.user);
        });
    };
})
.controller('courseOfCookingCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
    var courseid = $stateParams.programId;
    var link = 'http://localhost/ziksa_2php/programByID.php';
    $scope.data = [];
    $scope.forms = {
        studentsdropdown: true,
        icon: 'icon ion-android-arrow-dropright-circle',
        informationdropdown: true,
        icon2: 'icon ion-android-arrow-dropright-circle',
        contentdropdown: true,
        icon3: 'icon ion-android-arrow-dropright-circle'
    };
    $scope.show_loading = function() {
        $ionicLoading.show({
            template: '<ion-spinner icon="android"></ion-spinner>'
        });
    };
    $scope.hide_loading = function(){
        $ionicLoading.hide();
    };
    $scope.show_loading();
    var db = window.openDatabase("database_temp", '1.0', 'Test DB', 2 * 1024 * 1024);
    db.transaction(function (tx) {
        tx.executeSql('SELECT * FROM LOGININFO', [], function (tx, results) {
           var len = results.rows.length, i;
           if(len > 0){
               $rootScope.userInfo = results.rows.item(i);
               $scope.hide_loading();
               $scope.getdata();
           }
        }, null);
     },function(){//error  
        $state.go("menu.login");
     },function(){//sucess
       $timeout(function(){
        try{
        if($scope.userInfo.name == "" || $scope.userInfo.name == undefined ){
            $state.go("menu.login");
        }
       }catch(e){
           $scope.hide_loading();
           $state.go("menu.login");
        }
       },200);
     });
    $scope.getdata = function(){
        $http.post(link, {role_id : $scope.userInfo.role ,userid: $scope.userInfo.id, courseid: $stateParams.programId}).then(function (res){
            $scope.response = res.data;
            $scope.data.list = res.data;
            console.log($scope.data.list);
        });
    };
    $scope.hide_students = function(){
        if($scope.forms.studentsdropdown){
            $scope.forms.studentsdropdown = false;
            $scope.forms.icon = 'icon ion-android-arrow-dropup';
        }else{
            $scope.forms.studentsdropdown = true;
            $scope.forms.icon = 'icon ion-android-arrow-dropright-circle';
        }
    };
    $scope.hide_info = function(){
        if($scope.forms.informationdropdown){
            $scope.forms.informationdropdown = false;
            $scope.forms.icon2 = 'icon ion-android-arrow-dropup';
        }else{
            $scope.forms.informationdropdown = true;
            $scope.forms.icon2 = 'icon ion-android-arrow-dropright-circle';
        }
    };
    $scope.gotocalendar = function(){
        $state.go("menu.myCalendar");
    };
    $scope.hide_content = function(){
        if($scope.forms.contentdropdown){
            $scope.forms.contentdropdown = false;
            $scope.forms.icon3 = 'icon ion-android-arrow-dropup';
        }else{
            $scope.forms.contentdropdown = true;
            $scope.forms.icon3 = 'icon ion-android-arrow-dropright-circle';
        }
    };
})
.controller('courseOfCooking2Ctrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
})
.controller('courseOfCooking3Ctrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
})
.controller('changePasswordCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  
})
.controller('settingsCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {

})
.controller('messageCtrl', function($rootScope, $scope, $ionicLoading,$http, $state, $timeout, $ionicPopup, $stateParams) {
  $scope.settings = {
    enableFriends: true
  };
});
