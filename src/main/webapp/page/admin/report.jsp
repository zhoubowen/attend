<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="header.jsp" flush="true"/>

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=5" flush="true"/>

    <div class="page-content">

        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">功能</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="/admin/member/index">报表管理</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">报表管理</a></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>员工考勤报表数据
                            </div>
                        </div>

                        <div class="portlet-body">

                            <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                            <div id="main"  class="span12" style="height:500px;"></div>
                            <div style='clear:both'></div>

                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<jsp:include page="footer.jsp" flush="true"/>
<script>
    jQuery(document).ready(function () {
        App.init();
        TableManaged.init();
//        $('#static').on('show.bs.modal', function (event) {
//            var btnThis = $(event.relatedTarget); //触发事件的按钮
//            var memberId = btnThis.data("id");
//            $(this).find('input[name=memberId]').val(memberId);
//        });


        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '员工考勤数据'//,
                //subtext: '数据来自网络'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ${titles}
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                data: ${category}
            },
            series: ${datas}
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

    });



</script>
</body>
</html>
