var Lock = function () {

    return {
        //main function to initiate the module
        init: function () {

             $.backstretch([
		        "assets/img/bg/login_bg1.jpg",
		        "assets/img/bg/login_bg2.jpg",
		        "assets/img/bg/login_bg3.jpg",
		        "assets/img/bg/4.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		      });
        }

    };

}();