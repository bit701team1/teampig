package boot.semipig.service;


import boot.semipig.dto.FoodPhotoDto;
import boot.semipig.dto.OwnerpageDto;
import org.springframework.boot.configurationprocessor.json.JSONException;

import java.io.IOException;
import java.util.List;

public interface OwnerpageServiceInter {
    public void insertOwner(OwnerpageDto dto);

    public void insertPhoto(FoodPhotoDto dto);

    public String openai(int user_idx) throws IOException, JSONException;

    public OwnerpageDto getData(int user_idx);
    public void updateOwner(OwnerpageDto dto);

    public void updatePrompt(OwnerpageDto dto);


    public List<FoodPhotoDto> getPhotos(int user_idx);

    public List<OwnerpageDto> getDataPhoto(int user_idx);


    public List<String> getAllPhoto(int user_idx);


    public void removePhotos(int user_idx);
}