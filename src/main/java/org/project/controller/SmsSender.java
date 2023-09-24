package org.project.controller;

import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.*;
import okhttp3.*;

public class SmsSender {


    private static String projectId = "";
    private static String accessKey = "";
    private static String secretKey = "";

	private static String url = "/sms/v2/services/" + projectId + "/messages";
	private static String requestUrl = "https://sens.apigw.ntruss.com" + url;

	private static String timestamp = Long.toString(System.currentTimeMillis());
	private static String method = "POST";

	public static String sendSms(String to, String subject, String content, String rTime) throws Exception {
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		toJson.put("subject", subject);
		toJson.put("content", content);
		toJson.put("to", to);
		System.out.println(to);
//		toJson.put("reserveTime","2023-09-25 13:55");
//		toJson.put("reserveTimeZone", "Asia/Seoul");
		System.out.println(rTime);
		toArr.put(toJson);
		bodyJson.put("type", "SMS");
		bodyJson.put("contentType", "COMM");
		bodyJson.put("countryCode", "82");
		bodyJson.put("from", "01071683115");
		bodyJson.put("subject", subject);
		bodyJson.put("content", content);
		bodyJson.put("messages", toArr);
		bodyJson.put("reserveTime",rTime); // �삁�빟 �씪�떆
		bodyJson.put("reserveTimeZone", "Asia/Seoul"); // �삁�빟 �씪�떆
		String body = bodyJson.toString();
		System.out.println(body);
		return doPost(requestUrl, body);
	}

	public static String doPost(String requestURL, String jsonMessage) throws Exception {
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder().addHeader("x-ncp-apigw-timestamp", timestamp)
				.addHeader("x-ncp-iam-access-key", accessKey).addHeader("x-ncp-apigw-signature-v2", makeSignature())
				.url(requestURL).post(RequestBody.create(MediaType.parse("application/json"), jsonMessage)).build();
		System.out.println(request);
		Response response = client.newCall(request).execute();
		return response.body().string();
	}

	public static String makeSignature() throws Exception {
		String space = " ";
		String newLine = "\n";

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp)
				.append(newLine).append(accessKey).toString();

		String encodeBase64String = null;
		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);
		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		return encodeBase64String;
	}
}