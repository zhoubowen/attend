<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="header.jsp"%>

<body class="page-header-fixed page-full-width">
<%@include file="nav.jsp"%>

<div class="page-container row-fluid">
    <div class="form-horizontal form-view">

        <h3> View User Info - Bob Nilson </h3>

        <h3 class="form-section">Person Info</h3>

        <div class="row-fluid">

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" for="firstName">First Name:</label>

                    <div class="controls">

                        <span class="text">Bob</span>

                    </div>

                </div>

            </div>

            <!--/span-->

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" for="lastName">Last Name:</label>

                    <div class="controls">

                        <span class="text">Nilson</span>

                    </div>

                </div>

            </div>

            <!--/span-->

        </div>

        <!--/row-->

        <div class="row-fluid">

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >Gender:</label>

                    <div class="controls">

                        <span class="text">Male</span>

                    </div>

                </div>

            </div>

            <!--/span-->

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >Date of Birth:</label>

                    <div class="controls">

                        <span class="text bold">20.01.1984</span>

                    </div>

                </div>

            </div>

            <!--/span-->

        </div>

        <!--/row-->

        <div class="row-fluid">

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >Category:</label>

                    <div class="controls">

                        <span class="text bold">Category1</span>

                    </div>

                </div>

            </div>

            <!--/span-->

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >Membership:</label>

                    <div class="controls">

                        <span class="text bold">Free</span>

                    </div>

                </div>

            </div>

            <!--/span-->

        </div>

        <!--/row-->

        <h3 class="form-section">Address</h3>

        <div class="row-fluid">

            <div class="span12 ">

                <div class="control-group">

                    <label class="control-label" >Street:</label>

                    <div class="controls">

                        <span class="text">#24 Sun Park Avenue, Rolton Str</span>

                    </div>

                </div>

            </div>

        </div>

        <div class="row-fluid">

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >City:</label>

                    <div class="controls">

                        <span class="text">New York</span>

                    </div>

                </div>

            </div>

            <!--/span-->

            <div class="span6">

                <div class="control-group">

                    <label class="control-label" >State:</label>

                    <div class="controls">

                        <span class="text">New York</span>

                    </div>

                </div>

            </div>

            <!--/span-->

        </div>

        <!--/row-->

        <div class="row-fluid">

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >Post Code:</label>

                    <div class="controls">

                        <span class="text">457890</span>

                    </div>

                </div>

            </div>

            <!--/span-->

            <div class="span6 ">

                <div class="control-group">

                    <label class="control-label" >Country:</label>

                    <div class="controls">

                        <span class="text">USA</span>

                    </div>

                </div>

            </div>

            <!--/span-->

        </div>

        <div class="form-actions">

            <button type="submit" class="btn blue"><i class="icon-pencil"></i> Edit</button>

            <button type="button" class="btn">Back</button>

        </div>

    </div>

</div>

<%@include file="footer.jsp"%>
<script>
    jQuery(document).ready(function() {
        App.init();
    });
</script>

</body>
</html>
