package com.fintechviet.loyalty.validator;

import com.fintechviet.loyalty.model.Voucher;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class VoucherValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Voucher.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Voucher voucher = (Voucher) o;

        //For Name
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "voucherForm.name.empty");
        if (voucher.getName().length()  > 255) {
            errors.rejectValue("name", "voucherForm.name.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type", "voucherForm.type.empty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "voucherForm.description.empty");

        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "marketPrice", "voucherForm.marketPrice.empty");

        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "voucherForm.price.empty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "quantity", "voucherForm.quantity.empty");

        if (voucher.getId() == null) {
            if (StringUtils.isEmpty(voucher.getPictureFile().getOriginalFilename())) {
                errors.rejectValue("pictureFile", "voucherForm.pictureFile.empty");
            }
        }
    }
}
