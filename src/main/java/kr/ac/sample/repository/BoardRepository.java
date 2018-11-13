/**
 *
 */
package kr.ac.sample.repository;

import org.springframework.data.repository.CrudRepository;

import kr.ac.sample.domain.Board;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
public interface BoardRepository extends CrudRepository<Board, Long> {
	public Board findByBoardSeqno(long boardSeqno);

}
