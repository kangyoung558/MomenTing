package com.momtenting.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momtenting.domain.BoardVo;
import com.momtenting.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList(){
		mapper.getList().forEach(log::info);
	}
	
	
	@Test
	public void testGetListWithPage(){
		mapper.getListWithPage(new Criteria(11, 20)).forEach(log::info);
	}

	@Test
	public void testGetTotalCount(){
		Criteria criteria = new Criteria();
		criteria.setType("TCW");
		criteria.setKeyword("kang");
		log.info(mapper.getTotalCount(criteria));
	}
	
	@Test
	public void testGetListWithShowMore() {
		mapper.getListWithShowMore(414042L, "강영훈").forEach(log::info);
	}
	@Test
	public void testGetListMyBoard() {
		mapper.getListMyBoard(414042L, "강영훈").forEach(log::info);
	}
	
	@Test
	public void testInsert() {
		BoardVo boardVo = new BoardVo();
		boardVo.setTitle("새로 작성하는 제목");
		boardVo.setContent("새로 작성하는 내용");
		boardVo.setWriter("kang");
		
		mapper.insert(boardVo);
		
		log.info(boardVo);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVo boardVo = new BoardVo();
		boardVo.setTitle("새로 작성하는 제목");
		boardVo.setContent("새로 작성하는 내용");
		boardVo.setWriter("kang");
		
		mapper.insertSelectKey(boardVo);
		
		log.info(boardVo);
	}
	
	@Test
	public void testRead() {
//		BoardVo boardVo = mapper.read(413740L);
		log.info(mapper.read(413740L));
	}
	
	@Test
	public void testDelete() {
		log.info("delete count : " + mapper.delete(413736L));
	}
	
	@Test
	public void testUpdate() {
		BoardVo boardVo = new BoardVo();
		boardVo.setBno(413740L);
		boardVo.setTitle("수정 작성하는 제목1111");
		boardVo.setContent("수정 작성하는 내용111");
		boardVo.setWriter("kang");
	
		log.info(mapper.update(boardVo));
	} 
	
	@Test
	public void testSearch() {
		Criteria criteria = new Criteria();
		criteria.setType("TCW");
		criteria.setKeyword("JAVA");
		
		mapper.getListWithPage(criteria);
	}
}
