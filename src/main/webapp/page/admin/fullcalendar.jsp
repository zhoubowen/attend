<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" flush="true"/>
<link href='/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<body class="page-header-fixed">

<jsp:include page="top.jsp" flush="true"/>

<div class="page-container row-fluid">

    <jsp:include page="menu.jsp?m=1" flush="true"/>

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
                            <a href="/admin/member/index">排班管理</a>
                            <i class="icon-angle-right"></i>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">

                <div class="span12">
                    <div class="portlet box light-grey">

                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-globe"></i>排班管理
                            </div>

                        </div>

                        <div class="portlet-body">
                            <div id='wrap'>
                                <div id='calendar' class="span12"></div>
                                <div style='clear:both'></div>
                            </div>
                            <%--<div id='wrap'>--%>


                                <%--<div id='external-events' class="span3">--%>
                                    <%--<h4>Draggable Events</h4>--%>
                                    <%--<div class='fc-event'>My Event 1</div>--%>
                                    <%--<div class='fc-event'>My Event 2</div>--%>
                                    <%--<div class='fc-event'>My Event 3</div>--%>
                                    <%--<div class='fc-event'>My Event 4</div>--%>
                                    <%--<div class='fc-event'>My Event 5</div>--%>
                                <%--</div>--%>

                                <%--<div id='calendar' class="span9"></div>--%>

                                <%--<div style='clear:both'></div>--%>

                            <%--</div>--%>

                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<div id="stack1" class="modal hide fade" tabindex="-1" data-focus-on="input:first">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4>选择排班人员</h4>
    </div>
    <form action="/admin/fullcalendar/add" method="post">
        <input type="hidden" name="dutyBeginDate">
        <input type="hidden" name="dutyEndDate">
        <div class="modal-body">
            <select name="userId">

            </select>
        </div>
        <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn">关闭</button>
            <button type="submit" class="btn red">确定</button>
        </div>
    </form>

</div>



<jsp:include page="footer.jsp" flush="true"/>
<script src='/js/moment.min.js'></script>
<script src='/js/jquery-ui.min.js'></script>
<script src='/fullcalendar/fullcalendar.min.js'></script>
<script>
    jQuery(document).ready(function () {
        App.init();

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            buttonText: {
                today: '本月',
                month: '月',
                agendaWeek: '周',
                agendaDay: '日'
            },
            monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
            monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
            dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
            dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
            firstDay: 1,

            events: "/admin/fullcalendar/calendar",

            dayClick : function (date, allDay, jsEvent, view) {
//                alert('Clicked on: ' + date.format());
                $("#stack1").modal('show');
                $("input[name='dutyBeginDate']").val(date.format());
//                alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//                alert('Current view: ' + view.name);
                // change the day's background color just for fun
//                $(this).title = "哈哈";
            },

            //点击时触发
            eventClick: function(calEvent, jsEvent, view) {
//                console.log(calEvent.id);
            },
            //移动时触发
            eventDrop: function(event) {
                save(event.id, $.fullCalendar.formatDate(event.start, "YYYY-MM-DD"), $.fullCalendar.formatDate(event.end, "YYYY-MM-DD"));
            },


            //拉伸时触发
            eventResize: function(event) {
                save(event.id, $.fullCalendar.formatDate(event.start, "YYYY-MM-DD"), $.fullCalendar.formatDate(event.end, "YYYY-MM-DD"));
            },
            //排班时触发
            drop: function(date, allDay) {
                console.log("------" + date);
//                console.log(allDay)
            }
        });


        $.get("/admin/member/memberList",function (data) {
            var useres = [];
            $.each(data, function (i, o) {
                useres.push("<option value="+o.id+">"+o.name+"</option>");
            });
            $("select[name='userId']").html(useres.join(''));
        });

    });
    
    function save(id, start, end) {
        $.post("/admin/fullcalendar/update",
                {
                    id:id,
                    dutyBeginDate : start,
                    dutyEndDate : end
                },function(){

                }
        );
    }

</script>
</body>
</html>
