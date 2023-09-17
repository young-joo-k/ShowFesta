package org.project.domain;


import lombok.Data;

@Data
public class SearchVO {
    private String m_num;
    private String m_title;
    private String m_b_link;
    private String a_name;
    private String a_img;
    private String m_img;
    private String a_link;
    private String type; // "Musical", "Festival", "Actor" 등
    
    // 생성자, 게터, 세터 등 필요한 메서드 추가
}