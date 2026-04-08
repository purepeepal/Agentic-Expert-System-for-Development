# Design Document Preparation Guide

## Overview

This guide walks you through creating a design document from requirements that's **right-sized for your project**. It provides a scalable framework that works for small features, large systems, and everything in between.

**Part of the Enhanced Spec Workflow Pipeline**: Requirements → Customization → **Design** → Tasks → Development

---

## Two Approaches to Design Creation

### Approach 1: Manual Creation (This Guide)
Follow this guide to create your design.md independently, then request agent refinement.

**Best for**:
- Learning the design process
- Complex domains requiring deep expertise
- When you want full control over design decisions

**Time**: 1-6 hours depending on complexity

### Approach 2: AES-Assisted Creation (Recommended)
Let the Agentic Expert System analyze your requirements and generate a design scaffold with multi-domain recommendations.

**Best for**:
- Faster iteration
- Leveraging cross-domain expertise
- Ensuring no critical perspectives are missed

**Time**: 30-60 minutes (scaffold generation + refinement)

**How to use**: After completing requirements.md, request "Generate design scaffold from requirements" and the AES will:
1. Analyze requirements through 13-domain parliamentary system
2. Generate architecture recommendations (D03 Infrastructure)
3. Suggest API patterns (D03 + D08 Systems UX)
4. Identify correctness properties (D09 Mathematics + D10 Security)
5. Recommend technology choices (D07 Open Source)
6. Propose testing strategies (D07 + D09)
7. Insert [PLACEHOLDER] markers for decisions requiring your input

---
## Universal Design Document Structure

Your design.md should contain these sections (scale depth based on project complexity):

### 1. High-Level Design (System Architecture) - **ALWAYS REQUIRED**
### 2. Low-Level Design (Implementation Details) - **REQUIRED for Standard/Comprehensive**
### 3. Correctness Properties & Testing Strategy - **ALWAYS REQUIRED**
### 4. Non-Functional Requirements - **REQUIRED for Standard/Comprehensive**

---

## How AES Elevates Each Section

When using AES-assisted design, the parliamentary system provides multi-perspective analysis:

### Section 1: High-Level Design
**AES Contribution**:
- **D03 (Infrastructure)**: Architecture patterns, scalability considerations, deployment topology
- **D08 (Systems UX)**: Information architecture, user flow optimization
- **D09 (Logic & Complexity)**: Simplification opportunities, unnecessary layers to avoid
- **D12 (Unconventional)**: Creative alternatives to standard patterns

**Example AES Output**:
```markdown
## System Architecture (AES-Generated Scaffold)

### Overview
[AES analyzes requirements and suggests architecture approach]

Based on requirements analysis:
- D03 Infrastructure recommends: Token-based auth with separate auth/authz layers
- D09 Logic & Complexity flags: Avoid microservices for <10K users, use modular monolith
- D12 Unconventional suggests: Consider stateless JWT instead of session store for simplicity

[PLACEHOLDER: Confirm architecture approach or specify alternative]

### Components
[AES identifies components from user stories]
- **Auth Service**: Handles login, token generation (from US-1, US-2)
- **User Service**: Manages profiles (from US-3)
- [PLACEHOLDER: Add any additional components]
```

### Section 2: Low-Level Design
**AES Contribution**:
- **D07 (Open Source)**: Technology recommendations, dependency health checks
- **D04 (Cognition)**: API naming conventions, error message patterns
- **D09 (Mathematics)**: Algorithm selection, complexity analysis
- **D09 (Logic & Complexity)**: Module structure simplification

### Section 3: Correctness Properties
**AES Contribution**:
- **D09 (Mathematics)**: Formal property identification
- **D10 (Security)**: Security properties, threat modeling
- **D07 (Open Source)**: Testing framework recommendations
- **D12 (Unconventional)**: Non-obvious properties to verify

### Section 4: Non-Functional Requirements
**AES Contribution**:
- **D03 (Infrastructure)**: Performance targets, scalability limits
- **D10 (Security)**: Security requirements, compliance needs
- **D11 (DevOps)**: Monitoring, observability, deployment strategy
- **D01 (Strategy)**: Cost implications, resource allocation

---xample**: Add a new field to a form, simple CRUD endpoint

### Standard Design (Most Features)
**Use when**: Moderate complexity with some integration points
**Time**: 2-4 hours (manual) or 45-90 minutes (AES-assisted)
**Includes**: Architecture, data models, API design, algorithms, testing strategy
**Example**: User authentication, payment processing, notification system

### Comprehensive Design (Complex Systems)
**Use when**: High complexity, multiple integrations, critical correctness requirements
**Time**: 1-3 days (manual) or 3-6 hours (AES-assisted)
**Includes**: Everything + detailed state machines, formal properties, performance modeling
**Example**: Distributed transaction system, real-time collaboration, financial ledger

---

## Prerequisites

Before starting your design document, ensure you have:
- ✅ A completed requirements.md file with clear user stories and acceptance criteria
- ✅ Understanding of the system's correctness properties (what must always be true)
- ✅ Knowledge of the technical stack and constraints
- ✅ Access to any relevant architectural documentation or existing system context
- ✅ (Optional) Completed customization.md if domain-specific expertise is needed
- ✅ (Optional) Custom agents registered and available (C1+) for specialized domains
- ✅ (Optional) Access to project memory (initiative compass, past decisions, user model)

---

## Universal Design Document Structure

Your design.md should contain these sections (scale depth based on project complexity):

### 1. High-Level Design (System Architecture) - **ALWAYS REQUIRED**
### 2. Low-Level Design (Implementation Details) - **REQUIRED for Standard/Comprehensive**
### 3. Correctness Properties & Testing Strategy - **ALWAYS REQUIRED**
### 4. Non-Functional Requirements - **REQUIRED for Standard/Comprehensive**

---

## Section 1: High-Level Design (ALWAYS REQUIRED)

### 1.1 System Architecture Overview

**Purpose**: Provide a bird's-eye view of how components interact.

**Depth by Project Type**:
- **Minimal**: 2-3 sentence overview + bullet list of components
- **Standard**: Component diagram + interactions + external dependencies
- **Comprehensive**: Full architecture with data flow, integration patterns, deployment topology

**What to include**:
- System context diagram showing external dependencies
- Component architecture showing major modules
- Data flow between components
- Integration points with external systems

**How to write it**:
```
## System Architecture

### Overview
[2-3 sentences describing the overall system approach]

### Components
- **Component Name**: Brief description of responsibility
- **Component Name**: Brief description of responsibility

### Component Interactions
[Describe how components communicate - APIs, events, message queues, etc.]

### External Dependencies
- Dependency 1: Purpose and integration method
- Dependency 2: Purpose and integration method
```

**Example**:
```
## System Architecture

### Overview
The user authentication system follows a token-based architecture with 
separate authentication and authorization layers. It integrates with an 
external identity provider for SSO capabilities.

### Components
- **Auth Service**: Handles login, token generation, and validation
- **User Service**: Manages user profiles and permissions
- **Token Store**: Redis-based cache for active sessions
- **Identity Provider Adapter**: Interfaces with external SSO

### Component Interactions
- Auth Service exposes REST API for login/logout
- Token validation happens via middleware in each service
- User Service subscribes to auth events for profile updates
```

---

### 1.2 Data Models

**Purpose**: Define the structure of data entities and their relationships.

**Depth by Project Type**:
- **Minimal**: List key entities with primary attributes only
- **Standard**: Full entity definitions with relationships and validation rules
- **Comprehensive**: Add indexes, constraints, migration strategy, data lifecycle

**What to include**:
- Entity definitions with attributes and types
- Relationships between entities (one-to-many, many-to-many)
- Key constraints (unique, required, indexed)
- Data validation rules

**Domain-Specific Considerations**:

**For Web APIs/Microservices**:
- Focus on request/response schemas
- Include API versioning strategy
- Document serialization format (JSON, Protocol Buffers, etc.)

**For Data Processing/ETL**:
- Input/output data formats
- Transformation rules
- Data quality constraints
- Schema evolution strategy

**For UI/Frontend**:
- Component state shape
- Form validation schemas
- Client-side data caching strategy

**For ML/AI Systems**:
- Training data schema
- Model input/output formats
- Feature engineering pipeline
- Inference request/response structure

**How to write it**:
```
## Data Models

### Entity: [EntityName]
**Purpose**: [What this entity represents]

**Attributes**:
- `attribute_name` (type, constraints): Description
- `attribute_name` (type, constraints): Description

**Relationships**:
- Relationship to other entities

**Validation Rules**:
- Rule 1
- Rule 2

**Indexes**:
- Index on field(s) for query optimization
```

**Example**:
```
## Data Models

### Entity: User
**Purpose**: Represents an authenticated user in the system

**Attributes**:
- `id` (UUID, primary key, required): Unique identifier
- `email` (string, unique, required): User's email address
- `password_hash` (string, required): Bcrypt hashed password
- `created_at` (timestamp, required): Account creation time
- `last_login` (timestamp, nullable): Last successful login

**Relationships**:
- One-to-many with Session (user can have multiple active sessions)
- Many-to-many with Role through UserRole junction table

**Validation Rules**:
- Email must match RFC 5322 format
- Password must be at least 12 characters
- Email must be verified before account activation

**Indexes**:
- Unique index on email for fast lookup
- Index on created_at for analytics queries
```

---

### 1.3 API Design / Interface Contracts

**Purpose**: Define the interface contracts for your system.

**Depth by Project Type**:
- **Minimal**: List endpoints/functions with basic input/output
- **Standard**: Full request/response schemas with error cases
- **Comprehensive**: Add rate limiting, versioning, deprecation strategy, SLAs

**What to include**:
- Endpoint definitions (method, path, purpose) OR function signatures
- Request/response schemas
- Authentication/authorization requirements
- Error responses
- Rate limiting considerations

**Domain-Specific Considerations**:

**For REST APIs**:
- HTTP methods and status codes
- Resource naming conventions
- Pagination strategy
- HATEOAS links (if applicable)

**For GraphQL**:
- Schema definitions (types, queries, mutations)
- Resolver logic overview
- DataLoader patterns for N+1 prevention

**For gRPC/Protocol Buffers**:
- Service definitions
- Message types
- Streaming patterns (unary, server-streaming, client-streaming, bidirectional)

**For CLI Tools**:
- Command structure and subcommands
- Flag/option definitions
- Input/output formats (JSON, YAML, table)
- Exit codes

**For Libraries/SDKs**:
- Public API surface
- Class/function signatures
- Initialization patterns
- Error handling conventions

**For Event-Driven Systems**:
- Event schemas
- Topic/queue naming
- Ordering guarantees
- Idempotency strategy

**How to write it**:
```
## API Design

### Endpoint: [HTTP Method] /path/to/endpoint
**Purpose**: [What this endpoint does]

**Authentication**: [Required/Optional, method]

**Request**:
- Headers: [Required headers]
- Body: [Request schema]
- Query Parameters: [If applicable]

**Response**:
- Success (200): [Response schema]
- Error (4xx/5xx): [Error schema]

**Example**:
[Provide a concrete example]
```

**Example**:
```
## API Design

### Endpoint: POST /auth/login
**Purpose**: Authenticate user and return access token

**Authentication**: None (public endpoint)

**Request**:
- Headers: 
  - Content-Type: application/json
- Body:
  ```json
  {
    "email": "string (required, email format)",
    "password": "string (required, min 12 chars)"
  }
  ```

**Response**:
- Success (200):
  ```json
  {
    "access_token": "string (JWT)",
    "refresh_token": "string",
    "expires_in": "number (seconds)",
    "user": {
      "id": "string (UUID)",
      "email": "string"
    }
  }
  ```
- Error (401):
  ```json
  {
    "error": "invalid_credentials",
    "message": "Email or password is incorrect"
  }
  ```

**Rate Limiting**: 5 attempts per IP per 15 minutes

**Example**:
```bash
curl -X POST https://api.example.com/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com","password":"securepass123"}'
```
```

---

### 1.4 Technology Stack & Dependencies

**Purpose**: Document technical choices and justify them.

**Depth by Project Type**:
- **Minimal**: List key technologies only
- **Standard**: Add rationale for each choice
- **Comprehensive**: Include alternatives considered, trade-off analysis, migration path

**What to include**:
- Programming languages and versions
- Frameworks and libraries
- Databases and storage solutions
- Third-party services
- Rationale for each choice

**Domain-Specific Considerations**:

**For Backend Services**:
- Web framework (Express, FastAPI, Spring Boot, etc.)
- ORM/database client
- Authentication library
- Background job processor
- Caching layer

**For Frontend Applications**:
- UI framework (React, Vue, Angular, Svelte)
- State management (Redux, Zustand, Pinia)
- Routing library
- Form handling
- Build tool (Vite, Webpack, etc.)

**For Mobile Apps**:
- Native vs cross-platform (React Native, Flutter)
- Navigation library
- Local storage solution
- Push notification service
- Analytics SDK

**For Data/ML Projects**:
- Data processing framework (Pandas, Spark, Dask)
- ML framework (TensorFlow, PyTorch, scikit-learn)
- Model serving (TensorFlow Serving, TorchServe, FastAPI)
- Feature store (if applicable)
- Experiment tracking (MLflow, Weights & Biases)

**For Infrastructure/DevOps**:
- IaC tool (Terraform, CloudFormation, Pulumi)
- Container orchestration (Kubernetes, ECS, Docker Compose)
- CI/CD platform (GitHub Actions, GitLab CI, Jenkins)
- Monitoring stack (Prometheus, Grafana, DataDog)

**How to write it**:
```
## Technology Stack

### Language & Runtime
- **Choice**: [Language/Runtime version]
- **Rationale**: [Why this choice fits the requirements]

### Framework
- **Choice**: [Framework name and version]
- **Rationale**: [Benefits for this project]

### Database
- **Choice**: [Database type and version]
- **Rationale**: [Why it fits the data model and scale]

### Key Dependencies
- **Dependency**: Purpose and version
- **Dependency**: Purpose and version

### Infrastructure
- **Hosting**: [Cloud provider, container orchestration]
- **CI/CD**: [Build and deployment tools]
```

---

## Section 2: Low-Level Design (REQUIRED for Standard/Comprehensive)

### 2.1 Module/Class Structure

**Purpose**: Break down components into implementable units.

**Depth by Project Type**:
- **Minimal**: Skip this section OR list main files/modules only
- **Standard**: Module organization + key classes/functions with signatures
- **Comprehensive**: Full class hierarchy, dependency graph, design patterns used

**What to include**:
- Module organization and file structure
- Class/function signatures
- Responsibilities of each module
- Dependencies between modules

**Domain-Specific Considerations**:

**For Object-Oriented Languages (Java, C#, Python classes)**:
- Class hierarchy and inheritance
- Interface definitions
- Design patterns (Factory, Strategy, Observer, etc.)
- Dependency injection strategy

**For Functional Languages (Haskell, Elixir, Clojure)**:
- Module organization
- Pure vs impure functions
- Type signatures
- Higher-order functions and composition

**For Procedural/Scripting (Python scripts, Bash)**:
- Script organization
- Function definitions
- Global state management
- Module imports

**For Component-Based UI (React, Vue, Svelte)**:
- Component tree structure
- Props and state flow
- Custom hooks/composables
- Context/provide-inject usage

**How to write it**:
```
## Module Structure

### Module: [ModuleName]
**Location**: `path/to/module`
**Purpose**: [What this module handles]

**Exports**:
- `ClassName` / `functionName`: Description
- `ClassName` / `functionName`: Description

**Dependencies**:
- Internal: [Other modules it depends on]
- External: [Third-party libraries]

**Key Classes/Functions**:

#### Class: ClassName
**Responsibility**: [What this class does]

**Properties**:
- `propertyName` (type): Description

**Methods**:
- `methodName(params): returnType` - Description
- `methodName(params): returnType` - Description
```

**Example**:
```
## Module Structure

### Module: AuthService
**Location**: `src/services/auth/`
**Purpose**: Handles user authentication and token management

**Exports**:
- `AuthService`: Main authentication service class
- `TokenManager`: JWT token generation and validation
- `PasswordHasher`: Password hashing utilities

**Dependencies**:
- Internal: UserRepository, SessionStore
- External: jsonwebtoken, bcrypt

**Key Classes**:

#### Class: AuthService
**Responsibility**: Orchestrates authentication flow

**Properties**:
- `userRepo` (UserRepository): User data access
- `tokenManager` (TokenManager): Token operations
- `sessionStore` (SessionStore): Session persistence

**Methods**:
- `login(email: string, password: string): Promise<AuthResult>` 
  - Validates credentials and returns tokens
- `logout(token: string): Promise<void>` 
  - Invalidates session and token
- `refreshToken(refreshToken: string): Promise<TokenPair>` 
  - Issues new access token
- `validateToken(token: string): Promise<TokenPayload>` 
  - Verifies token signature and expiration
```

---

### 2.2 Algorithms & Logic

**Purpose**: Describe complex logic that needs careful implementation.

**When to include this section**:
- ✅ Complex business logic with multiple edge cases
- ✅ Performance-critical algorithms
- ✅ Non-obvious implementation approaches
- ❌ Simple CRUD operations
- ❌ Standard framework patterns

**Depth by Project Type**:
- **Minimal**: Skip unless algorithm is core to the feature
- **Standard**: Describe key algorithms in pseudocode
- **Comprehensive**: Add complexity analysis, optimization strategies, alternative approaches

**What to include**:
- Step-by-step algorithm descriptions
- Pseudocode for complex operations
- Edge cases and how to handle them
- Performance considerations

**Domain-Specific Considerations**:

**For Data Processing**:
- Batch vs streaming processing logic
- Aggregation algorithms
- Deduplication strategy
- Sorting and filtering logic

**For Search/Ranking**:
- Scoring algorithms
- Relevance calculation
- Filtering and faceting logic
- Pagination with cursor vs offset

**For Real-Time Systems**:
- Conflict resolution (CRDT, OT)
- Synchronization logic
- Event ordering guarantees
- Backpressure handling

**For Financial/Accounting**:
- Calculation precision (decimal handling)
- Rounding strategies
- Transaction ordering
- Balance reconciliation

**How to write it**:
```
## Algorithm: [Algorithm Name]

**Purpose**: [What problem this solves]

**Input**: [What data comes in]
**Output**: [What data goes out]

**Steps**:
1. Step description
2. Step description
3. Step description

**Pseudocode**:
```
[Pseudocode representation]
```

**Edge Cases**:
- Case 1: How to handle
- Case 2: How to handle

**Complexity**: Time O(n), Space O(1)
```

**Example**:
```
## Algorithm: Token Refresh Flow

**Purpose**: Securely refresh expired access tokens without re-authentication

**Input**: Valid refresh token
**Output**: New access token and refresh token pair

**Steps**:
1. Validate refresh token signature and expiration
2. Check if token is in revocation list (blacklist)
3. Retrieve user session from token payload
4. Verify session is still active in session store
5. Generate new access token with updated expiration
6. Optionally rotate refresh token (if near expiration)
7. Update session last_activity timestamp
8. Return new token pair

**Pseudocode**:
```
function refreshToken(refreshToken):
  payload = verifyJWT(refreshToken)
  if payload.exp < now():
    throw TokenExpiredError
  
  if isBlacklisted(refreshToken):
    throw TokenRevokedError
  
  session = sessionStore.get(payload.sessionId)
  if not session or session.revoked:
    throw InvalidSessionError
  
  newAccessToken = generateJWT({
    userId: payload.userId,
    sessionId: payload.sessionId,
    exp: now() + ACCESS_TOKEN_TTL
  })
  
  newRefreshToken = refreshToken
  if payload.exp - now() < REFRESH_ROTATION_THRESHOLD:
    newRefreshToken = generateJWT({
      userId: payload.userId,
      sessionId: payload.sessionId,
      exp: now() + REFRESH_TOKEN_TTL
    })
    blacklist(refreshToken)
  
  sessionStore.updateActivity(payload.sessionId)
  
  return {newAccessToken, newRefreshToken}
```

**Edge Cases**:
- Concurrent refresh requests: Use session locking to prevent race conditions
- Refresh token near expiration: Rotate to new refresh token
- User logged out elsewhere: Session revoked, reject refresh
- Clock skew: Allow 30-second grace period for expiration checks

**Complexity**: Time O(1), Space O(1)
```

---

### 2.3 State Management

**Purpose**: Define how application state is managed and transitions.

**When to include this section**:
- ✅ Stateful systems with complex transitions
- ✅ Workflow engines
- ✅ UI with complex state interactions
- ❌ Stateless APIs
- ❌ Simple request-response patterns

**Depth by Project Type**:
- **Minimal**: Skip unless state is central to the feature
- **Standard**: List states and valid transitions
- **Comprehensive**: Full state machine with guards, actions, and persistence strategy

**What to include**:
- State machine diagrams or descriptions
- Valid state transitions
- State persistence strategy
- Concurrency considerations

**Domain-Specific Considerations**:

**For Workflow Systems**:
- Workflow states (pending, in_progress, completed, failed)
- Transition triggers (user action, timer, external event)
- Rollback/compensation logic
- Long-running transaction handling

**For UI Applications**:
- Component state lifecycle
- Global vs local state
- State synchronization with backend
- Optimistic updates and rollback

**For Distributed Systems**:
- Consensus requirements
- State replication strategy
- Partition tolerance approach
- Eventual consistency model

**How to write it**:
```
## State Management: [Entity/Process Name]

**States**:
- State1: Description
- State2: Description

**Transitions**:
- State1 → State2: Trigger condition
- State2 → State3: Trigger condition

**State Diagram**:
[Text representation or description]

**Persistence**:
[How state is stored and recovered]

**Concurrency**:
[How concurrent state changes are handled]
```

---

### 2.4 Error Handling Strategy

**Purpose**: Define how errors are caught, logged, and communicated.

**Depth by Project Type**:
- **Minimal**: List error types and basic handling approach
- **Standard**: Error classification, codes, logging, retry logic
- **Comprehensive**: Add circuit breakers, fallback strategies, error budgets

**What to include**:
- Error classification (recoverable vs fatal)
- Error codes and messages
- Logging strategy
- User-facing error messages
- Retry logic

**Domain-Specific Considerations**:

**For User-Facing Applications**:
- User-friendly error messages (avoid technical jargon)
- Error recovery guidance ("Try again" vs "Contact support")
- Form validation error display
- Toast/notification patterns

**For APIs**:
- HTTP status codes (4xx vs 5xx)
- Error response format (RFC 7807 Problem Details)
- Rate limit headers
- Deprecation warnings

**For Background Jobs**:
- Retry with exponential backoff
- Dead letter queue handling
- Job timeout strategy
- Partial failure handling

**For Distributed Systems**:
- Circuit breaker patterns
- Fallback responses
- Timeout and deadline propagation
- Graceful degradation

**How to write it**:
```
## Error Handling

### Error Categories

#### Category: [ErrorType]
**When**: [Conditions that trigger this error]
**Code**: [Error code]
**User Message**: [What user sees]
**Log Level**: [DEBUG/INFO/WARN/ERROR/FATAL]
**Recovery**: [How to handle/retry]

### Error Response Format
```json
{
  "error": "error_code",
  "message": "Human-readable message",
  "details": {},
  "request_id": "uuid"
}
```

### Retry Strategy
- Transient errors: Exponential backoff, max 3 retries
- Network errors: Retry with jitter
- Fatal errors: No retry, log and alert
```

---

## Section 3: Correctness Properties & Testing (ALWAYS REQUIRED)

### 3.1 Correctness Properties

**Purpose**: Define formal properties that the system must satisfy.

**THIS IS CRITICAL**: Every design must define what "correct" means. These properties drive your testing strategy and implementation validation.

**Depth by Project Type**:
- **Minimal**: 2-3 key properties in plain language
- **Standard**: 5-10 properties with verification strategy
- **Comprehensive**: Formal specifications, proof sketches, exhaustive property catalog

**What to include**:
- Property statements in plain language
- Formal specification (if applicable)
- How to verify each property
- Test strategy for each property

**Types of Correctness Properties**:

**Safety Properties** (something bad never happens):
- "No two users can have the same email address"
- "Account balance never goes negative"
- "Deleted data is never returned in queries"

**Liveness Properties** (something good eventually happens):
- "Every submitted job eventually completes or fails"
- "All messages are eventually delivered"
- "System eventually becomes consistent after partition heals"

**Invariants** (always true):
- "Sum of all account balances equals total deposits minus total withdrawals"
- "Every order has exactly one payment record"
- "User session expires after 24 hours of inactivity"

**Idempotency** (repeated operations have same effect):
- "Submitting the same payment request twice charges once"
- "Retrying a failed API call doesn't create duplicates"

**Domain-Specific Property Examples**:

**For E-Commerce**:
- Inventory never oversold
- Order total matches sum of line items plus tax minus discounts
- Payment captured before order fulfillment
- Refund amount never exceeds original payment

**For Authentication**:
- Valid token always maps to exactly one active session
- Password reset tokens expire after use
- Failed login attempts are rate-limited
- Logout invalidates all tokens for that session

**For Data Pipelines**:
- No data loss between stages
- Duplicate records are deduplicated
- Schema validation passes for all records
- Aggregations are commutative and associative

**For Real-Time Collaboration**:
- Concurrent edits converge to same state
- Operations are causally ordered
- No lost updates
- Undo/redo is consistent

**How to write it**:
```
## Correctness Properties

### Property: [Property Name]
**Category**: [Safety/Liveness/Invariant]

**Statement**: [Plain language description of what must always be true]

**Formal Specification**: 
[Mathematical or logical representation if applicable]

**Verification Strategy**:
- Unit tests: [What to test]
- Property-based tests: [Generators and properties]
- Integration tests: [Scenarios to verify]

**Counterexample Scenarios**:
[Scenarios that would violate this property]
```

**Example**:
```
## Correctness Properties

### Property: Token Uniqueness
**Category**: Safety (something bad never happens)

**Statement**: No two active sessions can have the same access token at any point in time.

**Formal Specification**: 
∀ t₁, t₂ ∈ ActiveTokens: t₁.token = t₂.token ⟹ t₁.sessionId = t₂.sessionId

**Verification Strategy**:
- Unit tests: Mock token generation to verify UUID uniqueness
- Property-based tests: Generate N tokens, verify all unique
- Integration tests: Concurrent login requests produce unique tokens
- Load tests: High-volume token generation maintains uniqueness

**Counterexample Scenarios**:
- Weak random number generator produces collisions
- Race condition in token generation
- Token copied between sessions

### Property: Authentication Idempotency
**Category**: Safety

**Statement**: Multiple identical login requests with valid credentials always produce the same authentication result (success with valid token).

**Verification Strategy**:
- Property-based tests: Generate random credentials, login N times, verify consistent results
- Integration tests: Rapid-fire identical login requests
- Concurrency tests: Parallel login attempts with same credentials

**Counterexample Scenarios**:
- Rate limiting blocks subsequent requests
- Session limit causes earlier sessions to be revoked
- Token generation includes timestamp causing different tokens
```

---

### 3.2 Property-Based Testing Strategy

**Purpose**: Define how to use PBT to verify correctness properties.

**Depth by Project Type**:
- **Minimal**: Identify 1-2 properties suitable for PBT
- **Standard**: Define generators and property tests for key properties
- **Comprehensive**: Full PBT suite with custom generators, shrinking strategies, stateful testing

**What to include**:
- Test generators for input data
- Property test implementations
- Expected invariants
- Shrinking strategies for failures

**When to Use Property-Based Testing**:
- ✅ Testing invariants that should hold for all inputs
- ✅ Verifying mathematical properties (commutativity, associativity)
- ✅ Testing serialization/deserialization round-trips
- ✅ Validating state machine transitions
- ❌ Testing specific business rules with fixed examples (use unit tests)
- ❌ Testing UI interactions (use integration tests)

**Common PBT Patterns**:

**Round-Trip Properties**:
- `decode(encode(x)) == x` (serialization)
- `parse(format(x)) == x` (formatting)
- `decompress(compress(x)) == x` (compression)

**Inverse Properties**:
- `reverse(reverse(list)) == list`
- `negate(negate(x)) == x`
- `decrypt(encrypt(x, key), key) == x`

**Invariant Properties**:
- `sort(list).length == list.length` (sorting preserves length)
- `filter(list, predicate).all(predicate)` (filter satisfies predicate)
- `map(list, f).length == list.length` (map preserves length)

**Idempotence Properties**:
- `f(f(x)) == f(x)` (applying twice = applying once)
- `set.add(x).add(x) == set.add(x)` (adding twice = adding once)

**Commutativity Properties**:
- `a + b == b + a`
- `set1.union(set2) == set2.union(set1)`

**How to write it**:
```
## Property-Based Testing

### Test: [Property Name]

**Generator**: [How to generate test inputs]
```
[Pseudocode for generator]
```

**Property Test**:
```
[Pseudocode for property test]
```

**Invariants**:
- Invariant 1
- Invariant 2

**Shrinking**: [How to minimize failing examples]
```

**Example**:
```
## Property-Based Testing

### Test: Token Validation Consistency

**Generator**: Generate valid and invalid tokens
```python
def generate_token():
  user_id = random_uuid()
  exp = random_timestamp(past=0.3, future=0.7)  # 30% expired
  token = sign_jwt({userId: user_id, exp: exp})
  return (token, exp > now())  # (token, should_be_valid)
```

**Property Test**:
```python
@given(generate_token())
def test_validation_consistency(token, should_be_valid):
  result1 = auth_service.validateToken(token)
  result2 = auth_service.validateToken(token)
  
  # Property: Validation is deterministic
  assert result1.isValid == result2.isValid
  assert result1.isValid == should_be_valid
  
  # Property: Valid tokens return user data
  if result1.isValid:
    assert result1.userId is not None
  else:
    assert result1.error is not None
```

**Invariants**:
- Validation result is deterministic (same token → same result)
- Valid tokens always include user payload
- Invalid tokens always include error reason
- Validation never throws exceptions (returns error result)

**Shrinking**: If test fails, shrink to minimal failing token payload
```

---

### 3.3 Test Coverage Plan

**Purpose**: Ensure comprehensive testing across all layers.

**Depth by Project Type**:
- **Minimal**: List test types needed (unit, integration)
- **Standard**: Define coverage targets and key scenarios
- **Comprehensive**: Full test pyramid with performance and security tests

**What to include**:
- Unit test coverage targets
- Integration test scenarios
- End-to-end test flows
- Performance test criteria
- Security test cases

**The Test Pyramid**:

```
        /\
       /E2E\      <- Few, slow, expensive (critical user flows)
      /------\
     /  INT   \   <- Some, moderate speed (component interactions)
    /----------\
   /    UNIT    \ <- Many, fast, cheap (individual functions/classes)
  /--------------\
```

**Domain-Specific Testing Strategies**:

**For Web APIs**:
- Unit: Business logic, validation, utilities
- Integration: Database queries, external API calls
- E2E: Full request-response cycles
- Contract: API schema validation (OpenAPI, JSON Schema)
- Load: Throughput and latency under load

**For Frontend Applications**:
- Unit: Utility functions, hooks, state management
- Component: Individual component behavior (React Testing Library)
- Integration: Component interactions, routing
- E2E: User flows (Playwright, Cypress)
- Visual: Screenshot regression (Percy, Chromatic)
- Accessibility: WCAG compliance (axe-core)

**For Data Pipelines**:
- Unit: Transformation functions, validation logic
- Integration: End-to-end pipeline with test data
- Data Quality: Schema validation, null checks, range checks
- Performance: Processing time for various data volumes
- Idempotency: Running pipeline twice produces same result

**For Mobile Apps**:
- Unit: Business logic, view models
- UI: Screen rendering and interactions
- Integration: API communication, local storage
- E2E: Critical user flows on real devices
- Performance: App startup time, memory usage, battery drain

**How to write it**:
```
## Test Coverage

### Unit Tests
**Target Coverage**: 80% line coverage, 100% critical path

**Focus Areas**:
- Module 1: [Specific functions/classes]
- Module 2: [Specific functions/classes]

### Integration Tests
**Scenarios**:
1. Scenario description
2. Scenario description

### End-to-End Tests
**User Flows**:
1. Flow description
2. Flow description

### Performance Tests
**Criteria**:
- Metric 1: Target value
- Metric 2: Target value

### Security Tests
**Cases**:
- Test case 1
- Test case 2
```

---

## Section 4: Non-Functional Requirements (REQUIRED for Standard/Comprehensive)

### 4.1 Performance Requirements

**When to include**:
- ✅ User-facing applications (response time matters)
- ✅ High-throughput systems (scalability matters)
- ✅ Resource-constrained environments (efficiency matters)
- ❌ Internal tools with few users
- ❌ Batch jobs without time constraints

**Depth by Project Type**:
- **Minimal**: Skip unless performance is critical
- **Standard**: Define key metrics and targets
- **Comprehensive**: Add load testing strategy, capacity planning, optimization roadmap

**What to include**:
- Response time targets
- Throughput requirements
- Resource utilization limits
- Scalability considerations

**Domain-Specific Performance Metrics**:

**For Web Applications**:
- Page load time: < 2s (p95)
- Time to Interactive (TTI): < 3s
- First Contentful Paint (FCP): < 1s
- API response time: < 200ms (p95)
- Concurrent users supported: 10,000

**For Mobile Apps**:
- App startup time: < 2s (cold start)
- Screen transition: < 100ms
- Network request timeout: 30s
- Battery drain: < 5% per hour of active use
- App size: < 50MB

**For Data Processing**:
- Batch processing time: < 1 hour for daily batch
- Streaming latency: < 5s end-to-end
- Throughput: 10,000 records/second
- Memory usage: < 4GB per worker

**For APIs**:
- Throughput: 1,000 requests/second
- Latency: p50 < 50ms, p95 < 200ms, p99 < 500ms
- Error rate: < 0.1%
- Availability: 99.9% uptime

**How to write it**:
```
## Performance Requirements

### Response Times
- Endpoint/Operation: Target latency (p50, p95, p99)

### Throughput
- Operation: Requests per second target

### Resource Limits
- Memory: Maximum usage
- CPU: Target utilization
- Storage: Growth projections

### Scalability
- Horizontal scaling strategy
- Vertical scaling limits
- Bottleneck identification
```

---

### 4.2 Security Considerations

**When to include**:
- ✅ ALWAYS for user-facing applications
- ✅ ALWAYS when handling sensitive data
- ✅ ALWAYS for authentication/authorization
- ⚠️ Even internal tools need basic security

**Depth by Project Type**:
- **Minimal**: List authentication method and data protection basics
- **Standard**: Full security model with threat analysis
- **Comprehensive**: Add penetration testing plan, compliance requirements, security audit checklist

**What to include**:
- Authentication mechanisms
- Authorization model
- Data encryption (at rest, in transit)
- Security best practices
- Compliance requirements

**Domain-Specific Security Considerations**:

**For Web Applications**:
- HTTPS/TLS 1.3 for all traffic
- CSRF protection (tokens, SameSite cookies)
- XSS prevention (CSP, input sanitization)
- SQL injection prevention (parameterized queries)
- Rate limiting and DDoS protection
- Secure session management
- CORS policy

**For APIs**:
- Authentication: OAuth 2.0, JWT, API keys
- Authorization: RBAC, ABAC, scope-based
- Input validation and sanitization
- Output encoding
- API versioning and deprecation
- Audit logging

**For Mobile Apps**:
- Secure storage (Keychain, Keystore)
- Certificate pinning
- Jailbreak/root detection
- Code obfuscation
- Biometric authentication
- Secure communication (TLS)

**For Data Systems**:
- Encryption at rest (AES-256)
- Encryption in transit (TLS)
- PII data masking/anonymization
- Access control (least privilege)
- Data retention and deletion policies
- Audit trails

**How to write it**:
```
## Security

### Authentication
- Mechanism: [How users authenticate]
- Token format: [JWT, session, etc.]
- Token lifetime: [Duration]

### Authorization
- Model: [RBAC, ABAC, etc.]
- Permission structure: [How permissions are defined]

### Data Protection
- In transit: [TLS version, cipher suites]
- At rest: [Encryption algorithm]
- Sensitive data: [PII handling, masking]

### Security Best Practices
- Practice 1
- Practice 2

### Compliance
- Standard 1: How we comply
- Standard 2: How we comply
```

---

### 4.3 Monitoring & Observability

**When to include**:
- ✅ Production systems (always need monitoring)
- ✅ Distributed systems (observability is critical)
- ⚠️ Even simple apps benefit from basic logging

**Depth by Project Type**:
- **Minimal**: Basic logging strategy
- **Standard**: Metrics, logging, alerting
- **Comprehensive**: Full observability with tracing, SLOs, runbooks

**What to include**:
- Metrics to track
- Logging strategy
- Alerting rules
- Debugging capabilities

**The Three Pillars of Observability**:

**1. Metrics** (What is happening?):
- System metrics: CPU, memory, disk, network
- Application metrics: Request rate, error rate, latency
- Business metrics: Sign-ups, conversions, revenue

**2. Logs** (What happened?):
- Structured logging (JSON format)
- Log levels (DEBUG, INFO, WARN, ERROR, FATAL)
- Correlation IDs for request tracing
- PII redaction

**3. Traces** (Where is time spent?):
- Distributed tracing (OpenTelemetry, Jaeger)
- Span instrumentation
- Service dependency mapping
- Latency breakdown

**Domain-Specific Monitoring**:

**For Web APIs**:
- Request rate (requests/second)
- Error rate (4xx, 5xx)
- Latency (p50, p95, p99)
- Active connections
- Database query time
## Efficient Design Document Creation Process

### Manual Approach (Step 1-7)

### Step 1: Understand Requirements (15-30 min)
1. Read requirements.md thoroughly
2. Identify user stories and acceptance criteria
3. Extract correctness properties (what must always be true)
4. Note any ambiguities or questions

**Tip**: Start with a rough sketch, then refine. Don't aim for perfection on first pass.

### Step 2: Choose Design Depth (5 min)
Use the decision tree below to determine how detailed your design should be.

### Step 3: High-Level Design (30-60 min)
1. Sketch system architecture (components and interactions)
2. Define data models (entities and relationships)
3. Design API contracts (endpoints or function signatures)
4. Select technology stack (with rationale)

**Tip**: Start with a rough sketch, then refine. Don't aim for perfection on first pass.

### Step 4: Low-Level Design (30-120 min, if needed)
1. Define module/class structure
2. Describe complex algorithms
3. Document state management (if stateful)
4. Define error handling strategy

**Tip**: Focus on the "interesting" parts. Skip obvious CRUD operations.

### Step 5: Correctness & Testing (30-60 min)
1. List correctness properties (safety, liveness, invariants)
2. Define property-based testing strategy
3. Plan test coverage (unit, integration, e2e)

**Tip**: This is the most important section. Spend time here.

### Step 6: Non-Functional Requirements (15-45 min, if needed)
1. Define performance targets (if applicable)
2. Document security considerations (always important)
3. Plan monitoring and observability

### Step 7: Review & Refine (15-30 min)
1. Go through the checklist above
2. Fill in gaps
3. Remove unnecessary details
4. Ensure consistency

**Total Time Estimate**:
- Minimal Design: 1-2 hours
- Standard Design: 3-5 hours
- Comprehensive Design: 1-3 days

---

### AES-Assisted Approach (Recommended)

### Step 1: Request Design Scaffold (5 min)
```
"Generate design scaffold from requirements.md"
```

The AES will:
1. Load requirements.md
2. Run Layer 1.5 parliamentary analysis (13 domains)
3. Generate design.md with:
   - Architecture recommendations (D03)
   - API patterns (D03 + D08)
   - Correctness properties (D09 + D10)
   - Technology choices (D07)
   - Testing strategy (D07 + D09)
   - [PLACEHOLDER] markers for your decisions

### Step 2: Review AES Recommendations (15-30 min)
1. Read each section's AES-generated content
2. Review domain perspectives and rationale
3. Note wildcard challenges (contrarian views)
4. Identify placeholders requiring your input

### Step 3: Fill Placeholders & Refine (30-90 min)
1. Make decisions for [PLACEHOLDER] items
2. Adjust recommendations based on your expertise
3. Add domain-specific details AES couldn't infer
4. Resolve any conflicts between domain recommendations

### Step 4: Request AES Review (10 min)
```
"Review design.md for gaps and inconsistencies"
```

The AES will:
1. Check completeness against requirements
2. Validate correctness properties
3. Identify missing edge cases
4. Flag potential issues from each domain perspective

### Step 5: Iterate (15-30 min)
1. Address AES feedback
2. Refine based on wildcard challenges
3. Ensure all requirements are covered

**Total Time Estimate**:
- Minimal Design: 30-60 minutes
- Standard Design: 1-2 hours
- Comprehensive Design: 3-6 hours

**Time Savings**: 50-70% compared to manual approach

---

## AES Integration: How It Works

### Input: requirements.md
The AES reads your requirements and extracts:
- User stories → Identifies components and interactions
- Acceptance criteria → Derives API contracts and validation rules
- Correctness properties → Generates test strategies
- Constraints → Informs technology choices

### Processing: Parliamentary Analysis
The AES runs your requirements through 13 domains:

**Layer 1.5 Analysis** (Default for design generation):
- All 13 compressed domains loaded
- Primary domain (D03 Infrastructure) loaded in full
- Cross-domain override triggers checked
- Wildcard challenges executed

**Domain Contributions**:
1. **D01 Strategy**: Cost implications, resource allocation
2. **D02 Ecosystem**: Market patterns, competitive analysis
3. **D03 Infrastructure**: Architecture, scalability, deployment
4. **D04 Cognition**: API naming, error messages, DX
5. **D05 AI Integration**: LLM features, prompt patterns (if applicable)
6. **D06 Product Design**: UI patterns, accessibility
7. **D07 Open Source**: Technology choices, testing tools
8. **D08 Systems UX**: Information architecture, user flows
9. **D09 Mathematics**: Algorithms, correctness properties
10. **D10 Security**: Auth, encryption, threat modeling
11. **D11 DevOps**: CI/CD, monitoring, deployment
12. **D12 Complexity**: Simplification, unnecessary layers
13. **D13 Unconventional**: Creative alternatives, anti-slop

### Output: design.md Scaffold
The AES generates a design document with:
- **Recommendations**: Specific, actionable design choices
- **Rationale**: Which domains contributed and why
- **Wildcard Challenges**: Contrarian perspectives to consider
- **Trade-offs**: What was considered and why recommendation won
- **[PLACEHOLDER]**: Decisions requiring your expertise
## Next Steps After Completing Your Design

Once you've written your design document:

### Manual Approach
1. **Self-Review**: Go through the checklist above
2. **Peer Review**: Have someone else read it for clarity
3. **Requirements Alignment**: Verify every requirement is addressed
4. **Request AES Review**: "Review design.md for gaps and inconsistencies"

### AES-Assisted Approach
1. **Request AES Review**: "Review design.md for gaps and inconsistencies"
2. **Address Feedback**: Refine based on multi-domain analysis
3. **Resolve Wildcards**: Consider contrarian challenges
4. **Request Task Generation**: "Generate tasks.md from design.md"

### What the AES Can Help With

**Design Review**:
- Identify gaps or inconsistencies
- Validate correctness properties
- Check requirements coverage
- Flag potential issues from each domain (including custom agents if available)

**Design Refinement**:
- Strengthen correctness properties
- Suggest alternative approaches
- Identify missing edge cases
- Recommend domain-specific improvements (leveraging custom agents)

**Design Generation with Custom Agents**:
- If customization phase completed, custom agents (C1+) participate in design
- Specialized domain expertise applied to architecture, API design, security
- Distilled patterns automatically referenced in recommendations
- Domain-specific veto conditions enforced

**Task Generation**:
- Break design into implementable tasks
- Prioritize tasks by dependencies
- Estimate complexity
- Generate test strategies (with custom agent validation)

---

## Integration with Spec Workflow Pipeline

This design document is the third step in the enhanced 5-phase spec-driven development workflow:

```
1. requirements.md (completed)
   ↓
2. customization.md (optional - if domain-specific needs)
   ↓
3. design.md (you create OR AES generates scaffold) ← YOU ARE HERE
   ↓
4. tasks.md (AES generates from design)
   ↓
5. [Implementation begins]
```

### The 5-Phase Pipeline

**Phase 1: Requirements** (Completed)
- Problem statement, user stories, acceptance criteria
- Correctness properties, constraints, success metrics

**Phase 2: Customization** (Optional - May Be Completed)
- Domain analysis identified expertise gaps
- Custom agents created (e.g., C1 Healthcare, C2 Finance)
- Patterns distilled into reusable knowledge
- **Impact on Design**: Custom agents participate in design generation, providing specialized domain expertise

**Phase 3: Design** (YOU ARE HERE)
- Generate architecture and technical design
- Leverage custom agents (if created in Phase 2)
- Apply distilled patterns from customization
- Define implementation approach
- **With Customization**: Design benefits from specialized domain knowledge
- **Without Customization**: Design uses 16 core domains only

**Phase 4: Tasks**
- Break design into implementable tasks
- Prioritize by dependencies
- Custom agents validate task breakdown
- Generate test strategies

**Phase 5: Development**
- Implement tasks
- Custom agents available for questions
- Reference distilled patterns in code
- Validate against correctness properties

### How Customization Enhances Design

If customization phase was completed, your design generation benefits from:

**Custom Agents Participate**:
- C1+ agents provide specialized domain expertise
- Override triggers activate for domain-specific topics
- Veto conditions enforce domain requirements
- Multiple perspectives enrich design decisions

**Distilled Patterns Applied**:
- Reusable patterns inform architecture choices
- Domain-specific templates guide API design
- Best practices embedded in recommendations

**Example**: Healthcare project with C1 Healthcare Compliance agent
- C1 participates in architecture design (HIPAA-compliant infrastructure)
- C1 validates API design (PHI protection, minimum necessary principle)
- PHI Handling Pattern applied to data model design
- Audit Trail Pattern guides logging implementation

### Workflow Options

**Option A: Fully Manual**
1. Complete requirements.md
2. (Optional) Complete customization.md
3. Write design.md manually (this guide)
4. Request AES to generate tasks.md

**Option B: AES-Assisted (Recommended)**
1. Complete requirements.md
2. (Optional) Request AES customization analysis
3. Request AES to generate design.md scaffold
4. Fill placeholders and refine
5. Request AES to generate tasks.md

**Option C: Iterative Refinement**
1. Complete requirements.md
2. (Optional) Complete customization.md
3. Write initial design.md manually
4. Request AES review and refinement
5. Iterate based on feedback
6. Request AES to generate tasks.md

--- not necessarily optimal. Consider benchmarking alternatives.

[PLACEHOLDER: Confirm Node.js or specify alternative with rationale]

### Framework
**Recommendation**: None (vanilla Node.js)
**Rationale**:
- D12 Complexity: Requirements solvable in <200 lines, framework adds overhead
- D01 Strategy: Avoid framework lock-in for portable layer
- D07 Open Source: Reduce dependency count and maintenance burden

**Wildcard Challenge (D07 Code Anarchist)**:
Express has 10M weekly downloads and solves routing/middleware. 30 lines of 
custom code vs battle-tested library - prove custom is better.

[PLACEHOLDER: Confirm no framework or specify framework with justification]
```

--- ] All requirements have corresponding design elements
- [ ] All user stories are addressed in the design
- [ ] All acceptance criteria can be verified through the design
- [ ] All correctness properties have verification strategies
- [ ] Technology choices are documented and justified

### Clarity
- [ ] Technical terms are defined or commonly understood
- [ ] Diagrams/examples clarify complex concepts
- [ ] Design decisions include rationale
- [ ] Ambiguities are resolved or explicitly noted as open questions

### Implementability
- [ ] Design is detailed enough to start coding
- [ ] Module boundaries are clear
- [ ] Dependencies are identified
- [ ] Technology choices are justified and available
- [ ] File/folder structure is defined

### Testability
- [ ] Each component can be tested in isolation
- [ ] Integration points have test strategies
- [ ] Property-based tests are defined for correctness properties
- [ ] Performance criteria are measurable
- [ ] Error scenarios are testable

### Consistency
- [ ] Naming conventions are consistent
- [ ] API patterns are consistent
- [ ] Error handling is consistent
- [ ] Data models align across components
- [ ] Terminology is used consistently

### Right-Sized for Project
- [ ] Level of detail matches project complexity
- [ ] No over-engineering for simple features
- [ ] Sufficient detail for complex features
- [ ] Domain-specific considerations are addressed

---

## Efficient Design Document Creation Process

### Step 1: Understand Requirements (15-30 min)
1. Read requirements.md thoroughly
2. Identify user stories and acceptance criteria
3. Extract correctness properties (what must always be true)
4. Note any ambiguities or questions

### Step 2: Choose Design Depth (5 min)
Use the decision tree below to determine how detailed your design should be.

### Step 3: High-Level Design (30-60 min)
1. Sketch system architecture (components and interactions)
2. Define data models (entities and relationships)
3. Design API contracts (endpoints or function signatures)
4. Select technology stack (with rationale)

**Tip**: Start with a rough sketch, then refine. Don't aim for perfection on first pass.

### Step 4: Low-Level Design (30-120 min, if needed)
1. Define module/class structure
2. Describe complex algorithms
3. Document state management (if stateful)
4. Define error handling strategy

**Tip**: Focus on the "interesting" parts. Skip obvious CRUD operations.

### Step 5: Correctness & Testing (30-60 min)
1. List correctness properties (safety, liveness, invariants)
2. Define property-based testing strategy
3. Plan test coverage (unit, integration, e2e)

**Tip**: This is the most important section. Spend time here.

### Step 6: Non-Functional Requirements (15-45 min, if needed)
1. Define performance targets (if applicable)
2. Document security considerations (always important)
3. Plan monitoring and observability

### Step 7: Review & Refine (15-30 min)
1. Go through the checklist above
2. Fill in gaps
3. Remove unnecessary details
4. Ensure consistency

**Total Time Estimate**:
- Minimal Design: 1-2 hours
- Standard Design: 3-5 hours
- Comprehensive Design: 1-3 days

---

## Design Depth Decision Tree

```
START: What are you building?

├─ Simple CRUD feature?
│  ├─ Few edge cases?
│  │  └─ → MINIMAL DESIGN
│  └─ Complex validation/business rules?
│     └─ → STANDARD DESIGN
│
├─ Integration with external systems?
│  ├─ Single integration, well-documented API?
│  │  └─ → STANDARD DESIGN
│  └─ Multiple integrations or complex protocols?
│     └─ → COMPREHENSIVE DESIGN
│
├─ Complex business logic?
│  ├─ Moderate complexity, few edge cases?
│  │  └─ → STANDARD DESIGN
│  └─ High complexity, many edge cases, critical correctness?
│     └─ → COMPREHENSIVE DESIGN
## Conclusion

This guide provides a **scalable framework** for creating design documents that work across all project types and domains. The key principles:

1. **Right-size your design**: Match detail level to project complexity
2. **Focus on correctness**: Always define what "correct" means
3. **Be domain-aware**: Apply domain-specific patterns and considerations
4. **Make it actionable**: Design should enable straightforward implementation
5. **Enable verification**: Every design element should be testable

**Universal applicability comes from**:
- Flexible depth levels (Minimal/Standard/Comprehensive)
- Domain-specific guidance for common project types
- Focus on correctness properties (works for any domain)
- Structured but adaptable template

**Efficiency comes from**:
- Clear decision tree for choosing design depth
- Time estimates for each section
- Focus on "interesting" parts, skip obvious details
- Iterative refinement process
- **AES-assisted generation** (50-70% time savings)

**AES Integration Benefits**:
- Multi-perspective analysis (13 domains)
- Wildcard challenges prevent groupthink
- Initiative-specific recommendations (not generic)
- Automated scaffold generation
- Cross-domain consistency validation

A well-crafted design document bridges requirements and implementation. It forces you to think through technical challenges before coding, identifies issues early, and serves as a reference throughout development.

**Recommended Workflow**:
1. Complete requirements.md (use Requirements Guide)
2. (Optional) Request AES customization analysis
3. (Optional) Create custom agents and distillations if needed
4. Request AES to generate design.md scaffold (with custom agents if available)
5. Fill placeholders with your expertise
6. Request AES review for gaps
7. Iterate based on feedback
8. Request AES to generate tasks.md

**Manual Workflow** (if you prefer full control):
1. Complete requirements.md
2. (Optional) Complete customization.md
3. Follow this guide to create design.md manually
4. Request AES review for refinement
5. Request AES to generate tasks.md

When you're ready, the AES can help you:
- Generate design scaffold from requirements
- Review and refine your design
- Identify gaps or inconsistencies
- Strengthen correctness properties
- Generate detailed, actionable task list
- Suggest domain-specific improvements

Good luck with your design document!
### 7. Link to Requirements
Explicitly reference which requirements each design element addresses. This ensures nothing is missed.

### 8. Be Specific About Correctness
Don't just say "the system should be secure" - define specific properties like "tokens expire after 1 hour" or "passwords are hashed with bcrypt cost factor 12".

---

## Common Pitfalls to Avoid

### 1. Too Abstract
❌ "The system will use a database"
✅ "PostgreSQL 14 will store user data with JSONB columns for flexible attributes"

### 2. Too Detailed Too Soon
❌ Including every line of code in pseudocode
✅ Describing algorithm logic and key decision points

### 3. Missing the "Why"
❌ "We'll use Redis"
✅ "We'll use Redis for session storage because it provides sub-millisecond latency and built-in TTL for automatic session expiration"

### 4. Ignoring Edge Cases
❌ Only describing the happy path
✅ Documenting error scenarios, race conditions, and boundary cases

### 5. Inconsistent Terminology
❌ Using "user", "account", "profile" interchangeably
✅ Defining terms once and using them consistently

### 6. Vague Correctness Properties
❌ "The system should be reliable"
✅ "Every successful login must create exactly one session record that expires after 24 hours of inactivity"

---

## Next Steps After Completing Your Design

Once you've written your design document:

1. **Self-Review**: Go through the checklist above
2. **Peer Review**: Have someone else read it for clarity
3. **Requirements Alignment**: Verify every requirement is addressed
4. **Bring to Agent**: Share your design.md for refinement and task list generation

The agent can help you:
- Identify gaps or inconsistencies
- Refine correctness properties
- Generate a detailed task list for implementation
- Suggest improvements based on best practices

---

## Example Design Document Template

Use this template as a starting point. Delete sections that don't apply to your project.

```markdown
# Design Document: [Feature Name]

## 1. High-Level Design

### 1.1 System Architecture
[Describe components and how they interact]

**Components**:
- Component 1: Responsibility
- Component 2: Responsibility

**Interactions**:
[How components communicate]

**External Dependencies**:
- Dependency 1: Purpose

### 1.2 Data Models
[Define entities and relationships]

#### Entity: [Name]
**Attributes**:
- `field_name` (type, constraints): Description

**Relationships**:
- Relationship description

**Validation**:
- Rule 1
- Rule 2

### 1.3 API Design / Interface Contracts
[Define endpoints or function signatures]

#### Endpoint: [METHOD] /path
**Purpose**: [What it does]

**Request**:
```json
{
  "field": "type"
}
```

**Response**:
```json
{
  "field": "type"
}
```

**Errors**:
- 400: Invalid input
- 404: Not found

### 1.4 Technology Stack
**Language**: [Choice] - [Rationale]
**Framework**: [Choice] - [Rationale]
**Database**: [Choice] - [Rationale]
**Key Libraries**:
- Library 1: Purpose
- Library 2: Purpose

---

## 2. Low-Level Design (Optional for simple features)

### 2.1 Module Structure
[File organization and key classes/functions]

**Module**: `path/to/module`
- `ClassName`: Responsibility
- `functionName()`: Purpose

### 2.2 Algorithms & Logic (Only if complex)
[Describe non-obvious algorithms]

**Algorithm**: [Name]
**Steps**:
1. Step 1
2. Step 2

**Edge Cases**:
- Case 1: Handling
- Case 2: Handling

### 2.3 State Management (Only if stateful)
[Describe state transitions]

**States**: State1, State2, State3
**Transitions**:
- State1 → State2: Trigger

### 2.4 Error Handling
[How errors are handled]

**Error Types**:
- ErrorType1: User message, recovery strategy
- ErrorType2: User message, recovery strategy

**Logging**: [Strategy]
**Retry Logic**: [Strategy]

---

## 3. Correctness Properties & Testing

### 3.1 Correctness Properties
[What must always be true]

#### Property: [Name]
**Type**: Safety / Liveness / Invariant
**Statement**: [Plain language description]
**Verification**: [How to test]

#### Property: [Name]
**Type**: Safety / Liveness / Invariant
**Statement**: [Plain language description]
**Verification**: [How to test]

### 3.2 Property-Based Testing
[PBT strategy for key properties]

**Test**: [Property Name]
**Generator**: [How to generate test inputs]
**Property**: [What to verify]
**Invariants**:
- Invariant 1
- Invariant 2

### 3.3 Test Coverage
[Testing strategy]

**Unit Tests**:
- Module 1: Focus areas
- Module 2: Focus areas

**Integration Tests**:
- Scenario 1
- Scenario 2

**E2E Tests**:
- User flow 1
- User flow 2

---

## 4. Non-Functional Requirements (Optional for simple features)

### 4.1 Performance
**Response Time**: Target
**Throughput**: Target
**Scalability**: Strategy

### 4.2 Security
**Authentication**: Method
**Authorization**: Model
**Data Protection**: Strategy
**Compliance**: Requirements

### 4.3 Monitoring
**Metrics**:
- Metric 1: Threshold
- Metric 2: Threshold

**Logging**: Strategy
**Alerts**: Conditions

---

## 5. Implementation Notes (Optional)

### 5.1 Migration Strategy (If updating existing system)
[How to migrate from old to new]

### 5.2 Rollout Plan
[Deployment approach]

### 5.3 Rollback Plan
[How to revert if needed]

### 5.4 Open Questions
[Unresolved issues to address during implementation]
```

---

## Conclusion

This guide provides a **scalable framework** for creating design documents that work across all project types and domains. The key principles:

1. **Right-size your design**: Match detail level to project complexity
2. **Focus on correctness**: Always define what "correct" means
3. **Be domain-aware**: Apply domain-specific patterns and considerations
4. **Make it actionable**: Design should enable straightforward implementation
5. **Enable verification**: Every design element should be testable

**Universal applicability comes from**:
- Flexible depth levels (Minimal/Standard/Comprehensive)
- Domain-specific guidance for common project types
- Focus on correctness properties (works for any domain)
- Structured but adaptable template

**Efficiency comes from**:
- Clear decision tree for choosing design depth
- Time estimates for each section
- Focus on "interesting" parts, skip obvious details
- Iterative refinement process

A well-crafted design document bridges requirements and implementation. It forces you to think through technical challenges before coding, identifies issues early, and serves as a reference throughout development.

**Next Steps**:
1. Read your requirements.md thoroughly
2. Use the decision tree to choose design depth
3. Follow the efficient creation process (Step 1-7)
4. Use the template as a starting point
5. Apply domain-specific considerations
6. Go through the checklist
7. Bring your design.md back for refinement and task generation

When you're ready, I can help you:
- Review and refine your design
- Identify gaps or inconsistencies
- Strengthen correctness properties
- Generate a detailed, actionable task list
- Suggest domain-specific improvements