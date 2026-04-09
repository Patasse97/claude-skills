# Technical Documentation Templates

MDR Annex II and III technical file structure and content requirements.

---

## Table of Contents

- [Technical Documentation Overview](#technical-documentation-overview)
- [Annex II Requirements](#annex-ii-requirements)
- [Annex III Additions](#annex-iii-additions)
- [Document Templates](#document-templates)
- [Notified Body Expectations](#notified-body-expectations)

---

## Technical Documentation Overview

### Documentation Hierarchy

```
TECHNICAL DOCUMENTATION
â”œâ”€â”€ Device Description and Specification
â”œâ”€â”€ Information Supplied by Manufacturer
â”œâ”€â”€ Design and Manufacturing Information
â”œâ”€â”€ General Safety and Performance Requirements
â”œâ”€â”€ Benefit-Risk Analysis
â”œâ”€â”€ Product Verification and Validation
â”œâ”€â”€ Clinical Evaluation Report
â””â”€â”€ Post-Market Surveillance Documentation
```

### Documentation by Phase

| Phase | Required Documents |
|-------|-------------------|
| Design Input | User needs, design requirements, regulatory requirements |
| Design Development | Design specifications, drawings, BOM, software docs |
| Verification | Test protocols, test reports, design review records |
| Validation | Clinical data, usability data, biocompatibility |
| Transfer | Manufacturing specs, process validations |
| Post-Market | PMS plan, PMCF plan, vigilance procedures |

---

## Annex II Requirements

### Section 1: Device Description and Specification

**1.1 Device Identification**

```
DEVICE IDENTIFICATION
â”œâ”€â”€ Trade name(s)
â”œâ”€â”€ General description of the device
â”œâ”€â”€ Basic UDI-DI
â”œâ”€â”€ Device identifier codes (internal + regulatory)
â”œâ”€â”€ Intended purpose statement
â”œâ”€â”€ Indications for use
â”œâ”€â”€ Contraindications
â”œâ”€â”€ Target population (patient, user)
â”œâ”€â”€ Medical conditions intended to diagnose/treat
â””â”€â”€ Principles of operation
```

**1.2 Device Variants and Accessories**

| Element | Description |
|---------|-------------|
| Variant listing | All variants with identifiers |
| Configuration differences | Technical differences by variant |
| Accessories | Separate devices used together |
| Spare parts | Replaceable components |

**1.3 Reference to Previous Generations**

- Previous generation device identification
- Key modifications summary
- Clinical experience from prior device
- Justification for changes

### Section 2: Information Supplied by Manufacturer

**2.1 Label Requirements**

Mandatory label elements per Article 13:

- [ ] Device name or trade name
- [ ] Manufacturer name and address
- [ ] Authorized representative (if applicable)
- [ ] Lot/batch number or serial number
- [ ] UDI carrier (AIDC + HRI)
- [ ] Expiration date (if applicable)
- [ ] Storage/handling conditions
- [ ] Warnings and precautions
- [ ] CE mark with NB number (if applicable)
- [ ] Symbol meanings per EN ISO 15223-1

**2.2 Instructions for Use**

IFU structure:

```
INSTRUCTIONS FOR USE
â”œâ”€â”€ 1. Device Description
â”‚   â”œâ”€â”€ Intended purpose
â”‚   â”œâ”€â”€ Indications and contraindications
â”‚   â””â”€â”€ Principle of operation
â”œâ”€â”€ 2. Warnings and Precautions
â”‚   â”œâ”€â”€ Contraindicated uses
â”‚   â”œâ”€â”€ Potential complications
â”‚   â””â”€â”€ Drug/device interactions
â”œâ”€â”€ 3. User Instructions
â”‚   â”œâ”€â”€ Unpacking and inspection
â”‚   â”œâ”€â”€ Setup/installation
â”‚   â”œâ”€â”€ Operating procedures
â”‚   â””â”€â”€ Cleaning/maintenance
â”œâ”€â”€ 4. Technical Specifications
â”‚   â”œâ”€â”€ Physical characteristics
â”‚   â”œâ”€â”€ Performance characteristics
â”‚   â””â”€â”€ Environmental limits
â”œâ”€â”€ 5. Troubleshooting
â”‚   â”œâ”€â”€ Error codes/messages
â”‚   â””â”€â”€ Corrective actions
â””â”€â”€ 6. Symbols Glossary
```

### Section 3: Design and Manufacturing Information

**3.1 Design Process Documentation**

| Document | Purpose |
|----------|---------|
| Design input | User needs, regulatory requirements |
| Design output | Specifications, drawings, software |
| Design review | Review records at key milestones |
| Design verification | Test protocols and results |
| Design validation | Clinical/usability evidence |
| Design transfer | Manufacturing readiness |
| Design changes | Change control records |

**3.2 Manufacturing Process Description**

```
MANUFACTURING DOCUMENTATION
â”œâ”€â”€ Process flow diagram
â”œâ”€â”€ Manufacturing specifications
â”œâ”€â”€ Facility and equipment qualification
â”œâ”€â”€ Process validation protocols/reports
â”œâ”€â”€ Environmental monitoring
â”œâ”€â”€ Personnel training records
â”œâ”€â”€ In-process controls
â”œâ”€â”€ Final inspection/testing
â”œâ”€â”€ Sterilization validation (if applicable)
â””â”€â”€ Packaging validation
```

**3.3 Supplier and Subcontractor Information**

- Approved supplier list
- Supplier qualification records
- Critical component specifications
- Incoming inspection procedures
- Supplier audit records

### Section 4: General Safety and Performance Requirements

**GSPR Compliance Checklist**

| GSPR | Requirement | Evidence |
|------|-------------|----------|
| 1 | Safe design for intended use | Risk management file |
| 2 | Risk acceptable when weighed against benefits | Benefit-risk analysis |
| 3 | State of the art design | Literature review, standards |
| 4 | No compromise of clinical condition | Clinical evaluation |
| 5 | Transport and storage conditions | Shelf life testing |
| 6 | Acceptable undesirable effects | Risk-benefit analysis |
| 7 | CE marking conformity | Declaration of conformity |
| ... | Continue for all applicable GSPRs | |

**GSPR Matrix Template**

| GSPR # | Requirement Summary | Applicable? | Evidence Document | Status |
|--------|---------------------|-------------|-------------------|--------|
| 10.1 | Chemical properties | Yes/No/NA | Biocompatibility report | Complete |
| 10.2 | Infection risk | Yes/No/NA | Sterilization validation | Complete |
| 10.3 | Substances with carcinogenic risk | Yes/No/NA | Material specification | Complete |

### Section 5: Benefit-Risk Analysis

**Benefit-Risk Documentation**

```
BENEFIT-RISK ANALYSIS
â”œâ”€â”€ 1. Intended Benefits
â”‚   â”œâ”€â”€ Direct therapeutic benefits
â”‚   â”œâ”€â”€ Diagnostic accuracy improvements
â”‚   â””â”€â”€ Patient outcome benefits
â”œâ”€â”€ 2. Known Risks
â”‚   â”œâ”€â”€ Identified hazards (from risk analysis)
â”‚   â”œâ”€â”€ Risk control measures implemented
â”‚   â””â”€â”€ Residual risks
â”œâ”€â”€ 3. Benefit-Risk Determination
â”‚   â”œâ”€â”€ Qualitative analysis
â”‚   â”œâ”€â”€ Quantitative analysis (if available)
â”‚   â””â”€â”€ Comparison to alternatives
â””â”€â”€ 4. Conclusion
    â”œâ”€â”€ Acceptability statement
    â””â”€â”€ Justification for residual risks
```

### Section 6: Product Verification and Validation

**6.1 Verification Testing**

| Test Category | Standards | Documentation |
|---------------|-----------|---------------|
| Electrical safety | IEC 60601-1 | Test protocol + report |
| EMC | IEC 60601-1-2 | EMC test report |
| Biocompatibility | ISO 10993 series | Biocompatibility evaluation |
| Software | IEC 62304 | Software verification report |
| Sterilization | ISO 11135/11137 | Sterility assurance |
| Packaging | ISO 11607 | Packaging validation |
| Shelf life | Accelerated aging | Stability study report |
| Usability | IEC 62366-1 | Usability engineering file |

**6.2 Validation Evidence**

- Clinical investigation data
- Literature-based clinical evidence
- Simulated use testing
- User feedback/complaint analysis
- Post-market surveillance data

---

## Annex III Additions

### Class III Specific Requirements

Additional documentation for Class III devices:

**Implant-Specific Requirements**

- Implant card information
- Patient information leaflet
- Device tracking procedures
- Explant analysis capability

**Drug-Device Combination**

- Drug substance specification
- Drug compatibility testing
- Combined product assessment
- Pharmacovigilance interface

---

## Document Templates

### Design History File Index

```
DESIGN HISTORY FILE (DHF)
Document ID: DHF-[Product]-[Rev]

1. DESIGN INPUT
   1.1 User Requirements Specification (URS)
   1.2 Regulatory Requirements Matrix
   1.3 Design Input Review Record

2. DESIGN OUTPUT
   2.1 Product Specification
   2.2 Engineering Drawings
   2.3 Bill of Materials
   2.4 Software Documentation

3. DESIGN VERIFICATION
   3.1 Verification Test Plan
   3.2 Verification Test Reports
   3.3 Traceability Matrix

4. DESIGN VALIDATION
   4.1 Clinical Evaluation Report
   4.2 Usability Engineering File
   4.3 Biocompatibility Evaluation

5. DESIGN TRANSFER
   5.1 Manufacturing Procedures
   5.2 Process Validation Reports
   5.3 Supplier Qualification

6. DESIGN REVIEWS
   6.1 Design Review Records
   6.2 Risk Management Review
   6.3 Final Design Release
```

### Declaration of Conformity Template

```
EU DECLARATION OF CONFORMITY

We, [Manufacturer Name]
Address: [Full address]

declare under our sole responsibility that the device:

Device name: [Trade name]
Device description: [Description]
Basic UDI-DI: [UDI-DI]
Classification: [Class I/IIa/IIb/III]

is in conformity with the provisions of:
- Regulation (EU) 2017/745

Applicable standards:
- [List harmonized standards]

Notified Body: [NB name and number] (if applicable)
Certificate number: [Certificate number]

Place and date: [Location, Date]
Signature: [Authorized signatory]
Name and function: [Name, Title]
```

---

## Notified Body Expectations

### Common NB Findings

| Finding Area | Common Issue | Prevention |
|--------------|--------------|------------|
| GSPR matrix | Incomplete, no evidence links | Complete matrix with references |
| Risk management | Not integrated with design | Update throughout development |
| Clinical evaluation | Insufficient literature search | Systematic search with PICO |
| IFU | Missing warnings | Risk-based IFU content |
| Traceability | Design to requirements gaps | Maintain traceability matrix |

### Pre-Submission Checklist

Before Notified Body submission:

- [ ] Technical documentation complete
- [ ] GSPR checklist fully addressed
- [ ] Risk management file current
- [ ] Clinical evaluation report complete
- [ ] QMS documentation ready
- [ ] Design verification complete
- [ ] Design validation complete
- [ ] Labeling and IFU finalized
- [ ] Declaration of conformity prepared
- [ ] **Validation:** Internal review completed

