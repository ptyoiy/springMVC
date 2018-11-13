/**
 *
 */
package kr.ac.sample.service;

import java.util.List;

import kr.ac.sample.domain.Board;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
public interface BoardService {
	public List<Board> getAllBoard(Board form);
}
