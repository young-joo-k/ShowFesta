package org.project.domain;

import lombok.Data;

@Data
public class NewsVO {
	
	private String title;
	private String description;
	private String url;
	
    public NewsVO(String title, String description, String url) {
        this.title = title;
        this.description = description;
        this.url = url;
    }
}
