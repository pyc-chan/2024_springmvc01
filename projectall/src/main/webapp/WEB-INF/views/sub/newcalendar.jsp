<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>날짜별 행사 찾기 / 달력 삽입</title>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        #calendar {
            max-width: 1330px;  /* iframe 안에서 190px x 7의 크기로 보이게 하기 */
            margin: 20px auto;  /* margin 조정 필요 */
        }
        .fc-event {
            background-color: #00A38B !important; /* 기본 배경색 */
            color: #FFFFFF !important;            /* 텍스트 색상 */
            border: none !important;              /* 기본 테두리 제거 */
        }
    </style>
</head>
<body>

<div id="calendar"></div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const calendarEl = document.getElementById('calendar');

        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'ko', // 한국어 설정
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            events: function (fetchInfo, successCallback, failureCallback) {
                fetch('calendar_mock.json') // JSON 파일 경로 (경로 변경 필요)
                    .then(response => response.json())
                    .then(data => {
                        const events = data.map(event => ({
                            id: event.ev_idx,
                            title: event.ev_na,
                            start: event.ev_s_dat,
                            end: event.ev_e_dat,
                            backgroundColor: '#00A38B', // FullCalendar 개별 이벤트 배경색
                            textColor: '#FFFFFF'        // FullCalendar 개별 이벤트 텍스트 색상
                        }));
                        successCallback(events);
                    })
                    .catch(error => {
                        console.error('로딩된 이벤트가 없습니다! 에러발생!', error);
                        failureCallback(error);
                    });
            }
        });

        calendar.render();
    });
</script>

</body>
</html>