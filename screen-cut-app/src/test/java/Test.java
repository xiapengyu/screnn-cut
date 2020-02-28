import java.util.Date;

import com.yunjian.common.utils.DateUtils;

public class Test {
    public static void main(String[] args){
        String redeemNo = "";
        redeemNo = DateUtils.format(new Date(), "yyyyMMddHHmmss")
                + "I" + String.format("%0" + 5 + "d", 1);
        System.out.println(redeemNo);
    }
}
