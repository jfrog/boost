# JFrog Boost Terms of Use

Last Updated: April 5, 2026

This JFrog Boost Terms of Use (this "Agreement"), made by and between
JFrog Ltd. ("JFrog") and you ("Customer"), governs access to and use of
the JFrog Boost command-line tool and associated GitHub Action
(collectively, "Boost") and documentation ("Documentation").

**BY INSTALLING, DOWNLOADING, OR USING BOOST, CUSTOMER: (A) ACKNOWLEDGES
THAT IT HAS READ AND UNDERSTANDS THIS AGREEMENT; (B) REPRESENTS AND
WARRANTS THAT IT HAS THE RIGHT, POWER, AND AUTHORITY TO ENTER INTO THIS
AGREEMENT; AND (C) ACCEPTS THIS AGREEMENT AND AGREES THAT IT IS LEGALLY
BOUND BY ITS TERMS.**

## 1. License Grant

Subject to the terms of this Agreement, JFrog grants Customer a
non-exclusive, non-transferable, non-sublicensable, revocable, limited
license to install and use Boost solely for Customer's internal
development and CI/CD purposes, in accordance with this Agreement and the
Documentation.

## 2. Restrictions

Customer will not, directly or indirectly, or permit any third party to:

(a) use Boost for the purpose of building, improving, enhancing, or
providing a competitive product or service;

(b) sublicense, assign, publish, resell, transfer, distribute, pledge,
loan, lease, market, rent, or make available Boost to any third party,
except to Customer's authorized employees and contractors;

(c) translate, reverse-translate, decipher, decode, disassemble,
reverse-engineer, or otherwise attempt to discover the source code or
underlying algorithms of Boost;

(d) copy, modify, or create derivative works of Boost or Documentation;

(e) use Boost, its output, or any data derived from Boost as training
data for machine learning models, artificial intelligence systems, or
any automated data processing system;

(f) remove, delete, obscure, or alter any proprietary notices, labels,
or marks on Boost or Documentation;

(g) use Boost in any manner that violates applicable laws or regulations.

## 3. Data Collection and Telemetry

Boost collects anonymous usage telemetry to improve product quality and
performance. **No source code, file contents, environment variables, or
personal data are collected.** The following categories of data may be
transmitted:

- **Command metadata**: command name (e.g. "cargo build", "git status"),
  subcommand arguments, exit code, and execution duration
- **Token savings metrics**: byte counts of standard output before and
  after filtering (measures compression effectiveness)
- **Environment metadata**: operating system, CPU architecture, Boost
  binary version
- **Error indicators**: boolean error flag and error category (not error
  message content)
- **Session identifiers**: conversation ID and run ID for grouping
  related commands within a single session
- **Process metadata**: process ID (for span correlation only)
- **CI metadata** (when running in CI): Docker build configuration
  flags, cache settings, platform targets (no image contents or
  build secrets)

Telemetry data is transmitted via OpenTelemetry (OTLP/gRPC) to JFrog's
observability infrastructure. Telemetry is only transmitted for commands
that exceed a minimum duration threshold.

Customer may disable remote telemetry by setting the environment variable
`BOOST_OTEL_REMOTE=false` or by not bundling telemetry tokens at build
time.

## 4. Intellectual Property

JFrog retains all right, title, and interest in and to Boost, including
all intellectual property rights. No rights are granted to Customer other
than as expressly set forth in this Agreement.

## 5. Disclaimer of Warranties

BOOST IS PROVIDED "AS IS" AND "AS AVAILABLE." JFROG DISCLAIMS ALL
WARRANTIES, EXPRESS OR IMPLIED, INCLUDING THE IMPLIED WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND
NON-INFRINGEMENT. JFROG DOES NOT WARRANT THAT BOOST WILL BE
UNINTERRUPTED, ERROR-FREE, OR SECURE.

## 6. Limitation of Liability

TO THE MAXIMUM EXTENT PERMITTED BY LAW, IN NO EVENT WILL JFROG BE LIABLE
FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE
DAMAGES, OR ANY LOSS OF PROFITS OR REVENUES, WHETHER INCURRED DIRECTLY OR
INDIRECTLY, OR ANY LOSS OF DATA, USE, GOODWILL, OR OTHER INTANGIBLE
LOSSES, ARISING OUT OF OR RELATING TO CUSTOMER'S USE OF BOOST.

## 7. Term and Termination

This Agreement is effective until terminated. JFrog may terminate this
Agreement at any time for any reason. Upon termination, Customer must
cease all use of Boost and destroy all copies in its possession.

## 8. General

This Agreement constitutes the entire agreement between Customer and
JFrog regarding Boost and supersedes all prior agreements. JFrog may
modify this Agreement at any time by posting a revised version. Continued
use of Boost after such modification constitutes acceptance of the
revised terms.
