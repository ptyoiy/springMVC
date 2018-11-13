/**
 *
 */
package kr.ac.sample.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sample.domain.Board;
import kr.ac.sample.service.BoardService;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
@Controller
public class MainController {
	@Autowired
	BoardService boardService;

	@RequestMapping(value = { "/", "/main" }, method = RequestMethod.GET)
	public String main(Board form, Model model) {
		List<Board> boardList = boardService.getAllBoard(form);
		model.addAttribute("board", boardList);
		return "main";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "write";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Board form, Model model) {
		Board board = boardService.boardOne(form.getBoardSeqno());
		model.addAttribute("board", board);
		return "update";
	}

	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	@ResponseBody
	public int boardWrite(Board form) {
		int count = boardService.boardSave(form);
		return count;
	}

	@RequestMapping(value = "/board_update", method = RequestMethod.POST)
	@ResponseBody
	public Board boardUpdate(Board form) {
		Board board = boardService.boardUpdate(form);
		return board;
	}

	@RequestMapping(value = "/board_delete", method = RequestMethod.POST)
	@ResponseBody
	public final int boardDelete(Board form) {
		int count = boardService.boardDelete(form.getBoardSeqno());
		return count;
	}
}
