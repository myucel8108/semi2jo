package bit.data.controller;

import bit.data.service.PayServiceInter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;	
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Slf4j
@RestController
@RequiredArgsConstructor
public class PayController {

    @Autowired
    PayServiceInter payService;
    
    @RequestMapping("/verifyIamport")
    public class VerifyController {

        /** Iamport ���� ���� ��Ʈ�ѷ� **/
        private final IamportClient iamportClient;

        // �����ڸ� ���� REST API �� REST API secret �Է�
        public VerifyController(){
            this.iamportClient = new IamportClient("...", "...");
        }

        /** ����Ʈ���� ���� PG�� �ᱣ���� ���� ������Ʈ ��ū ���� **/
        @PostMapping("/{imp_uid}")
        public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException{
            log.info("paymentByImpUid ����");
            return iamportClient.paymentByImpUid(imp_uid);
        }

    }
}
