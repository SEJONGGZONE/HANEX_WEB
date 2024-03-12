package com.hanbiz.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("commonDao")
public class CommonDao {
    @Resource(name="sqlSessionTemplate") private SqlSessionTemplate sqlSession;
    
    Logger logger = LoggerFactory.getLogger(this.getClass());
    
    private void printQueryId(String queryId) {
        if(logger.isDebugEnabled()){
        	logger.debug("\t QueryId  \t:  " + queryId);
        }
    }
     
    public Object insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
     
    public Object update(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.update(queryId, params);
    }
     
    public Object delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }
     
    public Object selectOne(String queryId){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId);
    }
     
    public Object selectOne(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, params);
    }
     
    public List<Map<String, Object>> selectList(String queryId){
        printQueryId(queryId);
        return sqlSession.selectList(queryId);
    }
     
    public List<Map<String, Object>> selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }    
}
