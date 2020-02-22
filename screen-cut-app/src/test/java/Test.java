import org.apache.commons.lang.StringUtils;

import java.util.Date;

public class Test {
    public static void main(String[] args){
        long now = new Date().getTime();
        long expireTime = new Date().getTime() + 1000 * 60 * 120;

        System.out.println(now);
        System.out.println(new Date(now));
        System.out.println(expireTime);
        System.out.println(new Date(expireTime));
    }
}
