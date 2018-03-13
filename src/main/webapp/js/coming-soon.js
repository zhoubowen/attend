var CoomingSoon = function () {

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
    		          duration: 10000
    		    });

            var austDay = new Date();
            austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
            $('#defaultCountdown').countdown({until: austDay});
            $('#year').text(austDay.getFullYear());
        }

    };

}();