google.charts.load('current', {
	'packages' : [ 'corechart' ]
});

google.charts.setOnLoadCallback(drawChart_donutAll);
google.charts.setOnLoadCallback(drawChart_comboAll);

function drawChart_donutAll() {

	var data = new google.visualization.DataTable();
	data.addColumn('string', '업무상태');
	data.addColumn('number', '업무개수');
	data.addRows([ [ '완료됨', 3 ], [ '마감일 지남', 1 ], [ '계획됨', 1 ],
			[ '마감일 없음', 1 ],

	]);

	var options = {
		title : '전체 업무',
		pieHole : 0.9,
		pieSliceTextStyle : {
			color : 'black'
		},
	};

	var chart = new google.visualization.PieChart(document
			.getElementById('donutchart'));
	chart.draw(data, options);

}

function drawChart_comboAll() {
	// Some raw data (not necessarily accurate)
	var data = google.visualization.arrayToDataTable([
			[ 'Month', '완료됨', '마감일 지남', '계획됨', '마감일 없음' ],
			[ '오늘', 2, 3, 1, 0 ], [ '내일', 3, 2, 3, 1 ], [ '이번주', 4, 2, 3, 0 ],
			[ '이번달', 0, 2, 1, 4 ], [ '다음달', 3, 5, 2, 1 ] ]);

	var options = {
		title : ' ',
		vAxis : {
			title : '업무개수'
		},
		hAxis : {
			title : '마감일자'
		},
		seriesType : 'bars',
		series : {
			5 : {
				type : 'line'
			}
		}

	};

	var chart = new google.visualization.ComboChart(document
			.getElementById('combochart'));
	chart.draw(data, options);
}
