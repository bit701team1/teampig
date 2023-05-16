package boot.semipig.controller;

import boot.semipig.dto.FoodPhotoDto;

import boot.semipig.dto.OwnerpageDto;

import boot.semipig.mapper.OwnerpageMapper;
import boot.semipig.service.OwnerpageService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

// 추가


@Controller
@RequestMapping("/ownerpage")
public class OwnerpageController {
    @Autowired
    OwnerpageService ownerpageService;

    @Autowired
    public NcpObjectStorageService storageService;

    public String bucketName = "pig701-bucket";

    List<String> photoNames=new ArrayList<>();


    @GetMapping("/writeform1")
    public String writeform1() {
        return "/main/ownerpage/writeform";
    }

    @GetMapping("/writeform2")
    public String writeform2() {
        return "/ownerpage/writeform";
    }

    @PostMapping("/upload")
    @ResponseBody public void upload(List<MultipartFile> upload)
    {
        System.out.println("size:"+upload.size());
        System.out.println("filename 0:"+upload.get(0).getOriginalFilename());

        photoNames.clear();
        for(MultipartFile file:upload) {
            //스토리지에 업로드
            String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
            System.out.println("name:"+photoname);
            //업로드한 파일명을 DB에 저장
            photoNames.add(photoname);
        }
    }

//    @PostMapping("/insert")
//    @ResponseBody
//    public void insertOwner(OwnerpageDto dto, List<MultipartFile> upload) throws JSONException, IOException {
//        //데이터부터 DB에 저장
//        ownerpageService.insertOwner(dto);
//
//        System.out.println("food_idx:" + dto.getFood_idx());
//        System.out.println("content:" + dto.getGPT_content());
//        if (upload != null) {
//            System.out.println("size:" + upload.size());
//            System.out.println("upload.get(0).getOriginalFilename()=" + upload.get(0).getOriginalFilename());
//            for (MultipartFile file : upload) {
//                //스토리지에 업로드하기
//                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
//                //업로드한 파일명을 DB에 저장
//                FoodPhotoDto fdto = new FoodPhotoDto();
//                fdto.setFood_idx(dto.getFood_idx());
//                fdto.setPhotoname(photoname);
//                ownerpageService.insertPhoto(fdto);
//            }
//        }
//        System.out.println("upload:"+upload);
//    }
//    @PostMapping("/insert")
//    @ResponseBody
//    public int insertOwner(OwnerpageDto dto, List<MultipartFile> upload) throws JSONException, IOException {
//        // 데이터부터 DB에 저장
//        ownerpageService.insertOwner(dto);
//        //추가
//        String openaiResult = ownerpageService.openai(dto.getFood_idx());
//        dto.setGPT_content(openaiResult);
//        ownerpageService.updatePrompt(dto);
//        if (upload != null) {
//            for (MultipartFile file : upload) {
//                // 스토리지에 업로드하기
//                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
//                // 업로드한 파일명을 DB에 저장
//                FoodPhotoDto fdto = new FoodPhotoDto();
//                fdto.setFood_idx(dto.getFood_idx());
//                fdto.setPhotoname(photoname);
//                ownerpageService.insertPhoto(fdto);
//            }
//        }
//
//        // Return the food_idx value as the response
//        return dto.getFood_idx();
//    }
@PostMapping("/insert")
@ResponseBody
public Map<String, Object> insertOwner(OwnerpageDto dto, List<MultipartFile> upload) throws JSONException, IOException {
    // 데이터부터 DB에 저장
    ownerpageService.insertOwner(dto);

    // 추가
    String openaiResult = ownerpageService.openai(dto.getFood_idx());
    dto.setGPT_content(openaiResult);
    ownerpageService.updatePrompt(dto);

    if (upload != null) {
        for (MultipartFile file : upload) {
            // 스토리지에 업로드하기
            String photoname = storageService.uploadFile(bucketName, "foodphoto", file);

            // 업로드한 파일명을 DB에 저장
            FoodPhotoDto fdto = new FoodPhotoDto();
            fdto.setFood_idx(dto.getFood_idx());
            fdto.setPhotoname(photoname);
            ownerpageService.insertPhoto(fdto);
        }
    }

    // Create a map to hold the response values
    Map<String, Object> response = new HashMap<>();
    response.put("food_idx", dto.getFood_idx());
    response.put("openaiResult", openaiResult);

    // Return the response map as the response
    return response;
}


    @PostMapping("/insertphoto")
    @ResponseBody
    public void insertphoto(OwnerpageDto dto, List<MultipartFile> upload)
    {
        if (upload != null) {
            System.out.println("size:" + upload.size());
            System.out.println("upload.get(0).getOriginalFilename()=" + upload.get(0).getOriginalFilename());
            for (MultipartFile file : upload) {
                //스토리지에 업로드하기
                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
                //업로드한 파일명을 DB에 저장
                FoodPhotoDto fdto = new FoodPhotoDto();
                fdto.setFood_idx(dto.getFood_idx());
                fdto.setPhotoname(photoname);
                ownerpageService.insertPhoto(fdto);
            }
        }
        System.out.println("insert upload:"+upload);
    }

    @GetMapping("/writeform")
    public String insert()
    {
        return "/ownerpage/writeform";
    }

    @RequestMapping(value = "/openai", method = RequestMethod.GET, params = "food_idx")
    public String openai(@RequestParam("food_idx") int food_idx, Model model) throws JSONException, IOException {
        String openaiResult = ownerpageService.openai(food_idx);
        model.addAttribute("openaiResult", openaiResult);
        System.out.println("openai:"+ownerpageService.openai(food_idx));
        return "ownerpage/promptview";
    }
//기존 airesult
    @RequestMapping(value = "/airesult", method = RequestMethod.GET, params= "food_idx")
    public String airesult(Model model, @RequestParam int food_idx) throws IOException, JSONException {
        OwnerpageDto dto = ownerpageService.getData(food_idx);
        model.addAttribute("dto", dto);
//        String aiprompt = ownerpageService.openai(food_idx);
//        model.addAttribute("aiprompt", aiprompt);

        String openaiResult = ownerpageService.openai(food_idx);
//        System.out.println("airesult:"+ownerpageService.openai(food_idx));
//        return openaiResult;
        System.out.println("airesult: " + openaiResult);

//        // Pass the openaiResult to the updateprompt endpoint
        dto.setGPT_content(openaiResult);
        // Redirect to the updateprompt endpoint
        return "redirect:/updateprompt";
//        return openaiResult;
    }


//    @RequestMapping(value = "/airesult", method = RequestMethod.GET, params = "food_idx", produces = "application/json")
//    @ResponseBody
//    public ResponseEntity<?> airesult(@RequestParam int food_idx) throws IOException, JSONException {
//        OwnerpageDto dto = ownerpageService.getData(food_idx);
//        String openaiResult = ownerpageService.openai(food_idx);
//        System.out.println("airesult: " + openaiResult);
//
//        // Create a JSON object to hold the openaiResult value
//        JSONObject response = new JSONObject();
//        response.put("openaiResult", openaiResult);
//
//        return ResponseEntity.ok(response.toString());
//    }




    @GetMapping("/promptview")
    public String promptview(int food_idx, Model model) throws JSONException, IOException {
        OwnerpageDto dto = ownerpageService.getData(food_idx);

        model.addAttribute("dto", dto);


        return "ownerpage/promptview";
    }


    @PostMapping("/update")
    public String update(OwnerpageDto dto, List<MultipartFile> upload) throws JSONException, IOException {
        //수정
        ownerpageService.updateOwner(dto);

        String openaiResult = ownerpageService.openai(dto.getFood_idx());
        dto.setGPT_content(openaiResult);
        ownerpageService.updatePrompt(dto);
        System.out.println("update:"+openaiResult);
        if (upload != null) {
            System.out.println("size:" + upload.size());
            System.out.println("upload.get(0).getOriginalFilename()=" + upload.get(0).getOriginalFilename());
            for (MultipartFile file : upload) {
                //스토리지에 업로드하기
                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
                //업로드한 파일명을 DB에 저장
                FoodPhotoDto fdto = new FoodPhotoDto();
                fdto.setFood_idx(dto.getFood_idx());
                fdto.setPhotoname(photoname);
                ownerpageService.insertPhoto(fdto);
            }
        }
        //수정 후 내용보기로 이동
        return "redirect:./promptview?food_idx="+dto.getFood_idx();
    }

//    @PostMapping("/updateprompt")
//    public String updateprompt(OwnerpageDto dto)
//    {
//       ownerpageService.updatePrompt(dto);
//        System.out.println("updateprompt:"+dto.getGPT_content());
//        return "redirect:./promptview?food_idx="+dto.getFood_idx();
//    }
    //기존
//    @PostMapping("/updateprompt")
//    public String updateprompt(OwnerpageDto dto, Model model) {
//        ownerpageService.updatePrompt(dto);
//        System.out.println("updateprompt: " + dto.getGPT_content());
//
//        // Set a success message or any other necessary data in the model
//        model.addAttribute("message", "Prompt updated successfully!");
//
//        // Redirect to the writeform endpoint
//        return "redirect:/writeform";
//    }

    @PostMapping("/U_updateprompt")
    public String U_updateprompt(OwnerpageDto dto) {
        ownerpageService.updatePrompt(dto);
        System.out.println("updateprompt: " + dto.getGPT_content());

        // Redirect to the writeform endpoint
        return "redirect:/ownerpage/home";
    }

    @PostMapping("/W_updateprompt")
    public String W_updateprompt(OwnerpageDto dto) {
        ownerpageService.updatePrompt(dto);
        System.out.println("updateprompt: " + dto.getGPT_content());

        // Redirect to the writeform endpoint
        return "redirect:/ownerpage/home";
    }


    @GetMapping("/updateform")
    public String updateform(int food_idx, Model model)
    {
        OwnerpageDto dto=ownerpageService.getData(food_idx);

        model.addAttribute("dto", dto);

        return "/ownerpage/updateform";
    }

    @PostMapping("/temp_login")
    public String doLogin(String id,
                          int user_idx,
                          HttpSession session) {

        session.setAttribute("id", id);
        session.setAttribute("user_idx", user_idx);

        int food_idx= ownerpageService.getFood_idx(user_idx);

        return "redirect:./promptview?food_idx="+food_idx;
    }

    @GetMapping("temp_logout")
    public String logout(HttpSession session) {

        session.removeAttribute("id");
        session.removeAttribute("user_idx");
        return "redirect:/home";
    }

//    @GetMapping("/getphoto")
//    @ResponseBody public List<OwnerpageDto> getphoto()
//    {
//        List<OwnerpageDto> list=ownerpageService.getAllOwner();
//        for(OwnerpageDto dto:list)
//        {
//            int fidx=dto.getFood_idx();
//            List<FoodPhotoDto> flist=ownerpageService.getPhotos(fidx);
//            dto.setPhotoList(flist);
//            System.out.println("flist:"+flist);
//        }
//        return list;
//    }

    @GetMapping("/getphoto")
    @ResponseBody
    public List<OwnerpageDto> getphoto(@RequestParam Optional<Integer> food_idx) {
        if (food_idx.isPresent()) {
            List<OwnerpageDto> list = ownerpageService.getDataPhoto(food_idx.get());
            for (OwnerpageDto dto : list) {
                List<FoodPhotoDto> flist = ownerpageService.getPhotos(food_idx.get());
                dto.setPhotoList(flist);
                System.out.println("1flist:" + flist);
            }
            return list;
        } else {
            return new ArrayList<>(); // food_idx가 없을 경우 빈 리스트 반환
        }
    }
    @GetMapping("/home")
    public String home(){
        return "ownerpage/home";
    }

    @GetMapping("/removephotos")
    @ResponseBody
    public void deletePhoto(int food_idx) {
        // Retrieve the photo filename from the database
        List<String> list=ownerpageService.getAllPhoto(food_idx);
        // Delete the photo from the storage
        for(String photoname:list)
        {
            storageService.deleteFile(bucketName,"foodphoto", photoname);
        }
        // Delete the photo from the database
        ownerpageService.removePhotos(food_idx);
    }




}
