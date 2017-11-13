package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Ad;
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
    private final static String AUTH_KEY_FCM = "AIzaSyDJfLSg6HEBQyVnt7_oRcTa3B5pt50ubv8";
    private final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
    private final static String APP_ID = "1:373715018719:android:f1f1b5b6d977e750";
    private final static String DOMAIN = "http://10.0.2.2:9000";

    public static String sendPushAds(Ad ad)
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
            //JSONObject info = new JSONObject();
            //info.put("title", "ads title"); // Notification title
            //info.put("body", "Advertising from Fintechviet"); // Notification

            JSONObject data = new JSONObject();

            data.put("message", "Advertising from Fintechviet");
            data.put("image", ad.getCreative().getImageLink());
            data.put("impressionUrl", DOMAIN + "/ad/impression/" + ad.getId());
            data.put("clickUrl", ad.getCreative().getClickUrl());
            data.put("trackingUrl", DOMAIN + "/ad/click?adId=" + ad.getId());

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
