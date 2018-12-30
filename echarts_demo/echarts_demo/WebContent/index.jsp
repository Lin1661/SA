<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据分析系统</title>
<!-- 使用单文件引入的方式使用ECharts.JS -->
<script src="echarts-all.js"></script>
<script src="jquery.js"></script>
</head>

<body onload="loadData()">
<div id="content" style="margin:40px auto;width:1300px;height:400px">
<div id="myBarDiv" style="height: 300px; width: 430px;display:inline-block" ></div>
<div id="myLineDiv" style="height: 300px; width: 430px;display:inline-block" ></div>
<div id="myPieDiv" style="height: 300px; width: 430px;display:inline-block" ></div>

<div id="myTest" style="width: 600px; height: 60px;margin:20px auto">
		<label for="sno">学生学号:</label> <input type="text" id="myName">
		<label for="age">年龄:</label> <input type="age" id="myNum">
		<button id="myButton" type="submit" onClick="sub()">获取数据</button>
</div> 
</div>






<script type="text/javascript">
	function sub(){ 
		var j = {"sno":$("#myName").val(),"age":$("#myNum").val()};
		$.ajax({
	        type: 'post',
	        url: 'jso.do',
	        dataType: 'json',
	        data: {"sno":$("#myName").val(),"age":$("#myNum").val()},  
	        contentType: "application/x-www-form-urlencoded" ,
	        success: function (message) {
	        	alert("success");
	        }
	       
	    });
		window.location.reload();
	}
	</script>
	
		<script type="text/javascript">
	
		function loadData(option) {
			$.ajax({
				type : 'post',	//传输类型
				async : false,	//同步执行
				url : 'student.do',	//web.xml中注册的Servlet的url-pattern
				data : {},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					if (result) {
						//初始化xAxis[0]的data
						option.xAxis[0].data = [];
						for (var i=0; i<result.length; i++) {
							option.xAxis[0].data.push(result[i].name);
						}
						//初始化series[0]的data
						option.series[0].data = [];
						for (var i=0; i<result.length; i++) {
							option.series[0].data.push(result[i].num);
						}
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()
		
		var myChart = echarts.init(document.getElementById('myBarDiv'));
		var option = {
			title: {
	            text: '柱状图'
	        },

			tooltip : {
				show : true
			},
			legend : {
				data : [ 'S1' ]
			},
			xAxis : [ {
				type : 'category'
				
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [ {
				name : 'S1',
				type : 'bar'
			} ]
		};
		//加载数据到option
		loadData(option);
		//设置option
		myChart.setOption(option);
	</script>
	
		<script type="text/javascript">
	
		function loadData(option) {
			$.ajax({
				type : 'post',	//传输类型
				async : false,	//同步执行
				url : 'student.do',	//web.xml中注册的Servlet的url-pattern
				data : {},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					if (result) {
						//初始化xAxis[0]的data
						option.xAxis[0].data = [];
						for (var i=0; i<result.length; i++) {
							option.xAxis[0].data.push(result[i].name);
						}
						//初始化series[0]的data
						option.series[0].data = [];
						for (var i=0; i<result.length; i++) {
							option.series[0].data.push(result[i].num);
						}
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()
		
		var myChart = echarts.init(document.getElementById('myLineDiv'));
		var option = {
			title: {
	            text: '折线图'
	        },

			tooltip : {
				show : true
			},
			legend : {
				data : [ 'S1' ]
			},
			xAxis : [ {
				type : 'category'
				
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [ {
				name : 'S1',
				type : 'line'
			} ]
		};
		//加载数据到option
		loadData(option);
		//设置option
		myChart.setOption(option);
	</script>
	
	
	<script type="text/javascript">
		function loadData() {
			
			$.ajax({
				type : 'post', //传输类型
				async : false, //同步执行
				url : 'student.do', //web.xml中注册的Servlet的url-pattern
				data : {},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					
					if (result) {
						var myChart = echarts.init(document
								.getElementById('myPieDiv'));
						var option = {
								title: {
						            text: '饼图'
						        },
							series : [ {
								name : '学号',
								type : 'S1',
								radius : '65%',
								data : [ {
									value : result[0].num,
									name : 'S1'
								}, {
									value : result[1].num,
									name : 'S2'
								}, {
									value : result[2].num,
									name : 'S5'
								}, {
									value : result[3].num,
									name : 'S4'
								} ]
							} ]
						};

						myChart.setOption(option);
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()
	</script>
</body>
</html>