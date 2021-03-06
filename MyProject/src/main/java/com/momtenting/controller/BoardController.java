package com.momtenting.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.momtenting.domain.BoardAttachVo;
import com.momtenting.domain.BoardVo;
import com.momtenting.domain.Criteria;
import com.momtenting.domain.PageDTO;
import com.momtenting.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/index/*")
@AllArgsConstructor
public class BoardController {
	@Autowired
	private BoardService service;
	
	//글조회
	@GetMapping(value="{bno}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<BoardVo> get(@PathVariable("bno") Long bno){
		log.info("get :: " + bno);
		return new ResponseEntity<>(service.get(bno), HttpStatus.OK);
	}
	
	@GetMapping("register")
	@PreAuthorize("isAuthenticated()")
	public void register(){
		
	}
	//글등록
	@PostMapping("register")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> register(@RequestBody BoardVo vo, RedirectAttributes rttr) {
		log.info("register...." + vo);
		vo.getAttachList().forEach(log::info);
		int insertCount = service.register(vo);
		log.info("insertCount ::" + insertCount);
		rttr.addFlashAttribute("result", vo.getBno());
		
		return insertCount == 1 ? new ResponseEntity<>(vo.getBno().toString(), HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	//수정
	@PreAuthorize("principal.vo.userName == #boardVo.writer")
	@RequestMapping(value="{bno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modfiy(@PathVariable("bno") Long bno, @RequestBody BoardVo boardVo) {
		log.info(boardVo);
		boardVo.setBno(bno);
		boardVo.getAttachList().forEach(log::info);
		int updateCount = service.modify(boardVo);
		log.info("Controller insertCount ::" + updateCount);
		return updateCount == 1 ? new ResponseEntity<>("sucess", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//삭제
	@DeleteMapping(value="{bno}/{writer}", produces = {MediaType.TEXT_PLAIN_VALUE})
	@PreAuthorize("principal.vo.userName == #writer")
	public ResponseEntity<String> remove(@PathVariable("bno") Long bno, @PathVariable String writer) {
		log.info("remove :: " + bno);
		List<BoardAttachVo> list = service.getAttachList(bno);
		int removCount = service.remove(bno);
		deleteFiles(list);
		log.info("insertCount ::" + removCount);
		return removCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//페이지(더보기) 목록 조회
	@GetMapping({"more/{writer}", "more/{bno}/{writer}"})
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<List<BoardVo>> getListMore(@PathVariable Optional<Long> bno, @PathVariable String writer){
		log.info("getListMore.....");
		return new ResponseEntity<>(service.getListMore(bno.isPresent() ? bno.get() : null, writer), HttpStatus.OK);
	}
	
	//페이지(더보기) 로그인된 사용자 목록 조회
	@GetMapping({"my/{writer}", "my/{bno}/{writer}"})
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<List<BoardVo>> getListMyBoard(@PathVariable Optional<Long> bno, @PathVariable String writer){
		log.info("getListMore.....");
		return new ResponseEntity<>(service.getListMyBoard(bno.isPresent() ? bno.get() : null, writer), HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("getAttachList")
	public List<BoardAttachVo> getAttachList(Long bno) {
		log.info("getAttachList..." + bno);
	
		return service.getAttachList(bno);
	}
	
	private void deleteFiles (List<BoardAttachVo> attachList) {
		log.info("deleteFiles........");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			new File(UploadController.UPLOAD_PATH, attach.getDownPath()).delete();
			if(attach.isImage()) {
				new File(UploadController.UPLOAD_PATH, attach.getThumbPath()).delete();
			}
		});
	}
		
}
