<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="calendar"></div> 
	<script> 
		$('#calendar').fullCalendar({ 
		googleCalendarApiKey : 'AIzaSyDyymV-EJmqhBW9QX8N23waVAHHKjk9VcE',
		header: { 
			left: '', center: 'prev, title, next', 
			// right: 'month, basicWeek, agendaDay' 
			right: '' },
		monthYearFormat: 'MMMM YYYY', ventLimit: true, fixedWeekCount: false, defaultView: 'month',
		dayNamesShort: ["S","M","T","W","T","F","S"], buttonText: { today : "오늘", month : "월별", week : "주별", day : "일별", },
		eventSources : // 한국 기념일 ko.south_korea 추가 
		[ { googleCalendarId : 'polkmn222@naver.com' } ,
			{ googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com' , className : 'ko_event' } ] });
	</script>




</body>
</html>