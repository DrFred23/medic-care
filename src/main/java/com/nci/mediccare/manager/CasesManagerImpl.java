package com.nci.mediccare.manager;

import com.nci.mediccare.domain.CaseInfo;
import com.nci.mediccare.mapper.CaseMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CasesManagerImpl implements CasesManager {

    @Resource
    private CaseMapper caseMapper;

    @Override
    public void deleteById(long id) {
        caseMapper.deleteById(id);
    }

    @Override
    public void insert(CaseInfo caseInfo) {
        caseMapper.insert(caseInfo);
    }

    @Override
    public void update(CaseInfo caseInfo) {
        caseMapper.update(caseInfo);
    }

    @Override
    public List<CaseInfo> selectAllCases() {
        return caseMapper.selectAllCases();
    }

    @Override
    public CaseInfo selectById(Long caseId) {
        return caseMapper.selectById(caseId);
    }

    @Override
    public List<CaseInfo> selectCasesByPatientId(long patientId) {
        return caseMapper.selectCasesByPatientId(patientId);
    }

    @Override
    public List<CaseInfo> selectCasesByPatientName(String patientName) {
        return caseMapper.selectCasesByPatientName(patientName);
    }
}
