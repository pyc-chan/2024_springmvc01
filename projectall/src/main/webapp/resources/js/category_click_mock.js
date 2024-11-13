
// ECharts 인스턴스 초기화
const chart = echarts.init(document.getElementById('chart'));

// 임의의 수치로 클릭 수 데이터 생성
function generateRandomData() {
    return {
        '나무': Math.floor(Math.random() * 100 + 50),  // 50~149 범위의 임의의 값
        '가로수길': Math.floor(Math.random() * 100 + 50),
        '보호수': Math.floor(Math.random() * 100 + 50)
    };
}

// 초기 데이터 설정 (임의의 수치)
const randomData = generateRandomData();
const chartData = [
    { name: '나무', value: randomData['나무'], itemStyle: { color: '#051F93' } },
    { name: '가로수길', value: randomData['가로수길'], itemStyle: { color: '#0932F2' } },
    { name: '보호수', value: randomData['보호수'], itemStyle: { color: '#4262F8' } }
];

// 전체 클릭수 계산
let totalClicks = chartData.reduce((sum, item) => sum + item.value, 0);

// 차트 옵션 설정
const option = {
    title: {
        // text: '카테고리별 일별 클릭률 분석',
        left: 'center',
        textStyle: {
            fontSize: 24  // 차트 제목 글자 크기 설정
        }
    },
    // 툴팁 양식 및 정보 설정
    tooltip: {
        trigger: 'item',
        formatter: function (params) {
            const clickCount = params.value; // 해당 카테고리 클릭수
            const clickRate = ((clickCount / totalClicks) * 100).toFixed(2); // 클릭률 계산
            return `[${params.name}] <br>클릭수: ${clickCount} <br>클릭률: ${clickRate}%`;
        }
    },
    // 범례 숨기기
    legend: {
        show: false 
    },
    series: [
        {
            name: '클릭률',
            type: 'pie',
            radius: '50%',
            data: chartData,
            label: {
                fontSize: 16, 
            },
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};

// 차트에 옵션 적용
chart.setOption(option);