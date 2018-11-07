<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../layouts/header.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active">用户</li>
		</ol>
	</div><!--/.row-->
			
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">用户列表</div>
				<p class="help-block" style="margin-left: 15px;"></p>
				<div class="panel-body">
				    <a style="float:left;" class="btn btn-primary" href="${requestScope.baseUrl}/view/adduser">+</a>
					<table id="table">
					    <thead>
					    <tr>
					        <th data-field="state" data-checkbox="true" >ID</th>
					        <th data-field="userId" data-sortable="true">用户ID</th>
					        <th data-field="username" data-sortable="true">用户名</th>
					        <th data-field="nickname"  data-sortable="true">昵称</th>
					        <th data-field="type"  data-sortable="true" data-formatter="formatType">类型</th>
					        <th data-field="groupId"  data-sortable="true" data-formatter="formatGroup">组</th>
					        <th data-field="createTime"  data-sortable="true">创建时间</th>
					        <th data-field="updateTime"  data-sortable="true">更新时间</th>
					        <th data-field="action" data-sortable="true"  data-formatter="formatAction">操作</th>
					    </tr>
					    </thead>
					</table>
				</div>
			</div>
		</div>
	</div><!--/.row-->
</div>	
<script type="text/javascript">
$(function () {
    $('#table').bootstrapTable({
		url:"${requestScope.baseUrl}/api/users",
		pageSize:20,
		sidePagination:'server',
		showRefresh:"true",
		showToggle:"true",
		showColumns:"true",
		//search:"true",
		itemName:"toolbar1",
		pagination:"true",
		sortName:"name",
		sortOrder:"desc",
    });
});


function formatAction(value, row, index) {
    return [
            '<a href="${requestScope.baseUrl}/view/updateuser/' + row.userId +'">' +
                '<i class="glyphicon glyphicon-pencil"></i>' +
            '</a>',
            '&nbsp;&nbsp;&nbsp;&nbsp;',
            '<a href="javascript:deleteUser(' + row.userId + ')">' +
                '<i class="glyphicon glyphicon-remove"></i>' +
            '</a>'
        ].join('');
}

function formatType(value, row, index) {
	var mappings = ${requestScope.typeMapping};
	for( var i in mappings){
		if(value == i){
			return mappings[i];
		}
	}
	return "unknow";
}

function formatGroup(value, row, index) {
	var mappings = ${requestScope.groupMapping};
	for( var i in mappings){
		if(value == i){
			return mappings[i];
		}
	}
	return "unknow";
}
</script>
<%@include file="../layouts/footer.jsp" %>