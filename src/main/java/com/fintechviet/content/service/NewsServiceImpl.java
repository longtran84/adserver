package com.fintechviet.content.service;

import com.fintechviet.content.model.News;
import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.repository.NewsCategoryRepository;
import com.fintechviet.content.repository.NewsRepository;
import com.fintechviet.utils.DateUtils;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class NewsServiceImpl implements NewsService {
    private static String CRAWLER_ENPOINT = "http://192.168.100.107:3689/solr/Crawler";
    private static String ID = "id";
    private static String CATEGORY_CODE = "MaChuyenMuc";
    private static String SOURCE_NAME = "TenMien";
    private static String TITLE = "TieuDe";
    private static String CONTENT = "NoiDung";
    private static String LINK = "DuongDan";
    private static String IMAGE_LINK = "AnhDaiDien";
    private static String PUBLISH_DATE = "NgayDangTin";
    private static String CRAWLER_DATE = "NgayCrawler";

    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private NewsCategoryRepository newsCategoryRepository;

    @Override
    public void save(List<News> news) {
        for (News ne : news) {
            NewsCategory newsCategory = newsCategoryRepository.findOne(ne.getNewsCategoryId());
            ne.setNewsCategory(newsCategory);
        }
        newsRepository.save(news);
    }

    @Override
    public List<News> getNewsByDate(Date from, Date to) {
        return newsRepository.getNewsByDate(from, to);
    }

    @Override
    public void getNewsFromCrawler() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.MINUTE, -5);
        String startTime = DateUtils.convertDateToStringUTC(cal.getTime());
        String endTime = DateUtils.convertDateToStringUTC(new Date());
        try {
            SolrClient client = new HttpSolrClient.Builder(CRAWLER_ENPOINT).build();
            SolrQuery query = new SolrQuery();
            query.setQuery("*:*");
            query.addFilterQuery(CRAWLER_DATE + ":["+ startTime + " TO " + endTime + "]");
            query.setFields(ID, CATEGORY_CODE, SOURCE_NAME, TITLE, CONTENT, LINK, IMAGE_LINK, PUBLISH_DATE, CRAWLER_DATE);
            query.setStart(0);
            query.setRows(2000);
            query.set("defType", "edismax");

            QueryResponse response = client.query(query);
            SolrDocumentList results = response.getResults();

            List<News> newsList = new ArrayList<>();
            for (SolrDocument document : results) {
                News news = new News();
                boolean hasCategory = false;
                boolean isExist = false;
                for (Iterator<Map.Entry<String, Object>> i = document.iterator(); i.hasNext();) {
                    Map.Entry<String, Object> element = i.next();
                    String key = element.getKey().toString();
                    String value = element.getValue().toString();
                    if (ID.equals(key)) {
                        news.setOriginalId(Long.valueOf(value));
                        News ne = newsRepository.findByOriginalId(Long.valueOf(value));
                        if(ne != null) {
                            isExist = true;
                        }
                    } else if(CATEGORY_CODE.equals(key)) {
                        NewsCategory newsCategory = newsCategoryRepository.findByCode(value);
                        if (newsCategory != null) {
                            hasCategory = true;
                            news.setNewsCategory(newsCategory);
                        }
                    } else if(SOURCE_NAME.equals(key)) {
                        news.setSource(value);
                    } else if(TITLE.equals(key)) {
                        news.setTitle(value);
                    } else if(CONTENT.equals(key)) {
                        news.setShortDescription(value);
                    } else if(LINK.equals(key)) {
                        news.setLink(value);
                    } else if(IMAGE_LINK.equals(key)) {
                        news.setImageLink(value);
                    } else if(PUBLISH_DATE.equals(key)) {
                        news.setPublishDate((Date)element.getValue());
                    } else {
                        news.setCrawlerDate((Date)element.getValue());
                    }
                }
                if (hasCategory && !isExist) {
                    newsList.add(news);
                }
            }
            newsRepository.save(newsList);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
}

