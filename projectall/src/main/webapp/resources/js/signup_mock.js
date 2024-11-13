// 월별 회원가입자 수 데이터를 미리 지정
const monthlySignupData = [
  { month: "July", signups: 10 },
  { month: "August", signups: 15 },
  { month: "September", signups: 20 },
  { month: "October", signups: 25 },
  { month: "November", signups: 28 },
  { month: "December", signups: 35 },
  { month: "January", signups: 40 },
  { month: "February", signups: 45 },
  { month: "March", signups: 50 },
  { month: "April", signups: 55 },
  { month: "May", signups: 60 },
  { month: "June", signups: 65 }
];

// 영어 달 약어를 대문자로 반환하는 함수
function getMonthAbbreviation(month) {
  const monthAbbrs = {
    "January": "JAN", "February": "FEB", "March": "MAR", "April": "APR", 
    "May": "MAY", "June": "JUN", "July": "JUL", "August": "AUG", 
    "September": "SEP", "October": "OCT", "November": "NOV", "December": "DEC"
  };
  return monthAbbrs[month] || month;
}

// 영어 달 약어를 월 이름으로 바꾸는 함수
function getMonthNameFromAbbr(abbr) {
  const monthAbbrsToFull = {
    "JAN": "January", "FEB": "February", "MAR": "March", "APR": "April", 
    "MAY": "May", "JUN": "June", "JUL": "July", "AUG": "August", 
    "SEP": "September", "OCT": "October", "NOV": "November", "DEC": "December"
  };
  return monthAbbrsToFull[abbr] || abbr;
}

// 현재 달을 기준으로 5개월의 데이터를 추출하는 함수
function getLast5MonthsData() {
  const now = new Date();
  const currentMonth = now.getMonth(); 
  const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  const relevantData = [];
  for (let i = 0; i < 5; i++) {
    const index = (currentMonth - i + 12) % 12;
    relevantData.unshift(monthlySignupData[index]);
  }
  return relevantData;
}

// 5개월의 데이터를 동적으로 가져와서 차트 설정
const last5MonthsData = getLast5MonthsData();
const signupMonthsAbbr = last5MonthsData.map(item => getMonthAbbreviation(item.month));
const signupCounts = last5MonthsData.map(item => item.signups);

const signupChart = echarts.init(document.getElementById('signupChart'));
signupChart.setOption({
  title: { 
    // text: '회원가입자 수 월별 분석', 
    left: 'center',
    textStyle: {
      fontSize: 24 
    }
  },
  tooltip: { 
    trigger: 'axis',
    formatter: function (params) {
      const monthAbbr = params[0].name;  
      const count = params[0].data;
      const fullMonthName = getMonthNameFromAbbr(monthAbbr);
      return `${fullMonthName} 회원가입자수: ${count} 명`;
    }
  },
  xAxis: { 
    type: 'category', 
    data: signupMonthsAbbr,
    axisLabel: {
      formatter: function (value) {
        return value;
      }
    }
  },
  yAxis: { 
    type: 'value'
  },
  series: [{
    data: signupCounts,
    type: 'line',
    itemStyle: { color: '#1D44F7' },
    lineStyle: {
      width: 4
    }
  }]
});
