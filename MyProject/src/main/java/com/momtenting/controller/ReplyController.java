package com.momtenting.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.momtenting.domain.Criteria;
import com.momtenting.domain.ReplyPageDTO;
import com.momtenting.domain.ReplyVo;
import com.momtenting.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
	@Autowired
	private ReplyService service;
	
	//등록
	@PostMapping("new")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> create(@RequestBody ReplyVo vo) {
		log.info(vo);
		int insertCount = service.register(vo);
		log.info("insertCount ::" + insertCount);
		return insertCount == 1 ? new ResponseEntity<>(vo.getRno().toString(), HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//조회
	@GetMapping(value="{rno}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVo> get(@PathVariable("rno") Long rno){
		log.info("get :: " + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	//수정
	@PreAuthorize("principal.vo.userName == #vo.replyer")
	@RequestMapping(value="{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modfiy(@PathVariable("rno") Long rno, @RequestBody ReplyVo vo) {
		log.info(vo);
		vo.setRno(rno);
		int updateCount = service.modify(vo);
		log.info("insertCount ::" + updateCount);
		return updateCount == 1 ? new ResponseEntity<>("sucess", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//삭제
	@DeleteMapping(value="{rno}/{replyer}", produces = {MediaType.TEXT_PLAIN_VALUE})
	@PreAuthorize("principal.vo.userName == #replyer")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno, @PathVariable String replyer ) {
		log.info("remove :: " + rno);
		int removCount = service.remove(rno);
		log.info("insertCount ::" + removCount);
		return removCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//페이지(목록)
	@GetMapping("pages/{page}/{bno}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable int page, @PathVariable long bno){
		log.info("getList");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	//페이지(더보기)
	@GetMapping({"more/{bno}", "more/{bno}/{rno}"})
	public ResponseEntity<List<ReplyVo>> getListMore(@PathVariable Long bno, @PathVariable Optional<Long> rno){
		log.info("getListMore");
		return new ResponseEntity<>(service.getListMore(rno.isPresent() ? rno.get() : null, bno), HttpStatus.OK);
	}
	
	
}
