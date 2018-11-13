/**
 *
 */
package kr.ac.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author sykim
 * @created 2018. 11. 8.
 * @modified
 */
@Controller
public class MainController {
	@RequestMapping(value = { "/", "/newFile" }, method = RequestMethod.GET)
	public String main() {

		return "newFile";
	}
}
