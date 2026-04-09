# product-manager-toolkit reference

## Input/Output Examples

### RICE Prioritizer Example

**Input (features.csv):**
```csv
name,reach,impact,confidence,effort
Onboarding Flow,20000,massive,high,s
Search Improvements,15000,high,high,m
Social Login,12000,high,medium,m
Push Notifications,10000,massive,medium,m
Dark Mode,8000,medium,high,s
```

**Command:**
```bash
python scripts/rice_prioritizer.py features.csv --capacity 15
```

**Output:**
```
============================================================
RICE PRIORITIZATION RESULTS
============================================================

ðŸ“Š TOP PRIORITIZED FEATURES

1. Onboarding Flow
   RICE Score: 16000.0
   Reach: 20000 | Impact: massive | Confidence: high | Effort: s

2. Search Improvements
   RICE Score: 4800.0
   Reach: 15000 | Impact: high | Confidence: high | Effort: m

3. Social Login
   RICE Score: 3072.0
   Reach: 12000 | Impact: high | Confidence: medium | Effort: m

4. Push Notifications
   RICE Score: 3840.0
   Reach: 10000 | Impact: massive | Confidence: medium | Effort: m

5. Dark Mode
   RICE Score: 2133.33
   Reach: 8000 | Impact: medium | Confidence: high | Effort: s

ðŸ“ˆ PORTFOLIO ANALYSIS

Total Features: 5
Total Effort: 19 person-months
Total Reach: 65,000 users
Average RICE Score: 5969.07

ðŸŽ¯ Quick Wins: 2 features
   â€¢ Onboarding Flow (RICE: 16000.0)
   â€¢ Dark Mode (RICE: 2133.33)

ðŸš€ Big Bets: 0 features

ðŸ“… SUGGESTED ROADMAP

Q1 - Capacity: 11/15 person-months
   â€¢ Onboarding Flow (RICE: 16000.0)
   â€¢ Search Improvements (RICE: 4800.0)
   â€¢ Dark Mode (RICE: 2133.33)

Q2 - Capacity: 10/15 person-months
   â€¢ Push Notifications (RICE: 3840.0)
   â€¢ Social Login (RICE: 3072.0)
```

---

### Customer Interview Analyzer Example

**Input (interview.txt):**
```
Customer: Jane, Enterprise PM at TechCorp
Date: 2024-01-15

Interviewer: What's the hardest part of your current workflow?

Jane: The biggest frustration is the lack of real-time collaboration.
When I'm working on a PRD, I have to constantly ping my team on Slack
to get updates. It's really frustrating to wait for responses,
especially when we're on a tight deadline.

I've tried using Google Docs for collaboration, but it doesn't
integrate with our roadmap tools. I'd pay extra for something that
just worked seamlessly.

Interviewer: How often does this happen?

Jane: Literally every day. I probably waste 30 minutes just on
back-and-forth messages. It's my biggest pain point right now.
```

**Command:**
```bash
python scripts/customer_interview_analyzer.py interview.txt
```

**Output:**
```
============================================================
CUSTOMER INTERVIEW ANALYSIS
============================================================

ðŸ“‹ INTERVIEW METADATA
Segments found: 1
Lines analyzed: 15

ðŸ˜Ÿ PAIN POINTS (3 found)

1. [HIGH] Lack of real-time collaboration
   "I have to constantly ping my team on Slack to get updates"

2. [MEDIUM] Tool integration gaps
   "Google Docs...doesn't integrate with our roadmap tools"

3. [HIGH] Time wasted on communication
   "waste 30 minutes just on back-and-forth messages"

ðŸ’¡ FEATURE REQUESTS (2 found)

1. Real-time collaboration - Priority: High
2. Seamless tool integration - Priority: Medium

ðŸŽ¯ JOBS TO BE DONE

When working on PRDs with tight deadlines
I want real-time visibility into team updates
So I can avoid wasted time on status checks

ðŸ“Š SENTIMENT ANALYSIS

Overall: Negative (pain-focused interview)
Key emotions: Frustration, Time pressure

ðŸ’¬ KEY QUOTES

â€¢ "It's really frustrating to wait for responses"
â€¢ "I'd pay extra for something that just worked seamlessly"
â€¢ "It's my biggest pain point right now"

ðŸ·ï¸ THEMES

- Collaboration friction
- Tool fragmentation
- Time efficiency
```

---

