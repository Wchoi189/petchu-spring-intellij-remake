package com.example.domain;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class NaverAPI {

    public static String connection(String query,int page){
        String clientId = "DC8ojH4p4RE2lMhourmV"; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
        String clientSecret = "1KTqGCjPFg"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"


      String text=query;
      int sdf = page;
      int start = sdf*10;//���� ������ ��ư �ϳ� ���� ������ 10���� ����
        try {
        text= URLEncoder.encode(text, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("�˻��� ���ڵ� ����",e);
        }

        
        String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text
        		+"&start=" + start;    // json ���
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);


        System.out.println(responseBody);
        return responseBody;
    }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
                return readBody(con.getInputStream());
            } else { // ���� �߻�
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API ��û�� ���� ����", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = null;
		try {
			streamReader = new InputStreamReader(body,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
        }
    }
}