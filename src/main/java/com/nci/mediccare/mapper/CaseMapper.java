package com.nci.mediccare.mapper;

import com.nci.mediccare.domain.CaseInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CaseMapper {

    void deleteById(long id);

    void insert(CaseInfo caseInfo);

    void update(CaseInfo caseInfo);

    List<CaseInfo> selectAllCases();

    CaseInfo selectById(Long caseId);

    List<CaseInfo> selectCasesByPatientId(long patientId);
}
