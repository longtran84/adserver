package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.model.User;
import com.fintechviet.ads.service.CampaignService;
import com.fintechviet.ads.service.UserService;
import com.fintechviet.ads.validator.CampaignValidator;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CampaignController {
    @Autowired
    private CampaignService campaignService;

    @Autowired
    private CampaignValidator campaignValidator;

    @RequestMapping(value = {"/", "/campaign"}, method = RequestMethod.GET)
    public String campaign(Model model, HttpServletRequest request) {
        model.addAttribute("campaignForm", new Campaign());

        return "campaign";
    }

    @RequestMapping(value = "/campaign", method = RequestMethod.POST)
    public String campaign(@ModelAttribute("campaignForm") Campaign campaignForm, BindingResult bindingResult, Model model) {
        campaignValidator.validate(campaignForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "campaign";
        }

        campaignForm.setStartDate(DateUtils.convertStringToDate(campaignForm.getStartDateTmp()  + " 00:00:00"));
        if (!StringUtils.isEmpty(campaignForm.getEndDateTmp())) {
            campaignForm.setEndDate(DateUtils.convertStringToDate(campaignForm.getEndDateTmp() + " 23:59:59"));
        }

//        campaignForm.setFreCap(Integer.valueOf(campaignForm.getFreCapTmp()));
//        campaignForm.setFreCapDuration(Integer.valueOf(campaignForm.getFreCapDurationTmp()));
		
        if (campaignForm.getId() == null) {
			campaignForm.setStatus("NEW");
		}
        campaignService.save(campaignForm);

        return "redirect:/campaign";
    }

    @RequestMapping(value = "/reportCampaign", method = RequestMethod.GET)
    public String reportCampaign() {
        return "report_campaign";
    }

    @RequestMapping(value = "/reportCost", method = RequestMethod.GET)
    public String reportCost() {
        return "report_cost";
    }

    @RequestMapping(value = "/reportInventory", method = RequestMethod.GET)
    public String reportInventory() {
        return "report_inventory";
    }

}
