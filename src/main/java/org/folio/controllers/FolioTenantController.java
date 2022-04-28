package org.folio.controllers;


import javax.validation.Valid;

import org.folio.spring.controller.TenantController;
import org.folio.spring.service.TenantService;
import org.folio.tenant.domain.dto.TenantAttributes;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@RestController("folioTenantController")
@RequestMapping
@Log4j2
public class FolioTenantController extends TenantController {

    public FolioTenantController(TenantService tenantService) {
        super(tenantService);
    }

    @Override
    public ResponseEntity<Void> postTenant(@Valid TenantAttributes tenantAttributes) {
        return super.postTenant(tenantAttributes);
    }
}
