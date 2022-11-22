package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.User;
import org.priceaggregator.aggregator.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirm,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {
        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);

        if (isConfirmEmpty) {
            model.addAttribute("password2Error", "Підтвердження паролю не може бути порожнім");
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Паролі різні!");
            return "registration";
        }

        if (isConfirmEmpty || bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "Такий користувач існує!");
            return "registration";
        }

        return "redirect:/login";
    }
}
