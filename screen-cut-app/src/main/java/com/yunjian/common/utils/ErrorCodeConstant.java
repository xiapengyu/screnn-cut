/**
 * Copyright 2017-2025 Evergrande Group.
 */
package com.yunjian.common.utils;

public class ErrorCodeConstant {
    private ErrorCodeConstant() {
    }

    public static final String MD5_SIGNATURE_FAIL = "pgc.signature.md5.signature.fail";

    public static final String HMAC_SHA256_SIGNATURE_FAIL = "pgc.signature.hmac-sha256.signature.fail";

    public static final String RSA2_SIGNATURE_FAIL = "pgc.signature.rsa2.signature.fail";

    public static final String RSA_SIGNATURE_FAIL = "pgc.signature.rsa.signature.fail";

    public static final String GENERATE_PRIVATE_KEY_FAIL = "pgc.signature.generate.privateKey.fail";

    public static final String GENERATE_PUBLIC_KEY_FAIL = "pgc.signature.generate.publicKey.fail";

    public static final String ALIPAY_SIGNATURE_CHECK_FAIL = "pgc.signature.alipay.signatureCheck.fail";

    public static final String WEIXIN_CREATE_ORDER_ERROR = "create.order.request.from.backend.systme.request.http.or.conversion.exception";

    public static final String ABNORMAL_CONVERSION = "transform.exception";

    public static final String CREATE_ORDER_FOR_ALIPAY = "create.order.for.alipay.error";

    public static final String CREATE_REFUND_FOR_ALIPAY = "create.refund.for.alipay.error";

    public static final String REQUEST_PARAMTERS_IS_NULL = "dto.from.backend.system.request.for.create.order.is.null";

    public static final String WEIXIN_CREATE_REFUND_ERROR = "create.refund.request.from.backend.systme.request.http.or.conversion.exception";

}
