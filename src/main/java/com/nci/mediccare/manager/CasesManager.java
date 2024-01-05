package com.nci.mediccare.manager;

import com.nci.mediccare.domain.CaseInfo;

import java.util.List;

public interface CasesManager {

    void deleteById(long id);

    void insert(CaseInfo caseInfo);

    void update(CaseInfo caseInfo);

    List<CaseInfo> selectAllCases();

    CaseInfo selectById(Long caseId);

    List<CaseInfo> selectCasesByPatientId(long patientId);
}
