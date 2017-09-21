package com.fintechviet;

import com.fintechviet.content.model.News;
import com.fintechviet.utils.DateUtils;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import java.io.IOException;
import java.util.*;

/**
 * Created by tungn on 9/20/2017.
 */
public class Test {
    private static String ID = "id";
    private static String CATEGORY_CODE = "MaChuyenMuc";
    private static String SOURCE_NAME = "TenMien";
    private static String TITLE = "TieuDe";
    private static String CONTENT = "NoiDung";
    private static String LINK = "DuongDan";
    private static String IMAGE_LINK = "AnhDaiDien";
    private static String PUBLISH_DATE = "NgayDangTin";
    private static String CRAWLER_DATE = "NgayCrawler";

    public static void main(String[] args) throws IOException, SolrServerException {
        /*SolrClient client = new HttpSolrClient.Builder("http://192.168.100.107:3689/solr/Crawler").build();
        SolrQuery query = new SolrQuery();
        query.setQuery("*:*");
        query.addFilterQuery(CRAWLER_DATE + ":[2017-09-20T00:00:00Z TO 2017-09-20T23:59:59Z]");
        query.setFields(ID, CATEGORY_CODE, SOURCE_NAME, TITLE, CONTENT, LINK, IMAGE_LINK, PUBLISH_DATE, CRAWLER_DATE);
        query.setStart(0);
        query.set("defType", "edismax");

        QueryResponse response = client.query(query);
        SolrDocumentList results = response.getResults();

        List<News> newsList = new ArrayList<>();
        for (SolrDocument document : results) {
            News news = new News();
            for (Iterator<Map.Entry<String, Object>> i = document.iterator(); i.hasNext();) {
                Map.Entry<String, Object> element = i.next();
                if (ID.equals(element.getKey().toString())) {
                    news.setOriginalId(Long.valueOf(element.getValue().toString()));
                } else if(CATEGORY_CODE.equals(element.getKey().toString())) {

                } else if(SOURCE_NAME.equals(element.getKey().toString())) {
                    news.setSource(element.getValue().toString());
                } else if(TITLE.equals(element.getKey().toString())) {
                    news.setTitle(element.getValue().toString());
                } else if(CONTENT.equals(element.getKey().toString())) {
                    news.setShortDescription(element.getValue().toString());
                } else if(LINK.equals(element.getKey().toString())) {
                    news.setLink(element.getValue().toString());
                } else if(IMAGE_LINK.equals(element.getKey().toString())) {
                    news.setImageLink(element.getValue().toString());
                } else if(PUBLISH_DATE.equals(element.getKey().toString())) {
                    news.setPublishDate((Date)element.getValue());
                } else {
                    news.setCrawlerDate((Date)element.getValue());
                }
            }
            newsList.add(news);
        }
        System.out.println(DateUtils.convertDateToStringUTC(new Date()));*/
        String abc = "http://localhost:8080";
        System.out.println(abc.replaceAll("localhost:8080", "222.252.16.132:8888"));
    }

    private void convertToNews(SolrDocumentList results) {
        List<News> newsList = new ArrayList<>();
        for (SolrDocument document : results) {
            for (Iterator<Map.Entry<String, Object>> i = document.iterator(); i.hasNext();) {
                Map.Entry<String, Object> element = i.next();
                News news = new News();
                if (ID.equals(element.getKey().toString())) {
                    news.setOriginalId(Long.valueOf(element.getValue().toString()));
                } else if(CATEGORY_CODE.equals(element.getKey().toString())) {

                } else if(SOURCE_NAME.equals(element.getKey().toString())) {
                    news.setSource(element.getValue().toString());
                } else if(TITLE.equals(element.getKey().toString())) {
                    news.setTitle(element.getValue().toString());
                } else if(CONTENT.equals(element.getKey().toString())) {
                    news.setShortDescription(element.getValue().toString());
                } else if(LINK.equals(element.getKey().toString())) {
                    news.setLink(element.getValue().toString());
                } else if(IMAGE_LINK.equals(element.getKey().toString())) {
                    news.setImageLink(element.getValue().toString());
                } else if(PUBLISH_DATE.equals(element.getKey().toString())) {
                } else {
                }
                newsList.add(news);
            }
        }
    }
}
