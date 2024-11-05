package com.ict.edu04.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

// Controller 는 servlet-context.xml로 리턴한다. 
// RestController 는 servlet-context.xml로 리턴하지 않고 브라우저에 출력

@RestController
public class AjaxTestController {

	@RequestMapping(value = "/test01", produces = "text/html; charset=utf-8") // jsp servlet 에서 나옴
	// 브라우저로 넘어가기 때문에 똑같이 작성
	@ResponseBody
	// 반환형이 String 인 경우 문서 타입이 contentType="text/html" 로 변경된다.
	public String Text_Exam01() {
		String msg = "<h2>Hello World Spring Ajax !! <br> 환영합니다.</h2>";
		return msg;
	}

	// xml dtd 정의 안했다고 경고

	@RequestMapping(value = "/test02", produces = "text/xml; charset=utf-8")
	@ResponseBody
	public String Xml_Exam01() {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<products>");
		sb.append("<product count=\"5\" name=\"제너시스\">현대자동차</product>");
		sb.append("<product count=\"7\" name=\"카렌스\">기아자동차</product>");
		sb.append("<product count=\"9\" name=\"카니발\">기아자동차</product>");
		sb.append("<product count=\"5\" name=\"카스타\">기아자동차</product>");
		sb.append("<product count=\"2\" name=\"트위치\">르노자동차</product> ");
		sb.append("</products>");
		return sb.toString();
	}

	@RequestMapping(value = "/test03", produces = "text/xml; charset=utf-8")
	@ResponseBody
	public String Xml_Exam02() {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		try {
			// 웹 상의 존재하는 xml을 가져오기
			URL url = new URL("https://www.kma.go.kr/XML/weather/sfc_web_map.xml");
			URLConnection conn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String msg = null;
			while ((msg = br.readLine()) != null) {
				sb.append(msg);
			}

			return sb.toString();
		} catch (Exception e) {

			System.out.println(e);
			return null;
		}
	}

	@RequestMapping(value = "/test04", produces = "text/xml; charset=utf-8")
	@ResponseBody
	public String Xml_Exam03() {
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=1KDhqKwdFWHwFSzLe3nBs3XtsBgB0OzQTTtNtaK75qWe%2BfwkGCpvgGEd%2BAlG7Mxj33ICWsv2xWe85DBNEIpf3Q%3D%3D"); /*
																															 * Service
																															 * Key
																															 */
			urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "="
					+ URLEncoder.encode("xml", "UTF-8")); /* xml 또는 json */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("sidoName", "UTF-8") + "=" + URLEncoder.encode("서울",
					"UTF-8")); /*
								 * 시도 이름(전국, 서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)
								 */
			urlBuilder.append("&" + URLEncoder.encode("ver", "UTF-8") + "="
					+ URLEncoder.encode("1.0", "UTF-8")); /* 버전별 상세 결과 참고 */
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			System.out.println("Response code: " + conn.getResponseCode()); // 200 OK
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			return sb.toString();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	@RequestMapping(value = "/test05", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Json_Exam05() {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		sb.append(" {\"name\" : \"HTML\", \"scope\" : \"15\"},");
		sb.append(" {\"name\" : \"CSS\", \"scope\" : \"13\"},");
		sb.append(" {\"name\" : \"JavaScript\", \"scope\" : \"17\"},");
		sb.append(" {\"name\" : \"JSP\", \"scope\" : \"12\"}");
		sb.append("]");
		return sb.toString();
	}

	@RequestMapping(value = "/test06", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Json_Exam06() {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		try {
			// 웹 상의 존재하는 xml을 가져오기
			URL url = new URL("http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
			URLConnection conn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String msg = null;
			while ((msg = br.readLine()) != null) {
				sb.append(msg);
			}

			return sb.toString();
		} catch (Exception e) {

			System.out.println(e);
			return null;
		}
	}

	@RequestMapping(value = "/test07", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String Json_Exam07() {
		HttpURLConnection conn = null;
		BufferedReader rd = null;
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=1KDhqKwdFWHwFSzLe3nBs3XtsBgB0OzQTTtNtaK75qWe%2BfwkGCpvgGEd%2BAlG7Mxj33ICWsv2xWe85DBNEIpf3Q%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B10101", "UTF-8")); /*11B10101 서울, 11B20201 인천 등 ( 별첨엑셀자료 참고)*/
			urlBuilder.append("&" + URLEncoder.encode("tmFc", "UTF-8") + "=" + URLEncoder.encode("202410160600",
					"UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력 YYYYMMDD0600 (1800)-최근 24시간 자료만 제공*/
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		} finally {
			try {
				rd.close();
				conn.disconnect();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
	}

}
