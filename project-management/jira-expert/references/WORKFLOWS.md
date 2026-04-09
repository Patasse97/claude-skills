# Jira Workflows Reference

Comprehensive guide to Jira workflow design, transitions, conditions, validators, and post-functions.

## Default Workflows

### Simplified Workflow
```
Open â†’ In Progress â†’ Done
```

### Software Development Workflow
```
Backlog â†’ Selected for Development â†’ In Progress â†’ In Review â†’ Done
         â†‘___________________________|  (reopen)
```

### Bug Tracking Workflow
```
Open â†’ In Progress â†’ Fixed â†’ Verified â†’ Closed
  â†‘                    |        |
  |____Reopened________|________|
```

## Custom Workflow Design

### Design Principles
1. **Mirror your actual process** â€” don't force teams into artificial states
2. **Minimize statuses** â€” each status must represent a distinct work state where the item waits for a different action
3. **Clear ownership** â€” every status should have an obvious responsible party
4. **Allow rework** â€” always provide paths back for rejected/reopened items
5. **Separate "waiting" from "working"** â€” distinguish "In Review" (waiting) from "Reviewing" (actively working)

### Status Categories
Jira maps every status to one of four categories that drive board columns and JQL:

| Category | Meaning | JQL | Examples |
|----------|---------|-----|----------|
| `To Do` | Not started | `statusCategory = "To Do"` | Backlog, Open, New |
| `In Progress` | Active work | `statusCategory = "In Progress"` | In Progress, In Review, Testing |
| `Done` | Completed | `statusCategory = Done` | Done, Closed, Released |
| `Undefined` | Legacy/unused | â€” | Avoid using |

### Recommended Statuses by Team Type

**Engineering Team:**
```
Backlog â†’ Ready â†’ In Progress â†’ Code Review â†’ QA â†’ Done
```

**Support Team:**
```
New â†’ Triaged â†’ In Progress â†’ Waiting on Customer â†’ Resolved â†’ Closed
```

**Design Team:**
```
Backlog â†’ Research â†’ Design â†’ Review â†’ Approved â†’ Handoff
```

## Transitions

### Transition Properties

| Property | Description |
|----------|-------------|
| **Name** | Display name on the button (e.g., "Start Work") |
| **Screen** | Form shown during transition (optional) |
| **Conditions** | Who can trigger this transition |
| **Validators** | Rules that must pass before transition executes |
| **Post-functions** | Actions executed after transition completes |

### Common Transition Patterns

**Start Work:**
```
Trigger: "Start Work" button
Condition: Assignee only
Validator: Issue must have assignee
Post-function: Set "In Progress" resolution to None
```

**Submit for Review:**
```
Trigger: "Submit for Review" button
Condition: Assignee or project admin
Validator: All sub-tasks must be Done
Post-function: Add comment "Submitted for review by {user}"
```

**Approve:**
```
Trigger: "Approve" button
Condition: Must be in "Reviewers" group
Validator: Must add comment
Post-function: Set resolution to "Done", fire event
```

## Conditions

### Built-in Conditions

| Condition | Use When |
|-----------|----------|
| **Only Assignee** | Only assigned user can transition |
| **Only Reporter** | Only creator can transition |
| **Permission Condition** | User must have specific permission |
| **Group Condition** | User must be in specified group |
| **Sub-Task Blocking** | All sub-tasks must be resolved |
| **Previous Status** | Issue must have been in a specific status |
| **User Is In Role** | User must have project role (Developer, Admin) |

### Combining Conditions
- **AND logic**: Add multiple conditions to one transition â€” ALL must pass
- **OR logic**: Create parallel transitions with different conditions

## Validators

### Built-in Validators

| Validator | Checks |
|-----------|--------|
| **Required Field** | Specific field must be populated |
| **Field Has Been Modified** | Field must change during transition |
| **Regular Expression** | Field must match regex pattern |
| **Permission Validator** | User must have permission |
| **Previous Status Validator** | Issue was in a required status |

### Common Validator Patterns

```
# Require comment on rejection
Validator: Comment Required
When: Transition = "Reject"

# Require fix version before release
Validator: Required Field = "Fix Version/s"
When: Transition = "Release"

# Require time logged before closing
Validator: Field Required = "Time Spent" (must be > 0)
When: Transition = "Close"
```

## Post-Functions

### Built-in Post-Functions

| Post-Function | Action |
|---------------|--------|
| **Set Field Value** | Assign a value to any field |
| **Update Issue Field** | Change assignee, priority, etc. |
| **Create Comment** | Add automated comment |
| **Fire Event** | Trigger notification event |
| **Assign to Lead** | Assign to project lead |
| **Assign to Reporter** | Assign back to creator |
| **Clear Field** | Remove field value |
| **Copy Value** | Copy field from parent/linked issue |

### Post-Function Execution Order
Post-functions execute in defined order. Standard sequence:
1. Set issue status (automatic, always first)
2. Add comment (if configured)
3. Update fields
4. Generate change history (automatic, always last)
5. Fire event (triggers notifications)

**Important:** "Generate change history" and "Fire event" must always be last â€” reorder if you add custom post-functions.

## Workflow Schemes

### What They Do
- Map issue types to workflows within a project
- One workflow scheme per project
- Different issue types can use different workflows

### Configuration Pattern
```
Project: MYPROJ
Workflow Scheme: "Engineering Workflow Scheme"

  Bug         â†’ Bug Tracking Workflow
  Story       â†’ Development Workflow
  Task        â†’ Simple Workflow
  Epic        â†’ Epic Workflow
  Sub-task    â†’ Sub-task Workflow (inherits parent transitions)
```

## Best Practices

1. **Start simple, add complexity only when needed** â€” a 5-status workflow beats a 15-status one
2. **Name transitions as actions** â€” "Start Work" not "In Progress" (the status is "In Progress", the action is "Start Work")
3. **Use screens sparingly** â€” only show a screen when you need data from the user during transition
4. **Test with real users** â€” workflows that look good on paper may confuse the team
5. **Document your workflow** â€” add descriptions to statuses and transitions
6. **Use global transitions carefully** â€” a "Cancel" transition from any status is convenient but can bypass important gates
7. **Audit quarterly** â€” remove statuses with <5% usage

