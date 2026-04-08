# Requirements Document Preparation Guide

## Overview

This guide walks you through transforming your vision, user inputs, and memory into a structured requirements document. Follow this process to create requirements.md that serves as the foundation for the spec workflow pipeline.

**Part of the Enhanced Spec Workflow Pipeline**: **Requirements** → Customization → Design → Tasks → Development

This document defines what needs to be built and why.

---

## Quick Start: What Type of Requirement?

Before diving in, determine what you're documenting:

### Feature Requirements (New Functionality)
**Use when**: Building something new that doesn't exist yet
**Time**: 1-3 hours
**Focus**: User needs, business value, acceptance criteria
**Example**: User authentication, payment processing, search functionality

### Bugfix Requirements (Fixing Broken Behavior)
**Use when**: Something is broken, crashing, or behaving incorrectly
**Time**: 30-60 minutes
**Focus**: Bug condition, expected vs actual behavior, reproduction steps
**Example**: App crashes on zero quantity, login fails on mobile, data loss on refresh

### Enhancement Requirements (Improving Existing Features)
**Use when**: Making existing functionality better
**Time**: 1-2 hours
**Focus**: Current limitations, proposed improvements, backward compatibility
**Example**: Faster search, better error messages, improved accessibility

---

## Prerequisites

Before starting your requirements document, gather:
- ✅ Clear understanding of the problem you're solving
- ✅ Knowledge of who will use this feature (user personas)
- ✅ Context about existing system constraints
- ✅ Access to user feedback, bug reports, or feature requests
- ✅ Understanding of business goals and success metrics

---

## Universal Requirements Document Structure

Your requirements.md should contain these sections:

### 1. Problem Statement - **ALWAYS REQUIRED**
### 2. User Stories - **ALWAYS REQUIRED**
### 3. Acceptance Criteria - **ALWAYS REQUIRED**
### 4. Correctness Properties - **ALWAYS REQUIRED**
### 5. Constraints & Assumptions - **REQUIRED for complex features**
### 6. Success Metrics - **REQUIRED for business-critical features**

---

## Section 1: Problem Statement (ALWAYS REQUIRED)

### Purpose
Clearly articulate the problem you're solving and why it matters.

### What to Include
- **Current Situation**: What's happening now (or not happening)?
- **Pain Points**: What problems does this cause?
- **Impact**: Who is affected and how?
- **Opportunity**: What becomes possible when this is solved?

### How to Write It

```markdown
## Problem Statement

### Current Situation
[Describe the current state - what exists or doesn't exist today]

### Pain Points
- Pain point 1: [Specific problem users face]
- Pain point 2: [Another problem]
- Pain point 3: [Another problem]

### Impact
- **Users affected**: [Who experiences this problem?]
- **Frequency**: [How often does this occur?]
- **Severity**: [How bad is it when it happens?]

### Opportunity
[What value is unlocked by solving this? What becomes possible?]
```

### Example (Feature)

```markdown
## Problem Statement

### Current Situation
Users must manually copy-paste data between the dashboard and reports. There's no 
automated way to export filtered data or schedule recurring reports.

### Pain Points
- Users spend 2-3 hours per week manually creating reports
- Copy-paste errors lead to incorrect data in presentations
- No historical tracking of report data over time
- Cannot share reports with stakeholders who lack dashboard access

### Impact
- **Users affected**: 500+ active users (80% of user base)
- **Frequency**: Daily for power users, weekly for most users
- **Severity**: High - blocks critical business workflows

### Opportunity
Automated reporting saves 2-3 hours per user per week (1,000-1,500 hours/week total),
reduces errors, enables data-driven decision making, and improves stakeholder communication.
```

### Example (Bugfix)

```markdown
## Problem Statement

### Current Situation
The shopping cart crashes when users try to update quantity to zero. The app shows
a white screen and requires a full page refresh to recover.

### Pain Points
- Users lose their entire cart contents when the crash occurs
- No way to remove items except by reducing quantity to zero
- Error message is not helpful ("Something went wrong")
- Happens on both web and mobile

### Impact
- **Users affected**: ~50 users per day encounter this
- **Frequency**: Occurs every time quantity is set to zero
- **Severity**: Critical - causes data loss and poor user experience

### Opportunity
Fixing this bug prevents cart abandonment, reduces support tickets (currently 10-15/day),
and improves user trust in the platform.
```

---

## Section 2: User Stories (ALWAYS REQUIRED)

### Purpose
Describe what users need to accomplish and why, from their perspective.

### Format
Use the standard user story format:
```
As a [user type],
I want to [action/capability],
So that [benefit/value].
```

### What to Include
- **Primary user stories**: Core functionality (3-7 stories)
- **Edge case stories**: Less common but important scenarios (2-5 stories)
- **Admin/system stories**: Backend or operational needs (1-3 stories)

### How to Write It

```markdown
## User Stories

### Primary User Stories

#### US-1: [Short title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].

**Priority**: High/Medium/Low
**Complexity**: High/Medium/Low

#### US-2: [Short title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].

**Priority**: High/Medium/Low
**Complexity**: High/Medium/Low

### Edge Case Stories

#### US-E1: [Short title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].

**Priority**: Medium/Low
**Complexity**: High/Medium/Low

### System Stories

#### US-S1: [Short title]
**As a** [system/admin],
**I want to** [action],
**So that** [benefit].

**Priority**: High/Medium/Low
**Complexity**: High/Medium/Low
```

### Example (Feature)

```markdown
## User Stories

### Primary User Stories

#### US-1: Export Filtered Data
**As a** data analyst,
**I want to** export my current dashboard view as CSV/Excel,
**So that** I can use the data in presentations and external tools.

**Priority**: High
**Complexity**: Medium

#### US-2: Schedule Recurring Reports
**As a** team lead,
**I want to** schedule weekly reports to be emailed automatically,
**So that** my team stays informed without manual effort.

**Priority**: High
**Complexity**: High

#### US-3: Share Report Links
**As a** manager,
**I want to** generate shareable links to reports,
**So that** stakeholders can view data without dashboard access.

**Priority**: Medium
**Complexity**: Medium

### Edge Case Stories

#### US-E1: Handle Large Exports
**As a** power user,
**I want to** export datasets with 100K+ rows,
**So that** I can analyze complete historical data.

**Priority**: Medium
**Complexity**: High

#### US-E2: Cancel Scheduled Reports
**As a** user,
**I want to** pause or cancel scheduled reports,
**So that** I don't receive reports when I'm on vacation.

**Priority**: Low
**Complexity**: Low

### System Stories

#### US-S1: Monitor Export Performance
**As a** system administrator,
**I want to** track export job performance and failures,
**So that** I can optimize system resources and troubleshoot issues.

**Priority**: Medium
**Complexity**: Medium
```

### Example (Bugfix)

```markdown
## User Stories

### Primary User Stories

#### US-1: Remove Cart Items Safely
**As a** shopper,
**I want to** remove items from my cart without the app crashing,
**So that** I can adjust my order before checkout.

**Priority**: Critical
**Complexity**: Low

#### US-2: Recover from Errors Gracefully
**As a** shopper,
**I want to** see helpful error messages when something goes wrong,
**So that** I know what happened and how to fix it.

**Priority**: High
**Complexity**: Low

### Edge Case Stories

#### US-E1: Handle Zero Quantity Edge Case
**As a** shopper,
**I want to** set quantity to zero as an alternative to removing items,
**So that** I have flexibility in how I manage my cart.

**Priority**: Medium
**Complexity**: Low
```

---

## Section 3: Acceptance Criteria (ALWAYS REQUIRED)

### Purpose
Define specific, testable conditions that must be met for each user story to be considered complete.

### Format
Use the Given-When-Then format for clarity:
```
Given [initial context/state],
When [action occurs],
Then [expected outcome].
```

### What to Include
- **Happy path criteria**: Normal, expected behavior (3-5 per story)
- **Error handling criteria**: What happens when things go wrong (2-3 per story)
- **Edge case criteria**: Boundary conditions and special cases (1-3 per story)

### How to Write It

```markdown
## Acceptance Criteria

### US-1: [User Story Title]

#### Happy Path
- **AC-1.1**: Given [context], When [action], Then [outcome]
- **AC-1.2**: Given [context], When [action], Then [outcome]
- **AC-1.3**: Given [context], When [action], Then [outcome]

#### Error Handling
- **AC-1.E1**: Given [error condition], When [action], Then [error handling]
- **AC-1.E2**: Given [error condition], When [action], Then [error handling]

#### Edge Cases
- **AC-1.EC1**: Given [edge case], When [action], Then [outcome]

### US-2: [User Story Title]

[Repeat structure]
```

### Example (Feature)

```markdown
## Acceptance Criteria

### US-1: Export Filtered Data

#### Happy Path
- **AC-1.1**: Given I have applied filters to the dashboard, When I click "Export to CSV", 
  Then a CSV file downloads containing only the filtered data with proper column headers.

- **AC-1.2**: Given I have applied filters to the dashboard, When I click "Export to Excel", 
  Then an Excel file downloads with formatted columns, proper data types, and the filter 
  criteria shown in a header row.

- **AC-1.3**: Given I have no filters applied, When I click "Export", Then the export 
  includes all available data up to the system limit (100K rows).

#### Error Handling
- **AC-1.E1**: Given the dataset exceeds 100K rows, When I attempt to export, Then I see 
  a warning message "Dataset too large. Please apply filters to reduce size below 100K rows" 
  and the export is prevented.

- **AC-1.E2**: Given the export service is unavailable, When I attempt to export, Then I 
  see an error message "Export service temporarily unavailable. Please try again in a few 
  minutes" and the request is logged for retry.

#### Edge Cases
- **AC-1.EC1**: Given I have selected columns to hide, When I export, Then hidden columns 
  are excluded from the export file.

- **AC-1.EC2**: Given the data contains special characters (commas, quotes, newlines), 
  When I export to CSV, Then special characters are properly escaped according to RFC 4180.

### US-2: Schedule Recurring Reports

#### Happy Path
- **AC-2.1**: Given I am viewing a dashboard, When I click "Schedule Report" and select 
  "Weekly on Monday at 9 AM", Then a scheduled job is created and I receive a confirmation 
  email with the schedule details.

- **AC-2.2**: Given I have a scheduled report, When the scheduled time arrives, Then the 
  report is generated with current data and emailed to all recipients within 5 minutes of 
  the scheduled time.

- **AC-2.3**: Given I have multiple scheduled reports, When I view "My Scheduled Reports", 
  Then I see a list of all my schedules with next run time, recipients, and status.

#### Error Handling
- **AC-2.E1**: Given the report generation fails, When the scheduled time arrives, Then I 
  receive an email notification of the failure with error details and a link to retry manually.

- **AC-2.E2**: Given an email recipient address is invalid, When the report is sent, Then 
  the report is sent to valid addresses and I receive a notification about the failed recipient.

#### Edge Cases
- **AC-2.EC1**: Given I schedule a report for a date that doesn't exist (e.g., Feb 30), 
  Then the system prevents the schedule and shows an error "Invalid date selected".

- **AC-2.EC2**: Given I have 10 scheduled reports (system limit), When I try to create 
  another, Then I see a message "Maximum scheduled reports reached (10). Please delete an 
  existing schedule to create a new one."
```

### Example (Bugfix)

```markdown
## Acceptance Criteria

### US-1: Remove Cart Items Safely

#### Happy Path
- **AC-1.1**: Given I have items in my cart, When I click the "Remove" button on an item, 
  Then the item is removed from the cart and the cart total updates immediately without 
  page refresh.

- **AC-1.2**: Given I have items in my cart, When I change quantity to zero and press Enter, 
  Then the item is removed from the cart (same behavior as clicking "Remove").

- **AC-1.3**: Given I remove the last item from my cart, When the removal completes, Then 
  I see an empty cart message "Your cart is empty" with a "Continue Shopping" button.

#### Error Handling
- **AC-1.E1**: Given the remove operation fails due to network error, When I click "Remove", 
  Then I see an error message "Unable to remove item. Please check your connection and try 
  again" and the item remains in the cart.

- **AC-1.E2**: Given the item was already removed by another session, When I try to remove 
  it, Then the cart refreshes automatically and shows the current state without error.

#### Edge Cases
- **AC-1.EC1**: Given I rapidly click "Remove" multiple times, When the clicks occur, Then 
  only one remove operation executes and subsequent clicks are ignored (debounced).

- **AC-1.EC2**: Given I have a slow network connection, When I remove an item, Then I see 
  a loading indicator and the remove button is disabled until the operation completes.
```

---

## Section 4: Correctness Properties (ALWAYS REQUIRED)

### Purpose
Define formal properties that the system must satisfy. These are the invariants, safety properties, 
and liveness properties that ensure the system behaves correctly.

### What to Include
- **Safety properties**: Things that must never happen
- **Liveness properties**: Things that must eventually happen
- **Invariants**: Conditions that must always be true
- **Idempotency properties**: Operations that can be repeated safely

### How to Write It

```markdown
## Correctness Properties

### Safety Properties (Must Never Happen)
- **CP-S1**: [Property statement in plain language]
  - **Verification**: [How to test this property]
  - **Violation Example**: [What would break this property]

- **CP-S2**: [Property statement]
  - **Verification**: [How to test]
  - **Violation Example**: [What would break it]

### Liveness Properties (Must Eventually Happen)
- **CP-L1**: [Property statement]
  - **Verification**: [How to test]
  - **Timeout**: [Maximum acceptable time]

### Invariants (Always True)
- **CP-I1**: [Property statement]
  - **Verification**: [How to test]
  - **Counterexample**: [What would violate this]

### Idempotency Properties (Safe to Repeat)
- **CP-ID1**: [Property statement]
  - **Verification**: [How to test]
  - **Test Strategy**: [How to verify idempotency]
```

### Example (Feature)

```markdown
## Correctness Properties

### Safety Properties (Must Never Happen)
- **CP-S1**: No user can access another user's scheduled reports
  - **Verification**: Property-based test generating random user IDs and verifying isolation
  - **Violation Example**: User A queries scheduled reports and receives User B's schedules

- **CP-S2**: No report export can contain data the user doesn't have permission to view
  - **Verification**: Integration test with various permission levels
  - **Violation Example**: User with "Sales" permission exports data including "Finance" records

- **CP-S3**: No scheduled report can be sent to unverified email addresses
  - **Verification**: Unit test attempting to add unverified emails to recipient list
  - **Violation Example**: Report sent to typo email address "user@gmial.com"

### Liveness Properties (Must Eventually Happen)
- **CP-L1**: Every scheduled report must either complete successfully or fail with notification 
  within 10 minutes of scheduled time
  - **Verification**: Integration test with mock clock advancing time
  - **Timeout**: 10 minutes maximum

- **CP-L2**: Every export request must either complete or timeout within 5 minutes
  - **Verification**: Load test with various dataset sizes
  - **Timeout**: 5 minutes maximum

### Invariants (Always True)
- **CP-I1**: The number of scheduled reports per user never exceeds the system limit (10)
  - **Verification**: Property-based test attempting to create 11+ schedules
  - **Counterexample**: User has 11 active scheduled reports

- **CP-I2**: Every exported file contains exactly the rows matching the applied filters
  - **Verification**: Integration test comparing export row count to database query count
  - **Counterexample**: Export has 100 rows but filter matches 105 rows

- **CP-I3**: Scheduled report recipients list is never empty
  - **Verification**: Unit test attempting to save schedule with empty recipients
  - **Counterexample**: Scheduled report with zero recipients

### Idempotency Properties (Safe to Repeat)
- **CP-ID1**: Clicking "Export" multiple times produces identical files (same data, same timestamp)
  - **Verification**: Integration test clicking export button 5 times rapidly
  - **Test Strategy**: Compare file contents and verify only one export job was created

- **CP-ID2**: Creating a scheduled report with identical parameters updates existing schedule 
  rather than creating duplicate
  - **Verification**: Integration test creating same schedule twice
  - **Test Strategy**: Verify only one schedule exists after second creation attempt
```

### Example (Bugfix)

```markdown
## Correctness Properties

### Safety Properties (Must Never Happen)
- **CP-S1**: Removing an item from cart never causes data loss of other cart items
  - **Verification**: Property-based test removing random items and verifying remaining items unchanged
  - **Violation Example**: Removing item A causes item B to disappear from cart

- **CP-S2**: Setting quantity to zero never causes application crash or white screen
  - **Verification**: Integration test setting quantity to zero for all item types
  - **Violation Example**: App crashes with uncaught exception when quantity set to zero

- **CP-S3**: Cart operations never leave the cart in an inconsistent state (e.g., negative quantities)
  - **Verification**: Property-based test with random cart operations
  - **Violation Example**: Cart shows item with quantity -1

### Liveness Properties (Must Eventually Happen)
- **CP-L1**: Every cart update operation must complete or fail with error message within 3 seconds
  - **Verification**: Performance test with various network conditions
  - **Timeout**: 3 seconds maximum

### Invariants (Always True)
- **CP-I1**: Cart total always equals sum of (item price × quantity) for all items
  - **Verification**: Property-based test with random cart modifications
  - **Counterexample**: Cart total is $50 but sum of items is $48

- **CP-I2**: Cart never contains items with quantity ≤ 0
  - **Verification**: Property-based test attempting to set negative/zero quantities
  - **Counterexample**: Cart contains item with quantity 0 or -1

### Idempotency Properties (Safe to Repeat)
- **CP-ID1**: Clicking "Remove" multiple times on same item only removes it once
  - **Verification**: Integration test clicking remove button 5 times rapidly
  - **Test Strategy**: Verify item removed once and subsequent clicks have no effect

- **CP-ID2**: Setting quantity to zero multiple times has same effect as doing it once
  - **Verification**: Integration test setting quantity to zero repeatedly
  - **Test Strategy**: Verify item removed and cart state identical after each attempt
```

---

## Section 5: Constraints & Assumptions (REQUIRED for complex features)

### Purpose
Document technical, business, and operational constraints that limit design choices, plus 
assumptions that must be validated.

### What to Include
- **Technical constraints**: Platform, performance, compatibility requirements
- **Business constraints**: Budget, timeline, regulatory requirements
- **Operational constraints**: Team size, deployment frequency, support capacity
- **Assumptions**: Things we believe to be true but need validation

### How to Write It

```markdown
## Constraints & Assumptions

### Technical Constraints
- **TC-1**: [Constraint description]
  - **Impact**: [How this limits design choices]
  - **Rationale**: [Why this constraint exists]

- **TC-2**: [Constraint description]
  - **Impact**: [How this limits design choices]
  - **Rationale**: [Why this constraint exists]

### Business Constraints
- **BC-1**: [Constraint description]
  - **Impact**: [How this affects scope or timeline]
  - **Rationale**: [Business reason]

### Operational Constraints
- **OC-1**: [Constraint description]
  - **Impact**: [How this affects implementation]
  - **Rationale**: [Operational reason]

### Assumptions
- **A-1**: [Assumption statement]
  - **Validation**: [How to verify this assumption]
  - **Risk if wrong**: [What happens if assumption is false]

- **A-2**: [Assumption statement]
  - **Validation**: [How to verify]
  - **Risk if wrong**: [Impact if false]
```

### Example (Feature)

```markdown
## Constraints & Assumptions

### Technical Constraints
- **TC-1**: Export file size limited to 100MB
  - **Impact**: Cannot export datasets larger than ~1M rows (depending on column count)
  - **Rationale**: Browser download limits and server memory constraints

- **TC-2**: Must support Excel 2016+ and CSV RFC 4180 format
  - **Impact**: Cannot use newer Excel features like dynamic arrays
  - **Rationale**: User base includes organizations with older Excel versions

- **TC-3**: Report generation must not block other database operations
  - **Impact**: Must use read replicas or async job queue
  - **Rationale**: Cannot impact dashboard performance for other users

### Business Constraints
- **BC-1**: Must launch within 6 weeks
  - **Impact**: Limits scope to core features only (no PDF export, no custom templates)
  - **Rationale**: Committed to customer for Q2 delivery

- **BC-2**: Cannot add more than $500/month in infrastructure costs
  - **Impact**: Must optimize for cost (use existing infrastructure, limit storage)
  - **Rationale**: Feature must be profitable within 6 months

### Operational Constraints
- **OC-1**: Support team can handle max 50 additional tickets/week
  - **Impact**: Must have excellent error messages and self-service troubleshooting
  - **Rationale**: Support team is at capacity

- **OC-2**: Deployment window is Sundays 2-4 AM only
  - **Impact**: Must design for zero-downtime deployment or wait for weekly window
  - **Rationale**: Company policy for production changes

### Assumptions
- **A-1**: Users have stable internet connections for large exports
  - **Validation**: Survey users about typical connection quality
  - **Risk if wrong**: High failure rate for large exports, poor user experience

- **A-2**: Email delivery is reliable for scheduled reports
  - **Validation**: Monitor email delivery rates in first 2 weeks
  - **Risk if wrong**: Users miss critical reports, lose trust in feature

- **A-3**: Users understand CSV/Excel formats and can open files
  - **Validation**: Usability testing with representative users
  - **Risk if wrong**: High support burden, low feature adoption

- **A-4**: Current database query performance is acceptable for exports
  - **Validation**: Load test with production data volumes
  - **Risk if wrong**: Exports timeout, need query optimization or caching
```

### Example (Bugfix)

```markdown
## Constraints & Assumptions

### Technical Constraints
- **TC-1**: Must maintain backward compatibility with existing cart API
  - **Impact**: Cannot change cart data structure or API contracts
  - **Rationale**: Mobile apps and third-party integrations depend on current API

- **TC-2**: Fix must work on all supported browsers (Chrome 90+, Firefox 88+, Safari 14+)
  - **Impact**: Cannot use cutting-edge JavaScript features
  - **Rationale**: User base includes older browser versions

### Business Constraints
- **BC-1**: Must fix within 1 week (critical bug)
  - **Impact**: Limits scope to minimal fix, defer refactoring
  - **Rationale**: Causing 50 support tickets/day and revenue loss

### Operational Constraints
- **OC-1**: Must deploy as hotfix without full regression testing
  - **Impact**: Fix must be minimal, low-risk, well-isolated
  - **Rationale**: Cannot wait for next release cycle (2 weeks away)

### Assumptions
- **A-1**: Bug is caused by quantity validation logic, not database layer
  - **Validation**: Code review and local reproduction
  - **Risk if wrong**: Fix doesn't resolve issue, need deeper investigation

- **A-2**: No other code paths set quantity to zero
  - **Validation**: Search codebase for all quantity assignments
  - **Risk if wrong**: Fix incomplete, bug reappears in other scenarios

- **A-3**: Users expect quantity zero to remove item (not keep it with zero quantity)
  - **Validation**: Review user feedback and support tickets
  - **Risk if wrong**: Fix changes expected behavior, creates new complaints
```

---

## Section 6: Success Metrics (REQUIRED for business-critical features)

### Purpose
Define measurable criteria to determine if the feature is successful after launch.

### What to Include
- **Adoption metrics**: How many users use the feature?
- **Engagement metrics**: How often do they use it?
- **Quality metrics**: Does it work well?
- **Business metrics**: Does it achieve business goals?

### How to Write It

```markdown
## Success Metrics

### Adoption Metrics
- **M-A1**: [Metric name]
  - **Target**: [Specific number/percentage]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]

### Engagement Metrics
- **M-E1**: [Metric name]
  - **Target**: [Specific number]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]

### Quality Metrics
- **M-Q1**: [Metric name]
  - **Target**: [Specific threshold]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]

### Business Metrics
- **M-B1**: [Metric name]
  - **Target**: [Specific goal]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]
```

### Example (Feature)

```markdown
## Success Metrics

### Adoption Metrics
- **M-A1**: Percentage of active users who export data at least once
  - **Target**: 40% within 3 months
  - **Measurement**: Track unique users who click export / total active users
  - **Timeline**: Measure monthly for first 3 months

- **M-A2**: Number of scheduled reports created
  - **Target**: 200 active schedules within 2 months
  - **Measurement**: Count of active scheduled reports in database
  - **Timeline**: Measure weekly for first 2 months

### Engagement Metrics
- **M-E1**: Average exports per active user per week
  - **Target**: 2.5 exports/user/week
  - **Measurement**: Total exports / active users / weeks
  - **Timeline**: Measure monthly after initial adoption period

- **M-E2**: Scheduled report execution success rate
  - **Target**: 98% successful executions
  - **Measurement**: Successful runs / total scheduled runs
  - **Timeline**: Measure daily, alert if below 95%

### Quality Metrics
- **M-Q1**: Export completion rate (started vs completed)
  - **Target**: 95% completion rate
  - **Measurement**: Completed exports / initiated exports
  - **Timeline**: Measure daily

- **M-Q2**: Average export generation time
  - **Target**: <30 seconds for 95th percentile
  - **Measurement**: Time from click to download ready (p95)
  - **Timeline**: Measure continuously

- **M-Q3**: Support tickets related to export feature
  - **Target**: <10 tickets/week after first month
  - **Measurement**: Count of tickets tagged "export" or "report"
  - **Timeline**: Measure weekly

### Business Metrics
- **M-B1**: Reduction in manual reporting time
  - **Target**: 1,000 hours/week saved (2 hours/user × 500 users)
  - **Measurement**: User survey + usage analytics
  - **Timeline**: Survey at 1 month and 3 months

- **M-B2**: User satisfaction with reporting capabilities
  - **Target**: NPS score ≥ 40 for export feature
  - **Measurement**: In-app survey after export
  - **Timeline**: Continuous collection, review monthly

- **M-B3**: Revenue impact (reduced churn or increased upgrades)
  - **Target**: 5% reduction in churn for users who use export
  - **Measurement**: Churn rate comparison (export users vs non-users)
  - **Timeline**: Measure quarterly
```

### Example (Bugfix)

```markdown
## Success Metrics

### Adoption Metrics
- **M-A1**: Percentage of users who successfully remove cart items
  - **Target**: 100% (no crashes)
  - **Measurement**: Successful remove operations / attempted remove operations
  - **Timeline**: Measure daily for first 2 weeks

### Engagement Metrics
- **M-E1**: Cart abandonment rate
  - **Target**: Reduce from 15% to 10%
  - **Measurement**: Abandoned carts / total carts created
  - **Timeline**: Compare 2 weeks before fix vs 2 weeks after

### Quality Metrics
- **M-Q1**: Cart crash rate
  - **Target**: 0 crashes related to quantity changes
  - **Measurement**: Error tracking (Sentry/Rollbar) for cart-related crashes
  - **Timeline**: Measure continuously, alert on any occurrence

- **M-Q2**: Support tickets about cart issues
  - **Target**: Reduce from 50/day to <5/day
  - **Measurement**: Count of tickets tagged "cart" or "quantity"
  - **Timeline**: Measure daily for first month

- **M-Q3**: User-reported cart bugs
  - **Target**: 0 reports of quantity-related crashes
  - **Measurement**: User feedback and bug reports
  - **Timeline**: Monitor for first month

### Business Metrics
- **M-B1**: Conversion rate (cart to purchase)
  - **Target**: Increase from 65% to 70%
  - **Measurement**: Completed purchases / carts with items
  - **Timeline**: Compare 2 weeks before vs 2 weeks after

- **M-B2**: Customer satisfaction (CSAT) for checkout experience
  - **Target**: Increase from 3.5/5 to 4.2/5
  - **Measurement**: Post-purchase survey rating
  - **Timeline**: Measure weekly for first month
```

---

## Requirements Document Checklist

Before considering your requirements complete, verify:

### Completeness
- [ ] Problem statement clearly articulates the problem and opportunity
- [ ] All user types have corresponding user stories
- [ ] Each user story has specific, testable acceptance criteria
- [ ] Correctness properties cover safety, liveness, and invariants
- [ ] Constraints are documented with rationale
- [ ] Success metrics are measurable and time-bound

### Clarity
- [ ] Non-technical stakeholders can understand the problem statement
- [ ] User stories follow the "As a/I want/So that" format consistently
- [ ] Acceptance criteria use Given-When-Then format
- [ ] Technical terms are defined or commonly understood
- [ ] Ambiguities are resolved or explicitly noted as open questions

### Testability
- [ ] Every acceptance criterion can be verified with a test
- [ ] Correctness properties have clear verification strategies
- [ ] Success metrics have defined measurement methods
- [ ] Edge cases and error conditions are specified

### Traceability
- [ ] Each user story addresses part of the problem statement
- [ ] Each acceptance criterion maps to a user story
- [ ] Each correctness property relates to acceptance criteria
- [ ] Success metrics align with problem statement opportunity

### Feasibility
- [ ] Constraints are realistic and justified
- [ ] Assumptions are explicitly stated and have validation plans
- [ ] Timeline is achievable given constraints
- [ ] Success metrics are achievable given resources

---

## Efficient Requirements Creation Process

### Step 1: Understand the Vision (15-30 min)
1. Gather user feedback, bug reports, or feature requests
2. Interview stakeholders or review existing documentation
3. Identify the core problem and who it affects
4. Clarify the desired outcome

**Tip**: Start with "why" before "what". Understanding the problem deeply leads to better requirements.

### Step 2: Write Problem Statement (15-30 min)
1. Describe current situation
2. List specific pain points
3. Quantify impact (users affected, frequency, severity)
4. Articulate the opportunity

**Tip**: Use real user quotes and data. "Users spend 2-3 hours/week" is better than "Users spend too much time".

### Step 3: Draft User Stories (30-60 min)
1. List all user types who interact with this feature
2. For each user type, write 2-5 stories
3. Prioritize stories (High/Medium/Low)
4. Estimate complexity (High/Medium/Low)

**Tip**: Focus on user goals, not implementation. "Export data" not "Add export button".

### Step 4: Define Acceptance Criteria (45-90 min)
1. For each user story, write 3-5 happy path criteria
2. Add 2-3 error handling criteria
3. Add 1-3 edge case criteria
4. Use Given-When-Then format consistently

**Tip**: Think like a tester. What would you test to verify this works?

### Step 5: Specify Correctness Properties (30-60 min)
1. List safety properties (what must never happen)
2. List liveness properties (what must eventually happen)
3. List invariants (what must always be true)
4. List idempotency properties (what's safe to repeat)

**Tip**: This is the most important section for quality. Spend time here.

### Step 6: Document Constraints & Assumptions (15-30 min)
1. List technical constraints (platform, performance, compatibility)
2. List business constraints (budget, timeline, regulations)
3. List operational constraints (team, deployment, support)
4. List assumptions with validation plans

**Tip**: Be honest about constraints. They guide design decisions.

### Step 7: Define Success Metrics (15-30 min)
1. Choose 2-3 adoption metrics
2. Choose 2-3 engagement metrics
3. Choose 2-3 quality metrics
4. Choose 1-2 business metrics

**Tip**: Make metrics SMART (Specific, Measurable, Achievable, Relevant, Time-bound).

### Step 8: Review & Refine (15-30 min)
1. Go through the checklist above
2. Fill in gaps
3. Remove ambiguities
4. Ensure consistency

**Total Time Estimate**:
- Simple Feature/Bugfix: 2-3 hours
- Standard Feature: 4-6 hours
- Complex Feature: 1-2 days

---

## Tips for Writing Great Requirements

### 1. Start with User Needs, Not Solutions
❌ "Add a CSV export button to the dashboard"
✅ "Users need to analyze dashboard data in Excel"

The first prescribes a solution. The second describes a need that could be solved multiple ways.

### 2. Be Specific and Measurable
❌ "The system should be fast"
✅ "Export generation completes in <30 seconds for 95% of requests"

Vague requirements lead to vague implementations.

### 3. Use Real Data and Examples
❌ "Many users have this problem"
✅ "50 users per day encounter this issue (10% of daily active users)"

Quantify everything you can.

### 4. Think About Failure Modes
Don't just describe the happy path. What happens when:
- Network fails?
- User provides invalid input?
- System is under heavy load?
- Data is corrupted?

### 5. Involve Actual Users
The best requirements come from talking to real users, not guessing what they need.

### 6. Keep It Simple
Complex requirements lead to complex implementations. If you can't explain it simply, you don't understand it well enough.

### 7. Link to Business Value
Every requirement should trace back to a business goal or user need. If it doesn't, question whether it's necessary.

### 8. Be Honest About Unknowns
It's okay to have open questions. Document them as assumptions that need validation.

---

## Common Pitfalls to Avoid

### 1. Solution Masquerading as Requirement
❌ "The system shall use Redis for caching"
✅ "The system shall respond to requests in <200ms"

Requirements describe WHAT, not HOW.

### 2. Vague Acceptance Criteria
❌ "The export feature should work well"
✅ "Given 10K rows, When I export to CSV, Then the file downloads in <5 seconds"

Be specific enough to test.

### 3. Missing Error Cases
Don't forget to specify what happens when things go wrong.

### 4. Ignoring Non-Functional Requirements
Performance, security, scalability, and usability are requirements too.

### 5. Assuming Everyone Knows the Context
Write for someone who doesn't know the system. Provide background and definitions.

### 6. Scope Creep in Disguise
❌ "While we're at it, let's also add PDF export, custom templates, and scheduling"
✅ "Focus on CSV/Excel export. PDF and scheduling are future enhancements."

Keep scope focused. Document future ideas separately.

---

## Gathering Input from Memory and Vision

### Using Project Memory

If you're working within a project that has existing context, leverage it:

#### 1. Review Initiative Compass
- **Mission**: Does this requirement align with the project mission?
- **Values**: Does it uphold project values?
- **Constraints**: What constraints apply?
- **Non-Negotiables**: What principles must be honored?

#### 2. Review Past Decisions
- Check `memory/decisions.json` for related decisions
- Ensure new requirements don't conflict with past choices
- Build on existing patterns and conventions

#### 3. Review User Model
- Check `memory/user_model.json` for user preferences
- Understand user's decision-making style
- Align with user's quality bar and trade-off biases

#### 4. Review Session Context
- Check `memory/session_context.md` for current work
- Ensure requirements fit into current development phase
- Avoid duplicating work already in progress

### Translating Vision to Requirements

When you have a vision but need to create structured requirements:

#### Step 1: Extract the Core Problem
Ask yourself:
- What problem am I trying to solve?
- Who experiences this problem?
- How often does it occur?
- What's the impact if unsolved?

#### Step 2: Identify User Personas
List all user types:
- End users (who uses the feature?)
- Administrators (who manages it?)
- Developers (who maintains it?)
- Stakeholders (who benefits from it?)

#### Step 3: Map Vision to User Stories
For each persona, ask:
- What do they need to accomplish?
- Why do they need it?
- What value does it provide?

#### Step 4: Define "Done"
For each user story, ask:
- How do I know it works?
- What would I test?
- What could go wrong?

#### Step 5: Identify Correctness Properties
Ask:
- What must NEVER happen? (Safety)
- What must EVENTUALLY happen? (Liveness)
- What must ALWAYS be true? (Invariants)
- What's safe to repeat? (Idempotency)

---

## Example: From Vision to Requirements

### Vision Statement
"I want users to be able to export their dashboard data so they can analyze it in Excel 
and share it with their team."

### Step-by-Step Transformation

#### 1. Extract Core Problem
**Current Situation**: Users can view data in dashboard but can't export it.
**Pain Point**: Users manually copy-paste data, which is time-consuming and error-prone.
**Impact**: 500 users affected, 2-3 hours/week wasted per user.
**Opportunity**: Save 1,000-1,500 hours/week, reduce errors, enable offline analysis.

#### 2. Identify User Personas
- **Data Analyst**: Needs to analyze data in Excel with pivot tables and formulas
- **Team Lead**: Needs to share data with team members who don't have dashboard access
- **Executive**: Needs to include data in presentations and reports

#### 3. Map Vision to User Stories

**US-1: Export to Excel**
As a data analyst,
I want to export dashboard data to Excel,
So that I can perform advanced analysis with pivot tables and formulas.

**US-2: Export to CSV**
As a developer,
I want to export dashboard data to CSV,
So that I can import it into other tools and scripts.

**US-3: Export Filtered Data**
As a team lead,
I want to export only the filtered data I'm viewing,
So that I can share relevant subsets with my team.

#### 4. Define "Done" (Acceptance Criteria)

**For US-1 (Export to Excel)**:
- **AC-1.1**: Given I'm viewing the dashboard, When I click "Export to Excel", Then an 
  Excel file downloads with formatted columns and proper data types.
- **AC-1.2**: Given I have filters applied, When I export, Then only filtered data is included.
- **AC-1.3**: Given the dataset has 50K rows, When I export, Then the file downloads in <30 seconds.

#### 5. Identify Correctness Properties

**Safety Properties**:
- No user can export data they don't have permission to view
- No export can contain more rows than the applied filters match

**Liveness Properties**:
- Every export request completes or times out within 5 minutes

**Invariants**:
- Exported row count always equals database query row count for same filters
- Export file format always matches requested format (CSV vs Excel)

**Idempotency**:
- Clicking export multiple times produces identical files

---

## Requirements Template

Use this template as a starting point:

```markdown
# Requirements: [Feature Name]

## Problem Statement

### Current Situation
[Describe what exists or doesn't exist today]

### Pain Points
- [Pain point 1]
- [Pain point 2]
- [Pain point 3]

### Impact
- **Users affected**: [Number/percentage]
- **Frequency**: [How often]
- **Severity**: [How bad]

### Opportunity
[What value is unlocked by solving this?]

---

## User Stories

### Primary User Stories

#### US-1: [Title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].

**Priority**: High/Medium/Low
**Complexity**: High/Medium/Low

#### US-2: [Title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].

**Priority**: High/Medium/Low
**Complexity**: High/Medium/Low

### Edge Case Stories

#### US-E1: [Title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].

**Priority**: Medium/Low
**Complexity**: High/Medium/Low

---

## Acceptance Criteria

### US-1: [User Story Title]

#### Happy Path
- **AC-1.1**: Given [context], When [action], Then [outcome]
- **AC-1.2**: Given [context], When [action], Then [outcome]

#### Error Handling
- **AC-1.E1**: Given [error condition], When [action], Then [error handling]

#### Edge Cases
- **AC-1.EC1**: Given [edge case], When [action], Then [outcome]

---

## Correctness Properties

### Safety Properties (Must Never Happen)
- **CP-S1**: [Property statement]
  - **Verification**: [How to test]
  - **Violation Example**: [What would break it]

### Liveness Properties (Must Eventually Happen)
- **CP-L1**: [Property statement]
  - **Verification**: [How to test]
  - **Timeout**: [Maximum time]

### Invariants (Always True)
- **CP-I1**: [Property statement]
  - **Verification**: [How to test]
  - **Counterexample**: [What would violate it]

### Idempotency Properties (Safe to Repeat)
- **CP-ID1**: [Property statement]
  - **Verification**: [How to test]
  - **Test Strategy**: [How to verify]

---

## Constraints & Assumptions

### Technical Constraints
- **TC-1**: [Constraint]
  - **Impact**: [How this limits design]
  - **Rationale**: [Why it exists]

### Business Constraints
- **BC-1**: [Constraint]
  - **Impact**: [How this affects scope]
  - **Rationale**: [Business reason]

### Assumptions
- **A-1**: [Assumption]
  - **Validation**: [How to verify]
  - **Risk if wrong**: [Impact if false]

---

## Success Metrics

### Adoption Metrics
- **M-A1**: [Metric name]
  - **Target**: [Specific number]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]

### Quality Metrics
- **M-Q1**: [Metric name]
  - **Target**: [Specific threshold]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]

### Business Metrics
- **M-B1**: [Metric name]
  - **Target**: [Specific goal]
  - **Measurement**: [How to measure]
  - **Timeline**: [When to measure]
```

---

## Next Steps After Completing Requirements

Once you've written your requirements document:

1. **Self-Review**: Go through the checklist
2. **Stakeholder Review**: Share with users and stakeholders for validation
3. **Technical Review**: Share with developers for feasibility check
4. **Bring to Agent**: Request agent help to refine and improve

The agent can help you:
- Identify missing user stories or acceptance criteria
- Strengthen correctness properties
- Validate assumptions and constraints
- Generate design document from requirements
- Create implementation task list

---

## Integration with Spec Workflow Pipeline

This requirements document is the first step in the enhanced 5-phase spec-driven development workflow:

```
1. requirements.md (you create) ← YOU ARE HERE
   ↓
2. [Optional: Customization analysis]
   ↓
3. customization.md (if domain-specific needs identified)
   ↓
4. design.md (agent helps generate with custom agents)
   ↓
5. tasks.md (agent generates)
   ↓
6. [Implementation begins]
```

### The 5-Phase Pipeline

**Phase 1: Requirements** (YOU ARE HERE)
- Define problem, user stories, acceptance criteria
- Specify correctness properties
- Document constraints and success metrics

**Phase 2: Customization** (Optional but Recommended)
- Analyze requirements for domain-specific patterns
- Identify expertise gaps in core domains
- Create custom agents for specialized knowledge (e.g., D14 Healthcare, D15 Finance)
- Distill repeated patterns into reusable knowledge
- **When to use**: Specialized domains (healthcare, finance, gaming), regulatory requirements, repeated patterns
- **When to skip**: Simple CRUD, core domains adequate, one-off features

**Phase 3: Design**
- Generate architecture and technical design
- Leverage custom agents for domain-specific guidance
- Apply distilled patterns from customization phase
- Define implementation approach

**Phase 4: Tasks**
- Break design into implementable tasks
- Prioritize by dependencies
- Estimate complexity
- Generate test strategies

**Phase 5: Development**
- Implement tasks with custom agents available
- Reference distilled patterns in code
- Validate against correctness properties

### After Completing Requirements

You can:
1. **Request customization analysis**: "Analyze requirements for customization needs"
   - Agent identifies domain-specific gaps and patterns
   - Recommends custom agents or distillations
   - Estimates ROI of customization investment

2. **Skip to design** (if no customization needed): "Generate design from requirements"
   - Agent uses 13 core domains only
   - Suitable for standard features

3. **Request requirements review**: "Review requirements for completeness"
   - Agent validates against checklist
   - Identifies missing user stories or acceptance criteria
   - Strengthens correctness properties

---

## Conclusion

A well-crafted requirements document:
- Clearly articulates the problem and opportunity
- Describes user needs from their perspective
- Defines specific, testable acceptance criteria
- Specifies correctness properties for quality
- Documents constraints and assumptions honestly
- Establishes measurable success metrics

**Key Principles**:
1. **User-focused**: Write from user perspective, not technical perspective
2. **Specific**: Be concrete and measurable, avoid vague language
3. **Testable**: Every requirement should be verifiable
4. **Traceable**: Link requirements to business value
5. **Honest**: Document unknowns and assumptions explicitly

**Time Investment**:
- Simple requirements: 2-3 hours
- Standard requirements: 4-6 hours
- Complex requirements: 1-2 days

This upfront investment pays off by:
- Reducing rework and scope creep
- Enabling better design decisions
- Facilitating accurate estimation
- Improving implementation quality
- Providing clear success criteria

Good luck with your requirements document!
