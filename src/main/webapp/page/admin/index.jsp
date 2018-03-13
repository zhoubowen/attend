<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container">
    <jsp:include page="menu.jsp" flush="true"/>

    <div class="page-content">
        <div id="portlet-config" class="modal hide">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"></button>
                <h3>Widget Settings</h3>
            </div>
            <div class="modal-body">
                Widget settings form goes here
            </div>
        </div>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <h4 class="page-title">
                        管理面板
                        <small>statistics and more</small>
                    </h4>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">面板</a></li>
                        <li class="pull-right no-text-shadow">
                            <div id="dashboard-report-range"
                                 class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive"
                                 data-tablet="" data-desktop="tooltips" data-placement="top"
                                 data-original-title="Change dashboard date range">
                                <i class="icon-calendar"></i>
                                <span></span>
                                <i class="icon-angle-down"></i>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

</div>
<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
        Index.init();
//        Index.initJQVMAP(); // init index page's custom scripts
//        Index.initCalendar(); // init index page's custom scripts
//        Index.initCharts(); // init index page's custom scripts
//        Index.initChat();
//        Index.initMiniCharts();
        Index.initDashboardDaterange();
        Index.initIntro();
    });

</script>
</body>
</html>
