package com.dream.shiro;

import lombok.Data;

import java.io.Serializable;

@Data
public class AccountProfile implements Serializable {
    private Long userId;

    private String userName;

    private String userProfilePhoto;

    private String userEmail;
}
