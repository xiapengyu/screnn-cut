

package com.yunjian.core.form;

import lombok.Data;

/**
 * 密码表单
 *
 *
 */
@Data
public class PasswordForm {
    /**
     * 原密码
     */
    private String password;
    /**
     * 新密码
     */
    private String newPassword;

}
