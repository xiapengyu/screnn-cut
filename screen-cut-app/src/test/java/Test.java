import com.yunjian.common.utils.DateUtils;
import com.yunjian.core.dto.AccountDto;

import java.util.Date;

public class Test {
    public static void main(String[] args){
        String redeemNo = "";
        redeemNo = DateUtils.format(new Date(), "yyyyMMddHHmmss")
                + "I" + String.format("%0" + 5 + "d", 1);
        System.out.println(redeemNo);
    }
}
