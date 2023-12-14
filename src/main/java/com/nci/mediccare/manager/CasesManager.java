package com.nci.mediccare.manager;

import com.nci.mediccare.domain.CaseInfo;

import java.util.List;

public interface CasesManager {
    void insert(CaseInfo caseInfo);

    List<CaseInfo> selectAllCases();

    List<CaseInfo> selectCasesByPatientId(long patientId);
}
