<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scraping.jsp</title>
</head>
<body>
	<fieldset>
		<legend>자바로 웹 스크래핑 하기</legend>
		<h2>https://jsoup.org/</h2>
		<%
		
		Document doc = Jsoup.connect("https://en.wikipedia.org/").get();
		out.println("<h3>"+doc.title()+"</h3>");
		Elements newsHeadlines = doc.select("#mp-itn b a");
		out.println("<ul>");
		for (Element headline : newsHeadlines) {
		  out.println(String.format("<li><a href=\"%s\">%s</a></li>",headline.absUrl("href"),headline.attr("title")));
		}
		out.println("</ul>");
		%>
		<h2>네이버 영화.랭킹 스크랩하기(조회순)</h2>
		<%
		doc=Jsoup.connect("https://movie.naver.com/movie/sdb/rank/rmovie.nhn").get();
		System.out.println(doc.html());
		Elements elements=doc.select("#old_content > table > tbody > tr > td.title > div > a");
		out.println("스크래핑한 a태그의 수:"+elements.size());
		int rank =1;
		out.println("<ul>");
		for(Element element:elements){
			out.println(String.format("<li>%-3d<a href='%s'>%s</a></li>",rank++,element.absUrl("href"),element.html()));
		}
		out.println("</ul>");
		%>
	</fieldset>
</body>
</html>