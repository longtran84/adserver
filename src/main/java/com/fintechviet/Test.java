package com.fintechviet;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;

import java.io.IOException;

/**
 * Created by tungn on 9/20/2017.
 */
public class Test {
    public static void main(String[] args) throws IOException, SolrServerException {
        SolrClient client = new HttpSolrClient.Builder("http://192.168.100.107:3689/solr/Crawler").build();
        SolrQuery query = new SolrQuery();
        query.setQuery("crawler");
        //query.addFilterQuery("cat:electronics","store:amazon.com");
        query.setFields("id", "MaChuyenMuc", "TenMien", "TieuDe", "NoiDung", "DuongDan", "AnhDaiDien", "NgayDangTin", "NgayCrawler");
        query.setStart(0);
        //query.set("defType", "edismax");

        QueryResponse response = client.query(query);
        SolrDocumentList results = response.getResults();
        for (int i = 0; i < results.size(); ++i) {
            System.out.println(results.get(i));
        }
    }
}
