package com.momtenting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.momtenting.domain.BoardAttachVo;
import com.momtenting.domain.BoardVo;
import com.momtenting.domain.Criteria;
import com.momtenting.domain.PageDTO;
import com.momtenting.mapper.BoardAttachMapper;
import com.momtenting.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper boardAttachMapper;
	
	@Override
	@Transactional
	public int register(BoardVo boardVo) {
		log.info("register..." + boardVo);
		int registerCnt = mapper.insertSelectKey(boardVo);
		boardVo.getAttachList().forEach(a -> {
			a.setBno(boardVo.getBno());
			boardAttachMapper.insert(a);
		});
		return registerCnt;
	}

	@Override
	public BoardVo get(Long bno) {
		log.info("get....." + bno);
		BoardVo vo = mapper.read(bno);
		vo.setAttachList(boardAttachMapper.findBy(bno));
		log.info(boardAttachMapper.findBy(bno));
		return vo;
	}

	@Override
	@Transactional
	public int modify(BoardVo boardVo) {
		log.info("ServiceImpl modify..."+boardVo);
		boardAttachMapper.deleteAll(boardVo.getBno());
		boardVo.getAttachList().forEach(a -> {
			a.setBno(boardVo.getBno());
			boardAttachMapper.insert(a);
		});
		return mapper.update(boardVo);
	}

	@Override
	@Transactional
	public int remove(Long bno) {
		log.info("remover.."+bno);
		boardAttachMapper.deleteAll(bno);
		return mapper.delete(bno);
	}

	@Override
	public List<BoardVo> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getListWithPage(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVo> getListMore(Long bno, String writer) {
		List<BoardVo> list =  mapper.getListWithShowMore(bno, writer);
		list.forEach(vo -> {
			log.info(vo);
			log.info(bno);
			vo.setAttachList(boardAttachMapper.findBy(vo.getBno()));
		});
		return list;
	}
	
	@Override
	public List<BoardVo> getListMyBoard(Long bno, String writer) {
		List<BoardVo> list =  mapper.getListMyBoard(bno, writer);
		list.forEach(vo -> {
			log.info(vo);
			log.info(bno);
			vo.setWriter(writer);
			vo.setAttachList(boardAttachMapper.findBy(vo.getBno()));
		});
		return list;
	}
	
	

	@Override
	public PageDTO getListPage(Criteria cri) {
		return new PageDTO(cri, mapper.getTotalCount(cri), mapper.getListWithPage(cri));
	}
	
	@Override
	public List<BoardAttachVo> getAttachList(Long bno) {
		log.info("getAttachList...." + bno);
		return boardAttachMapper.findBy(bno);
	}

 
}
