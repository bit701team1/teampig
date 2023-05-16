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
    public String openai(int food_idx) throws IOException, JSONException {
        //data를 불러온다
        OwnerpageDto odto = ownerpageMapper.getData(food_idx);
        //data로 prompt 생성
        /*
        * TODO
        *  프롬프트 채워넣기
        * */

        String aiprompt = "너는 마케터야, 제공하는 정보로 홍보글 작성해줘 \n가게 이름: "+odto.getRESTRT_NM()+", 주요메뉴: "+odto.getREPRSNT_FOOD_NM()+", 주소: "+odto.getREFINE_ROADNM_ADDR()+", 전화번호: "+odto.getTASTFDPLC_TELNO()
         +", 오픈시간: "+odto.getOpentime()+", 영업종료시간: "+odto.getClosetime()+", 휴일: "+odto.getHoliday()+", 가게 강점: "+odto.getPoint();

        //openai로 보낸다
        System.out.println("Prompt: " + aiprompt); // prompt 확인하기
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json"); // 데이터 타입이 무엇인가
        con.setRequestProperty("Authorization","Bearer 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");//인증 ,openapi key
        con.setDoOutput(true);

        JSONObject data = new JSONObject();
        JSONArray message_arr = new JSONArray();
        JSONObject message = new JSONObject();

        data.put("model","gpt-3.5-turbo");
        message.put("role","user");
        message.put("content",aiprompt);
        message_arr.put(message);
        data.put("messages",message_arr);

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
        String generatedText = choicesArr.getJSONObject(0).getJSONObject("message").getString("content");;

        return generatedText;

    }

    @Override
    public OwnerpageDto getData(int food_idx) {
        return ownerpageMapper.getData(food_idx);
    }

    @Override
    public void updateOwner(OwnerpageDto dto) {
        ownerpageMapper.updateOwner(dto);
    }

    @Override
    public void updatePrompt(OwnerpageDto dto) {
        ownerpageMapper.updatePrompt(dto);
    }

    @Override
    public int getFood_idx(int user_idx) {
        int food_idx= ownerpageMapper.getFood_idx(user_idx);
        return food_idx;
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
    public List<FoodPhotoDto> getPhotos(int food_idx) {
        return ownerpageMapper.getPhotos(food_idx);
    }

//    @Override
//    public List<OwnerpageDto> getAllOwner() { return ownerpageMapper.getAllOwner();}
//    @Override
    public List<String> getAllPhoto(int food_idx) {
        return ownerpageMapper.getAllPhoto(food_idx);
    }

    @Override
    public List<OwnerpageDto> getDataPhoto(int food_idx) {
        return ownerpageMapper.getDataPhoto(food_idx);
    }


    @Override
    public String removephotos(int food_idx) {
        ownerpageMapper.removephotos(food_idx);
        return "Success"; // Or any other appropriate result
    }


    @Override
    public void removePhotos(int food_idx) {
        ownerpageMapper.removephotos(food_idx);
    }
}
