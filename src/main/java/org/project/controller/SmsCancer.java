package org.project.controller;

import java.time.Instant;
import java.util.Base64;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import okhttp3.*;

public class SmsCancer {
	private static String projectId = "ncp:sms:kr:316609991035:sms";
	private static String accessKey = "U62vMFlW1dBJ6yd0kBn1";
	private static String secretKey = "lBa6D9aHsFxGKI0Ttm1UJyCGD84eEfZYWz94WFzH";
	private static String timestamp = getUtcTimestamp();
	private static String method = "DELETE";
	public String cancelSms(String reserveId) throws Exception {
		String requestUrl = "https://sens.apigw.ntruss.com/sms/v2/services/" + projectId + "/reservations/" + reserveId;


		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder().addHeader("x-ncp-apigw-timestamp", timestamp)
				.addHeader("x-ncp-iam-access-key", accessKey)
				.addHeader("x-ncp-apigw-signature-v2", makeSignature(requestUrl)).url(requestUrl).delete()
				.build();

		Response response = client.newCall(request).execute();
		return response.body().string();
	}

	private String makeSignature(String url) throws Exception {
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

	private static String getUtcTimestamp() {
		Instant instant = Instant.now(); // 현재 시간을 UTC로 가져옴
		return String.valueOf(instant.toEpochMilli()); // 밀리초 단위로 변환하여 문자열로 반환
	}
}
