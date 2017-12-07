package com.fintechviet.loyalty.web;

import com.fintechviet.loyalty.model.Voucher;
import com.fintechviet.loyalty.service.VoucherService;
import com.fintechviet.loyalty.validator.VoucherValidator;
import com.fintechviet.system.model.SystemParameter;
import com.fintechviet.system.service.SystemParameterService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by tungn on 9/12/2017.
 */
@Controller
public class VoucherController {
    @Autowired
    private VoucherService voucherService;
    @Autowired
    private SystemParameterService systemParameterService;
    @Autowired
    private VoucherValidator voucherValidator;
    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/loyalty/voucher", method = RequestMethod.GET)
    public String voucher(Model model) {
        model.addAttribute("voucherForm", new Voucher());

        return "voucher";
    }

    @RequestMapping(value = "/loyalty/voucher", method = RequestMethod.POST)
    public String voucher(@ModelAttribute("voucherForm") Voucher voucherForm, BindingResult bindingResult) throws IOException {
        voucherValidator.validate(voucherForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "voucher";
        }

        MultipartFile file = voucherForm.getPictureFile();
        if (!file.getOriginalFilename().isEmpty()) {
            SystemParameter systemParameter = systemParameterService.getById(1);
            File folderStore = resourceLoader.getResource(systemParameter.getLoyaltyVoucherImageFolder()).getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            voucherForm.setPicture(systemParameter.getLoyaltyVoucherImagePath() + file.getOriginalFilename());
        }

        Voucher voucher = null;
        if (voucherForm.getId() != null) {
            voucher = voucherService.findById(voucherForm.getId());
            voucher.setName(voucherForm.getName());
            voucher.setPrice(voucherForm.getPrice());
            voucher.setLegacyId(voucherForm.getLegacyId());
            voucher.setType(voucherForm.getType());
            voucher.setDescription(voucherForm.getDescription());
            voucher.setMarketPrice(voucherForm.getMarketPrice());
            voucher.setPrice(voucherForm.getPrice());
            voucher.setStatus(voucherForm.getStatus());
            if (StringUtils.isNotEmpty(voucherForm.getPicture()))
                voucher.setPicture(voucherForm.getPicture());
            voucherService.save(voucher);
        } else {
            voucherService.save(voucherForm);
        }

        return "redirect:/loyalty/voucher";
    }
}
