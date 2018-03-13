package com.attend.service.article;

import com.attend.BaseTest;
import com.attend.entity.Article;
import com.attend.service.ArticleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by bowen on 2018-02-27 23:08
 */
public class ArticleServiceTest extends BaseTest {

    @Autowired
    private ArticleService articleService;

    @Test
    public void findByIdTest(){
        Article a = articleService.findById(1);
        System.out.println(a);
    }
}
