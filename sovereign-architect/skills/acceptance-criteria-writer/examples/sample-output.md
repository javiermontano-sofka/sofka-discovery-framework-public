# Acceptance Criteria Writer — Sample Output

## Context
User story: "As a team admin, I want to set a password policy for my organization so that member accounts meet our security requirements."

## Output

### Happy Path Criteria

**AC-1: Set minimum password length** `[REQUISITO]`
> **Given** I am logged in as a team admin
> **When** I set the minimum password length to 12 characters
> **Then** the policy is saved and displayed as "Minimum length: 12"
> **And** new password changes by team members are validated against this minimum

**AC-2: Require character complexity** `[REQUISITO]`
> **Given** I am logged in as a team admin
> **When** I enable "Require uppercase, lowercase, number, and special character"
> **Then** the policy is saved
> **And** passwords like "SimplePassword" are rejected with message "Password must include at least one uppercase letter, one lowercase letter, one number, and one special character"

**AC-3: Set password expiration** `[REQUISITO]`
> **Given** I am logged in as a team admin
> **When** I set password expiration to 90 days
> **Then** members whose passwords are older than 90 days are prompted to change on next login

### Edge Cases

**AC-4: Minimum length boundary** `[INFERENCIA]`
> **Given** I am logged in as a team admin
> **When** I attempt to set minimum password length to 7 (below system minimum of 8)
> **Then** the form shows validation error: "Minimum password length must be between 8 and 128 characters"
> **And** the policy is NOT saved

**AC-5: Policy applies to existing sessions** `[SUPUESTO]`
> **Given** a team member is logged in with a password that does not meet the new policy
> **When** the admin saves a stricter password policy
> **Then** the member is NOT immediately logged out
> **But** they are required to change their password on next login

**AC-6: Conflicting policies** `[INFERENCIA]`
> **Given** the admin sets minimum length to 8 and requires all character types
> **When** a member tries to set password "Ab1!" (meets complexity but not length)
> **Then** the error message lists ALL unmet criteria, not just the first

### Error Scenarios

**AC-7: Non-admin access** `[REQUISITO]`
> **Given** I am logged in as a regular team member (not admin)
> **When** I attempt to access the password policy settings page
> **Then** I receive a 403 Forbidden response
> **And** the page shows "You do not have permission to manage organization settings"

**AC-8: Concurrent policy updates** `[INFERENCIA]`
> **Given** Admin A and Admin B both open the password policy settings page
> **When** Admin A saves a change, then Admin B saves a different change
> **Then** Admin B receives a conflict warning: "Policy was updated by another admin. Please review the current settings and try again."

### Non-Functional Criteria

**AC-9: Performance** `[SUPUESTO]`
> **Given** an organization with 10,000 members
> **When** the admin saves a new password policy
> **Then** the save completes in under 500ms
> **And** policy enforcement on member login adds no more than 50ms latency

**AC-10: Audit logging** `[REQUISITO]`
> **Given** any password policy change is made
> **Then** an audit log entry is created with: admin ID, timestamp, previous policy, new policy
> **And** the audit log is visible to organization owners
