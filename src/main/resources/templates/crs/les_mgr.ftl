<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>课时管理</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/per-center.css"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-bg" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">个人中心</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="charts.html"><i class="fa fa-bell"></i> 消息中心</a></li>
                <li><a href="index.html"><i class="fa fa-info-circle"></i> 个人信息</a></li>
                <li><a href="/user/tea/crs_mgr?do=add"><i class="fa fa-plus"></i> 添加课程</a></li>
                <li><a href="/user/tea/crs_mgr?do=mod"><i class="fa fa-edit"></i> 课程管理</a></li>
            </ul>

            <h3 style="text-align: center;color: #ffffff;"> 课时管理</h3>
        </div><!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <button class="btn btn-default btn-lg" id="post_les"><i class="fa fa-plus"></i> <span class="network-name">添加课时</span></button>
                <br><br><br>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>课时</th>
                            <th>名称</th>
                            <th>视频地址</th>
                            <th>修改视频</th>
                            <th>文件管理</th>
                            <th>习题管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list les as item>
                        <td>${item.pos!}</td>
                        <td>${item.name!}</td>
                        <td>${item.video!}</td>
                        <td>
                            <form method="POST" enctype="multipart/form-data" action="/user/tea/les_mgr/video?crs_id=${crs_id!}&chp_id=${chp_id!}&les_id=${item.id!}">
                                <input type="file" name="video" class="form-control"/>
                                <input type="submit" value="上传" class="form-control"/>
                            </form>
                        </td>
                        <td>
                            <a href='${item.fileUrl!}'><i class="fa fa-eye">查看</i></a>&#12288;&#12288;
                            <a href='javascript:void(0)'><i class="fa fa-pencil upd_project" name="${item.id!}">上传</i></a>
                        </td>
                        <td>
                        ${item.exeNum!}
                        </td>
                        </tr>
                        </#list>

                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.row -->
    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script>
<script type="text/javascript">
    $(document).on("click", "#post_les",
            function() {
                bootbox.dialog({
                    title: "新的课时",
                    message: '<div class="col-md-12"><form class="form-horizontal" id="post_les_form" enctype="multipart/form-data"><div class="form-group"> <label class="col-md-2 control-label">课时名</label><div class="col-md-9"> <input name="name" type="text" class="form-control input-md"><input type="hidden" name="pos" value="${pos!0}"/></div><div class="form-group"> <label class="col-md-2 control-label">文件</label> <div class="col-md-9"><input type="file" name="vf" class="form-control"/></div></div></div>',
                    buttons: {
                        success: {
                            label: "提交",
                            className: "btn-success",
                            callback: function() {
                                var a = document.getElementById("post_les_form");
                                a.name="lesson",
                                a.action = "/user/tea/les_mgr/add?crs_id=${crs_id!}&chp_id=${chp_id!}",
                                a.method = "post",
                                a.submit()
                            }
                        }
                    }
                })
            });
</script>
</body>
</html>