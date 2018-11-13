/**
 *
 */
package kr.ac.sample.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
@Entity
@Table(name = "CUSTOMER")
public class Board {
	@Id
	@Column(name = "BOARD_SEQNO")
	private String boardSeqno;

	@Column(name = "BOARD_SUBJECT")
	private String boardSubject;

	public String getBoardSeqno() {
		return boardSeqno;
	}

	public void setBoardSeqno(String boardSeqno) {
		this.boardSeqno = boardSeqno;
	}

	public String getBoardSubject() {
		return boardSubject;
	}

	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}

}
