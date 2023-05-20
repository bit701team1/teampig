package boot.semipig.service;

import boot.semipig.dto.FoodPhotoDto;
import boot.semipig.dto.OwnerpageDto;
import boot.semipig.mapper.OwnerpageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

@Service
public class OwnerpageService implements OwnerpageServiceInter {
    @Autowired
    private OwnerpageMapper ownerpageMapper;

    @Override
    public void insertOwner(OwnerpageDto dto) {
        ownerpageMapper.insertOwner(dto);
    }

    @Override
    public void insertPhoto(FoodPhotoDto dto) {
        ownerpageMapper.insertPhoto(dto);
    }

    @Override
    public String openai(int user_idx) throws IOException, JSONException {
        //data를 불러온다
        OwnerpageDto odto = ownerpageMapper.getData(user_idx);
        //data로 prompt 생성
        /*
         * TODO
         *  프롬프트 채워넣기
         * */

        String aiprompt = "너는 세계의 관광객들에게 식당을 소개하는 사장님이야, 아래 제공하는 정보와 요청하는 언어로 읽기좋고 줄바꿈 잘해서 방문하고 싶은 식당 홍보글 작성해줘 \n가게 이름: "+odto.getRESTRT_NM()+"\n주요메뉴: "+odto.getREPRSNT_FOOD_NM()+"\n주소: "+odto.getREFINE_ROADNM_ADDR()+"\n전화번호: "+odto.getTASTFDPLC_TELNO()
         +"\n오픈시간: "+odto.getOpentime()+"\n영업종료시간: "+odto.getClosetime()+"\n휴일: "+odto.getHoliday()+"\n작성시 요청사항: "+odto.getPoint();

        //openai로 보낸다
        System.out.println("Prompt: " + aiprompt); // prompt 확인하기
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json"); // 데이터 타입이 무엇인가


        con.setRequestProperty("Authorization", "Bearer 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");//인증 ,openapi key


        con.setDoOutput(true);

        JSONObject data = new JSONObject();
        JSONArray message_arr = new JSONArray();
        JSONObject message = new JSONObject();

        data.put("model", "gpt-3.5-turbo");
        message.put("role", "user");
        message.put("content", aiprompt);
        message_arr.put(message);
        data.put("messages", message_arr);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
        bw.write(data.toString());
        bw.flush();//서버에 전송
        bw.close();//닫기

//        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
//        Class<? extends BufferedReader> returnMsg=in.getClass();
//
//        System.out.println(returnMsg.toString());
//        String result = data.get("message").toString();

        /*GPT 해결방법*/
        BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
        StringBuilder responseBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            responseBuilder.append(line);
        }
        reader.close();

        String jsonResponse = responseBuilder.toString(); // API 호출 결과 JSON 데이터

//        System.out.println("API Response: " + jsonResponse); // JSON 데이터 확인하기

        JSONObject responseJson = new JSONObject(jsonResponse);
        JSONArray choicesArr = responseJson.getJSONArray("choices");
        String generatedText = choicesArr.getJSONObject(0).getJSONObject("message").getString("content");
        ;

        return generatedText;

    }

    @Override
    public OwnerpageDto getData(int user_idx) {
        return ownerpageMapper.getData(user_idx);
    }

    @Override
    public void updateOwner(OwnerpageDto dto) {
        ownerpageMapper.updateOwner(dto);
    }

    @Override
    public void updatePrompt(OwnerpageDto dto) {
        ownerpageMapper.updatePrompt(dto);
    }


//    @Override
//    public String getSelectPhoto(int photo_idx) {
//        return ownerpageMapper.getSelectPhoto(photo_idx);
//    }

//    @Override
//    public List<String> getAllPhoto(int food_idx) {
//        return ownerpageMapper.getAllPhoto(food_idx);
//    }

    @Override
    public List<FoodPhotoDto> getPhotos(int user_idx) {
        return ownerpageMapper.getPhotos(user_idx);
    }

    //    @Override
//    public List<OwnerpageDto> getAllOwner() { return ownerpageMapper.getAllOwner();}
//    @Override
    public List<String> getAllPhoto(int user_idx) {
        return ownerpageMapper.getAllPhoto(user_idx);
    }

    @Override
    public List<OwnerpageDto> getDataPhoto(int user_idx) {
        return ownerpageMapper.getDataPhoto(user_idx);
    }


    @Override
    public void removePhotos(int user_idx) {
        ownerpageMapper.removephotos(user_idx);
    }
}