import com.yunjian.core.dto.AccountDto;

public class Test {
    public static void main(String[] args){
        System.out.println((int)((Math.random()*9+1)*1000000));

        AccountDto dto = new AccountDto();
        dto.setId(1);
        System.out.println(dto.getId());
    }
}
