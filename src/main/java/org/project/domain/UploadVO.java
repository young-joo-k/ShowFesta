package org.project.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UploadVO {
	private String name;
	private MultipartFile file;
}
