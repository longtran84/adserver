package com.fintechviet.ads.web;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by tungn on 8/5/2017.
 */
public class PushAdsHelper {
    public final static String AUTH_KEY_FCM = "AIzaSyDJfLSg6HEBQyVnt7_oRcTa3B5pt50ubv8";
    public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

    public static String sendPushAds(String deviceToken)
            throws IOException {
        String result = "";
        URL url = new URL(API_URL_FCM);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setUseCaches(false);
        conn.setDoInput(true);
        conn.setDoOutput(true);

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "key=" + AUTH_KEY_FCM);
        conn.setRequestProperty("Content-Type", "application/json");

        JSONObject json = new JSONObject();


        try {
        	
            json.put("to", "/topics/ads");
            JSONObject info = new JSONObject();
            //info.put("title", "ads title"); // Notification title
            //info.put("body", "Advertising from Fintechviet"); // Notification

            JSONObject data = new JSONObject();

            data.put("message", "Advertising from Fintechviet");
            data.put("image", "http://media.docbao.vn/files/images/site-1/20170923/web/a-hau-hoang-anh-da-sinh-con-gai-dau-long-cach-day-2-ngay-20-100121.jpg");
            data.put("clickUrl", "http://docbao.vn/tin-tuc/23-09-2017/dong-dat-manh-34-do-richter-o-trieu-tien-sau-loi-de-doa-thu-bom-h/35/484401");
            // body
            //json.put("notification", info);
            json.put("data", data);
            
            OutputStreamWriter wr = new OutputStreamWriter(
                    conn.getOutputStream());
            wr.write(json.toString());
            wr.flush();

            BufferedReader br = new BufferedReader(new InputStreamReader(
                    (conn.getInputStream())));

            String output;
            System.out.println("Output from Server .... \n");
            while ((output = br.readLine()) != null) {
                System.out.println(output);
            }
            result = "SUCCESS";
        } catch (Exception e) {
            e.printStackTrace();
            result = "FAILURE";
        }
        System.out.println("GCM Notification is sent successfully");

        return result;

    }
}
