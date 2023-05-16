package boot.semipig.mapper;

import boot.semipig.dto.FoodPhotoDto;
import boot.semipig.dto.OwnerpageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OwnerpageMapper {
    public void insertOwner(OwnerpageDto dto);
    public void insertPhoto(FoodPhotoDto dto);
    public OwnerpageDto getData(int food_idx);
    public void updateOwner(OwnerpageDto dto);
    public void updatePrompt(OwnerpageDto dto);
    public int getFood_idx(int user_idx);
    public List<FoodPhotoDto> getPhotos(int food_idx);
    public List<OwnerpageDto> getAllOwner();
    public List<String> getAllPhoto(int food_idx);
    public List<OwnerpageDto> getDataPhoto(int food_idx);
    public void removephotos(int food_idx);



}
