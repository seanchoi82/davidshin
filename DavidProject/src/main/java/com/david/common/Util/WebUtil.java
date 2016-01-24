package com.david.common.Util;

import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponentsBuilder;

public class WebUtil {
	public static String getCurrentRequestURL() {
		UriComponentsBuilder uriComponentsBuilder = ServletUriComponentsBuilder.fromCurrentRequest();
		String urlStr = uriComponentsBuilder.build().toUriString();
		return urlStr;
	}
}
