package com.ict.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ict.guestbook2.service.GuestBook2Service;
import com.ict.guestbook2.vo.GuestBook2VO;

@Component
public class CommonScheduler {
	// cron설정법 (초 분 시 일 월 요일 연도)
	
    // 연도는 생략 가능하다.
    // 초 | 분 | 시 | 일 | 월 | 요일 | 연도
    // 0~59 0~59 0~23 1~31 1~12 0~6
    // ? : 설정 값 없을 때 - 일과 요일에서만 사용가능
    // * 은 항상을 의미한다.
	
	
    // 매일 자정에 실행 @Scheduled(cron = "0 0 0 * * *")로 자정마다 실행되는 작업을 구현.
    
    // 10 초마다 실행하고 싶으면 @Scheduled(cron = "*/10 * * * * *")
    
    // 10 분마다 실행되는 싶으면 @Scheduled(cron = "0 0/10 * * * *") =>  매 시간의 0분, 10분, 20분, 30분, 40분, 50분에 실행됩니다.
    
    // 매시간 10분 마다 하고 싶으면  @Scheduled(cron = "0 10 * * * *") => 01:10, 02:10, 03:10 등 매 시간 10분에 작업
    
	
    // 0: 초를 의미 (0초에 실행).
    // 0/10: 분을 의미. 0분부터 시작해 10분 간격으로 실행 (즉, 0, 10, 20, 30, 40, 50분에 실행).
    // *: 시, 일, 월, 요일 모두에 대해 매번 실행.
	
    // 시작시간/단위 : 시작시간부터 해당 단위 때
    // 예) 10분마다 스케쥴러가 돌게끔 한다면, 0 0/10 * * *

    // 시작범위-끝범위 : 시작범위부터 끝범위까지
    // 예) 조건에서만 실행되는 스케쥴러 : 10분 0초 ~ 15분 0초까지 실행, 0 10-15 * * *

    // L : 마지막-일, 요일에서만 사용가능
    // 예) 매월 마지막 금요일 오전 10:15, 0 15 10 ? * 6L
    // 응용 예제) 2014년부터 2017년까지 매월 마지막 금요일 오전 10:15에
    // 0 15 10 ? * 6L 2014-2017

    // W : 가장 가까운 평일을 찾는다 - 일에서만 사용가능
    // 10일이 평일 일 때 : 10일에 실행
    // 10일이 토요일 일 때 : 가장 가까운 평일인 금요일(9일)에 참
    // 10일이 일요일 일 때 : 가장 가까운 평일인 월요일(11일)에 참

    // # : 몇 주째인지 찾는다 - 요일에서만 사용가능
    // 예) 3#2 : 수요일 #2째주에 참
	
	
	@Autowired
	private GuestBook2Service guestBook2Service;
	
	
	// 10초마다 반복
	@Scheduled(cron = "*/10 * * * * *")
	public void schedulerTest() {
		System.out.println("스케줄러가 10초마다 실행됩니다.");
		List<GuestBook2VO> list = guestBook2Service.getGuestBook2List();
		System.out.println("리스트 크기 : "  + list.size());
		
	}
	
}
