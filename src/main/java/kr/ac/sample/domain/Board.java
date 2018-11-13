/**
 *
 */
package kr.ac.sample.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
@Entity
@Table(name = "BOARD")
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BOARD_SEQNO")
	private long boardSeqno;

	@Column(name = "BOARD_SUBJECT")
	private String boardSubject;

	public long getBoardSeqno() {
		return boardSeqno;
	}

	public void setBoardSeqno(long boardSeqno) {
		this.boardSeqno = boardSeqno;
	}

	public String getBoardSubject() {
		return boardSubject;
	}

	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}

}
