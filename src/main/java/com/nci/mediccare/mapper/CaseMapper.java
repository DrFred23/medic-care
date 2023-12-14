package com.nci.mediccare.mapper;

import com.nci.mediccare.domain.CaseInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CaseMapper {
    void insert(CaseInfo caseInfo);

    List<CaseInfo> selectAllCases();

    List<CaseInfo> selectCasesByPatientId(long patientId);
}
