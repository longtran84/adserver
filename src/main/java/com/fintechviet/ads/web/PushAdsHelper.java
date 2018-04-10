package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Ad;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

/**
 * Created by tungn on 8/5/2017.
 */
public class PushAdsHelper {
    private final static String AUTH_KEY_FCM = "AIzaSyDJfLSg6HEBQyVnt7_oRcTa3B5pt50ubv8";
    private final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";
    private final static String APP_ID = "1:373715018719:android:f1f1b5b6d977e750";
    private final static String DOMAIN = "http://222.252.16.132:9000";

    private static final Logger LOG = LoggerFactory.getLogger(PushAdsHelper.class);

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

            UUID uuid = UUID.randomUUID();

            data.put("id", uuid);
            data.put("type", "AD_NOTIFICATION");
            data.put("message", ad.getDescription());
            data.put("image", ad.getCreative().getImageLink());
            data.put("impressionUrl", DOMAIN + "/ad/impression/" + ad.getId());
            data.put("clickUrl", ad.getCreative().getClickUrl());
            data.put("trackingUrl", DOMAIN + "/ad/click?adId=" + ad.getId());

            // body
            //json.put("notification", info);
            json.put("data", data);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
            bw.write(json.toString());
            bw.flush();

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
        LOG.info("FCM Notification is sent successfully");

        return result;

    }
}
