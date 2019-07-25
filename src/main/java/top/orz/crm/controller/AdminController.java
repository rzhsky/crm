package top.orz.crm.controller;

import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import top.orz.crm.bean.Employee;
import top.orz.crm.service.AdminService;
import top.orz.crm.util.MD5;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
public class AdminController {

    @Autowired
    private AdminService adminService;

    @PostMapping(value = "/admin/login")
    public String login( Employee employee, HttpSession session){
        try {
            String password=MD5.EncoderByMd5(employee.getPassword());
            //System.out.println(password);
            employee.setPassword(password);
            Employee e=adminService.login(employee);
            if (e==null){
                return "0";
            }else {
                session.setAttribute("employee",e);
                return "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return "0";
    }

    /**
     * 头像上传
     */
    @RequestMapping(value = "/upload/headImg",method = {RequestMethod.POST})
    public Object headImg(@RequestParam(value="file",required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String prefix="";
        String namestr="";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        String originalName=null;
        try{
            if(file!=null){
                originalName = file.getOriginalFilename();
//                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
                namestr= UUID .randomUUID()+"_"+originalName;
                String filepath = request.getServletContext().getRealPath("/upload/")+ namestr;
                filepath = filepath.replace("\\", "/");
                File files=new File(filepath);
                //打印查看上传路径
               // System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
            }
        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String,Object> map=new HashMap<>();
        Map<String,Object> map2=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",map2);
        map2.put("src",namestr);
        return map;
    }

    /**
     * 更改管理员资料
     */
    @PutMapping(value = "/admin/update")
    public String updateEmp(@RequestBody Employee employee,HttpSession session) {
        System.out.println("修改的员工信息" + employee);
        try {
            Employee em=adminService.updateEmp(employee);
            session.setAttribute("employee",em);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }
    /**
     * 更改密码
     */
    @PutMapping(value = "/admin/updatepassword")
    public  String updatepassword(@RequestBody Employee employee){
        try{
            String password=MD5.EncoderByMd5(employee.getPassword());
            //System.out.println(password);
            employee.setPassword(password);
            adminService.updatepassword(employee);
            return "1";
        }catch (Exception e){
            return "0";
        }
    }

    /**
     * 退出登陆
     */
    @GetMapping(value = "/admin/loginout")
    public String loginout(HttpSession session){
        session.invalidate();
        return "1";
    }
}
