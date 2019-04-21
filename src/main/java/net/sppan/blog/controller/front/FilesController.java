package net.sppan.blog.controller.front;

import com.sun.crypto.provider.DESCipher;
import net.sppan.blog.common.Constants;
import net.sppan.blog.controller.BaseController;
import net.sppan.blog.entity.Files;
import net.sppan.blog.service.FilesService;
import net.sppan.blog.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
// 用于处理相册页面的controller
@Controller
@RequestMapping("/album")
public class FilesController extends BaseController {

    @Resource
    private FilesService filesService;

    @RequestMapping("/index")
    public String album(@RequestParam(required = false, defaultValue = "1") Integer p, ModelMap map) {
        Sort sort = new Sort(Sort.Direction.DESC,"createAt");
        PageRequest pageRequest = new PageRequest(p - 1, 3,sort);
        map.addAttribute("page",filesService.findAll(pageRequest, 0));
        pageRequest = new PageRequest(0 ,5,sort);
        map.addAttribute("carousel",filesService.findAll(pageRequest,0,1));
        return "front/album/index";
    }
}
