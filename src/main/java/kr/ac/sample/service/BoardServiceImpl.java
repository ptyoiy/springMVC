/**
 *
 */
package kr.ac.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sample.domain.Board;
import kr.ac.sample.repository.BoardRepository;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository boardRepository;

	/**
	 * 게시판 목록
	 *
	 * @author sykim
	 * @created 2018. 11. 8.
	 */
	@Override
	public List<Board> getAllBoard(Board form) {
		List<Board> boardList = (List<Board>) boardRepository.findAll();
		return boardList;
	}


	/**
	 * 게시판 본문.
	 *
	 * @author sykim
	 * @created 2018. 11. 13.
	 */
	@Override
	public Board boardOne(long boardSeqno) {
		Board board = boardRepository.findOne(boardSeqno);
		return board;
	}

	/**
	 * 게시판 추가
	 *
	 * @author sykim
	 * @created 2018. 11. 13.
	 */
	@Override
	public int boardSave(Board form) {
		boardRepository.save(form);
		return 1;
	}

	/**
	 * 게시판 변경
	 *
	 * @author sykim
	 * @created 2018. 11. 13.
	 */
	@Override
	public Board boardUpdate(Board form) {
		Board boardToUpdate = boardRepository.findOne(form.getBoardSeqno());
		if (boardToUpdate != null) {
			boardToUpdate.setBoardSubject(form.getBoardSubject());
			boardRepository.save(boardToUpdate);

			return boardToUpdate;
		}
		return null;
	}

	/**
	 * 게시판 삭제
	 *
	 * @author sykim
	 * @created 2018. 11. 13.
	 */
	@Override
	public int boardDelete(long boardSeqno) {
		boardRepository.delete(boardSeqno);
		return 1;
	}

}
