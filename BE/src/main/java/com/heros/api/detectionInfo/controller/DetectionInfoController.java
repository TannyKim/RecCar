package com.heros.api.detectionInfo.controller;


import com.heros.api.detectionInfo.dto.response.PartWithDetectionInfoResponse;
import com.heros.api.detectionInfo.service.DetectionInfoService;
import com.heros.api.example.model.ErrorResponseExample;
import com.heros.api.example.model.UserValue;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "DetectionInfoController", description = "차량 파손 정보 API")
@RestController
@RequiredArgsConstructor
public class DetectionInfoController {

    private final DetectionInfoService detectionInfoService;

    @Operation(summary = "차량파손정보")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "success", content = @Content(schema = @Schema(implementation = PartWithDetectionInfoResponse.class))),
            @ApiResponse(responseCode = "404", description = "fail", content = @Content(schema = @Schema(implementation = ErrorResponseExample.class)))
    })
    @GetMapping(value = "/api/v1/detection")
    public PartWithDetectionInfoResponse getDetectionInfos(@Param(value = "carId") Long carId){

        PartWithDetectionInfoResponse detectionInfos = detectionInfoService.getDetectionInfos(carId);

        return detectionInfos;
    }
}
