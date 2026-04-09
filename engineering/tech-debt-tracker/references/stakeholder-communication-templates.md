# Stakeholder Communication Templates

## Introduction

Effective communication about technical debt is crucial for securing resources, setting expectations, and maintaining stakeholder trust. This document provides templates and guidelines for communicating technical debt status, impact, and recommendations to different stakeholder groups.

## Executive Summary Templates

### Monthly Executive Report

**Subject**: Technical Health Report - [Month] [Year]

---

**EXECUTIVE SUMMARY**

**Overall Status**: [EXCELLENT/GOOD/FAIR/POOR] - Health Score: [X]/100

**Key Message**: [One sentence summary of current state and trend]

**Immediate Actions Required**: [Yes/No] - [Brief explanation if yes]

---

**BUSINESS IMPACT**

â€¢ **Development Velocity**: [X]% impact on feature delivery speed
â€¢ **Quality Risk**: [LOW/MEDIUM/HIGH] - [Brief explanation]
â€¢ **Security Posture**: [X] critical issues, [X] high-priority issues
â€¢ **Customer Impact**: [Direct customer-facing implications]

**FINANCIAL IMPLICATIONS**

â€¢ **Current Cost**: $[X]K monthly in reduced velocity
â€¢ **Investment Needed**: $[X]K for critical issues (next quarter)
â€¢ **ROI Projection**: [X]% velocity improvement, $[X]K annual savings
â€¢ **Risk Cost**: Up to $[X]K if critical issues materialize

**STRATEGIC RECOMMENDATIONS**

1. **[Priority 1]**: [Action] - [Business justification] - [Timeline]
2. **[Priority 2]**: [Action] - [Business justification] - [Timeline]  
3. **[Priority 3]**: [Action] - [Business justification] - [Timeline]

**TREND ANALYSIS**

â€¢ Health Score: [Previous] â†’ [Current] ([Improving/Declining/Stable])
â€¢ Debt Items: [Previous] â†’ [Current] ([Net change])
â€¢ High-Priority Issues: [Previous] â†’ [Current]

---

**NEXT STEPS**

â€¢ **This Quarter**: [Key initiatives and expected outcomes]
â€¢ **Resource Request**: [Additional resources needed, if any]
â€¢ **Dependencies**: [External dependencies or blockers]

---

### Quarterly Board-Level Report

**Subject**: Technical Debt & Engineering Health - Q[X] [Year]

---

**KEY METRICS**

| Metric | Current | Target | Trend |
|--------|---------|--------|--------|
| Health Score | [X]/100 | [X]/100 | [â†‘/â†“/â†’] |
| Velocity Impact | [X]% | <[X]% | [â†‘/â†“/â†’] |
| Critical Issues | [X] | 0 | [â†‘/â†“/â†’] |
| Security Risk | [LOW/MED/HIGH] | LOW | [â†‘/â†“/â†’] |

**STRATEGIC CONTEXT**

Technical debt represents deferred investment in our technology platform. Our current debt portfolio has [positive/negative/neutral] implications for:

â€¢ **Growth Capacity**: [Impact on ability to scale]
â€¢ **Competitive Position**: [Impact on market responsiveness]  
â€¢ **Risk Profile**: [Impact on operational risk]
â€¢ **Team Retention**: [Impact on engineering talent]

**INVESTMENT ANALYSIS**

â€¢ **Current Annual Cost**: $[X]M in reduced productivity
â€¢ **Proposed Investment**: $[X]M over [timeframe]
â€¢ **Expected ROI**: [X]% productivity improvement, $[X]M NPV
â€¢ **Risk Mitigation**: $[X]M in avoided incident costs

**RECOMMENDATIONS**

1. **[Immediate]**: [Strategic action with business rationale]
2. **[This Year]**: [Medium-term initiative with expected outcomes]
3. **[Ongoing]**: [Process or cultural change needed]

---

## Product Management Templates

### Sprint Planning Discussion

**Subject**: Tech Debt Impact on Sprint [X] Planning

---

**SPRINT CAPACITY IMPACT**

**Affected User Stories**:
â€¢ [Story 1]: [X] point increase due to [debt issue]
â€¢ [Story 2]: [X]% risk of scope reduction due to [debt issue]
â€¢ [Story 3]: Blocked by [debt issue] - requires [X] points of debt work first

**Recommended Debt Work This Sprint**:
â€¢ **[Debt Item 1]** ([X] points): Unblocks [Story Y], reduces future story complexity
â€¢ **[Debt Item 2]** ([X] points): Prevents [specific risk] in upcoming features

**Trade-off Analysis**:
â€¢ **If we fix debt**: [X] points for features, [benefits for future sprints]
â€¢ **If we don't fix debt**: [X] points for features, [accumulated costs and risks]

**Recommendation**: [Specific allocation suggestion with rationale]

---

### Feature Impact Assessment

**Subject**: Technical Debt Impact Assessment - [Feature Name]

---

**DEBT AFFECTING THIS FEATURE**

| Debt Item | Impact | Effort to Fix | Recommendation |
|-----------|--------|---------------|----------------|
| [Item 1] | [Description] | [X] points | Fix before/Work around/Accept |
| [Item 2] | [Description] | [X] points | Fix before/Work around/Accept |

**DELIVERY IMPACT**

â€¢ **Timeline Risk**: [LOW/MEDIUM/HIGH]
  - Base estimate: [X] points
  - Debt-adjusted estimate: [X] points ([X]% increase)
  - Risk factors: [Specific risks and probabilities]

â€¢ **Quality Risk**: [LOW/MEDIUM/HIGH]
  - [Specific quality concerns from debt]
  - Mitigation strategies: [Options for reducing risk]

â€¢ **Future Feature Impact**:  
  - This feature will [add to/reduce/not affect] debt burden
  - Related future features will be [easier/harder/unaffected]

**RECOMMENDATIONS**

1. **[Option 1]**: [Approach with pros/cons]
2. **[Option 2]**: [Alternative approach with trade-offs]
3. **Recommended**: [Chosen approach with justification]

---

## Engineering Team Templates

### Team Health Check

**Subject**: Weekly Team Health Check - [Date]

---

**DEBT BURDEN THIS WEEK**

â€¢ **New Debt Identified**: [X] items ([categories])
â€¢ **Debt Resolved**: [X] items ([X] hours saved)  
â€¢ **Net Change**: [Positive/Negative] [X] items
â€¢ **Top Pain Points**: [Developer-reported friction areas]

**VELOCITY IMPACT**

â€¢ **Stories Affected by Debt**: [X] of [Y] planned stories
â€¢ **Estimated Overhead**: [X] hours of extra work due to debt
â€¢ **Blocked Work**: [Any stories waiting on debt resolution]

**TEAM SENTIMENT**

â€¢ **Frustration Level**: [1-5 scale] ([trend])
â€¢ **Confidence in Codebase**: [1-5 scale] ([trend])  
â€¢ **Top Complaints**: [Most common developer concerns]

**ACTIONS THIS WEEK**

â€¢ **Debt Work Planned**: [Specific items and assignees]
â€¢ **Prevention Measures**: [Process improvements or reviews]
â€¢ **Escalations**: [Issues needing management attention]

---

### Architecture Decision Record (ADR) Template

**Subject**: ADR-[XXX]: [Decision Title] - Technical Debt Consideration

---

**Status**: [Proposed/Accepted/Deprecated]
**Date**: [YYYY-MM-DD]
**Decision Makers**: [Names]

**CONTEXT**

[Background and current situation]

**TECHNICAL DEBT ANALYSIS**

â€¢ **Debt Created by This Decision**:
  - [Specific debt that will be introduced]
  - [Estimated effort to resolve later: X points]
  - [Interest rate: impact over time]

â€¢ **Debt Resolved by This Decision**:
  - [Existing debt this addresses]
  - [Estimated effort saved: X points]
  - [Risk reduction achieved]

â€¢ **Net Debt Impact**: [Positive/Negative/Neutral]

**DECISION**

[What we decided to do]

**RATIONALE**

[Why we made this decision, including debt trade-offs]

**DEBT MANAGEMENT PLAN**

â€¢ **Monitoring**: [How we'll track the debt introduced]
â€¢ **Timeline**: [When we plan to address the debt]
â€¢ **Success Criteria**: [How we'll know it's time to pay down the debt]

**CONSEQUENCES**

[Expected outcomes, including debt implications]

---

## Customer-Facing Templates

### Release Notes - Quality Improvements

**Subject**: Platform Stability and Performance Improvements - Release [X.Y]

---

**QUALITY IMPROVEMENTS**

We've invested significant effort in improving the reliability and performance of our platform. While these changes aren't feature additions, they provide important benefits:

**RELIABILITY ENHANCEMENTS**

â€¢ **Reduced Error Rates**: [X]% fewer errors in [specific area]
â€¢ **Improved Uptime**: [X]% improvement in system availability
â€¢ **Faster Recovery**: [X]% faster recovery from service interruptions

**PERFORMANCE IMPROVEMENTS**

â€¢ **Page Load Speed**: [X]% faster loading for [specific features]
â€¢ **API Response Time**: [X]% improvement in response times
â€¢ **Resource Usage**: [X]% reduction in memory/CPU usage

**SECURITY STRENGTHENING**

â€¢ **Vulnerability Resolution**: Addressed [X] security findings
â€¢ **Authentication Improvements**: Enhanced login security and reliability
â€¢ **Data Protection**: Improved data encryption and access controls

**WHAT THIS MEANS FOR YOU**

â€¢ **Better User Experience**: Fewer interruptions, faster responses
â€¢ **Increased Reliability**: Less downtime, more predictable performance
â€¢ **Enhanced Security**: Your data is better protected

We continue to balance new feature development with platform investments to ensure a reliable, secure, and performant experience.

---

### Service Incident Communication

**Subject**: Service Update - [Brief Description] - [Status]

---

**INCIDENT SUMMARY**

â€¢ **Impact**: [Description of customer impact]
â€¢ **Duration**: [Start time] - [End time / Ongoing]
â€¢ **Root Cause**: [High-level, customer-appropriate explanation]
â€¢ **Resolution**: [What was done to fix it]

**TECHNICAL DEBT CONNECTION**

This incident was [directly caused by / contributed to by / unrelated to] technical debt in our system. Specifically:

â€¢ **Contributing Factors**: [How debt played a role, if any]
â€¢ **Prevention Measures**: [Debt work planned to prevent recurrence]
â€¢ **Timeline**: [When preventive measures will be completed]

**IMMEDIATE ACTIONS**

1. [Action 1 with timeline]
2. [Action 2 with timeline]  
3. [Action 3 with timeline]

**LONG-TERM IMPROVEMENTS**

We're investing in [specific technical improvements] to prevent similar issues:

â€¢ **Infrastructure**: [Relevant infrastructure debt work]
â€¢ **Monitoring**: [Observability improvements planned]
â€¢ **Process**: [Development process improvements]

We apologize for the inconvenience and appreciate your patience as we continue to strengthen our platform.

---

## Internal Communication Templates

### Engineering All-Hands Presentation

**Slide Template: Technical Debt State of the Union**

---

**SLIDE 1: Current State**
- Health Score: [X]/100 [Trend arrow]
- Total Debt Items: [X] ([X]% of codebase)
- High Priority: [X] items requiring immediate attention
- Team Impact: [X]% velocity reduction

**SLIDE 2: What We've Accomplished**  
- Resolved [X] debt items ([X] hours of future work saved)
- Improved health score by [X] points
- Key wins: [2-3 specific examples with business impact]

**SLIDE 3: Current Focus Areas**
- [Category 1]: [X] items, [business impact]
- [Category 2]: [X] items, [business impact]  
- [Category 3]: [X] items, [business impact]

**SLIDE 4: Success Stories**
- [Specific example]: [Problem] â†’ [Solution] â†’ [Outcome]
- Metrics: [Before/after comparison]
- Team feedback: [Developer quotes]

**SLIDE 5: Looking Forward**
- Q[X] Goals: [Specific targets]
- Major Initiatives: [2-3 big-picture improvements]
- How You Can Help: [Specific asks of the team]

---

### Retrospective Templates

**Sprint Retrospective - Debt Focus**

**What Went Well**:
â€¢ Debt work completed: [Specific items and impact]
â€¢ Process improvements: [What worked for debt management]
â€¢ Team collaboration: [Cross-functional debt work successes]

**What Didn't Go Well**:
â€¢ Debt work challenges: [Obstacles encountered]
â€¢ Scope creep: [Debt work that expanded beyond estimates]
â€¢ Communication gaps: [Information that wasn't shared effectively]

**Action Items**:
â€¢ **Process**: [Changes to how we handle debt work]
â€¢ **Planning**: [Improvements to debt estimation/prioritization]  
â€¢ **Prevention**: [Changes to prevent new debt creation]
â€¢ **Tools**: [Tooling improvements needed]

---

## Communication Best Practices

### Do's and Don'ts

**DO**:
â€¢ Use business language, not technical jargon
â€¢ Quantify impact with specific metrics
â€¢ Provide clear timelines and expectations
â€¢ Acknowledge trade-offs and constraints
â€¢ Connect debt work to business outcomes
â€¢ Be proactive in communication

**DON'T**:
â€¢ Blame previous decisions or developers
â€¢ Use fear-based messaging exclusively
â€¢ Overwhelm stakeholders with technical details
â€¢ Make promises without clear plans
â€¢ Ignore the business context
â€¢ Assume stakeholders understand technical implications

### Tailoring Messages

**For Executives**: Focus on business impact, ROI, and strategic implications
**For Product**: Focus on feature impact, timeline risks, and user experience
**For Engineering**: Focus on technical details, process improvements, and developer experience
**For Customers**: Focus on reliability, performance, and security benefits

### Frequency Guidelines

**Real-time**: Critical security issues, production incidents
**Weekly**: Team health checks, sprint impacts  
**Monthly**: Stakeholder updates, trend analysis
**Quarterly**: Strategic reviews, investment planning
**As-needed**: Major decisions, significant changes

These templates should be customized for your organization's communication style, stakeholder preferences, and business context.
