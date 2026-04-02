# InfraTales License Policy

InfraTales repositories must not present ambiguous or misleading license information.

## Core rule

The README, repository metadata, badges, package metadata, and LICENSE file must all agree.

If they do not agree, the repository is not public-ready.

## Allowed licensing approaches

InfraTales repositories must choose one of the following models:

### 1. Open source license

Use a recognized open source license such as:

- MIT
- Apache-2.0
- MPL-2.0

If this model is chosen:

- the LICENSE file must contain the actual standard license text
- README badges and text must name the same license
- package metadata must use the same license identifier
- no extra branding or attribution restrictions may be injected into the software license text

Brand protection must be handled separately through trademark policy, not by modifying the software license.

### 2. Source-available license

If InfraTales chooses a custom or restrictive license, the repository must say so clearly.

If this model is chosen:

- the repository must not use MIT, Apache, or other standard open-source badges unless true
- the README must explicitly describe the repository as source-available, not open source
- package metadata must match the actual license
- contribution expectations must reflect the more restrictive model

## Prohibited states

The following are not allowed:

- MIT badge with non-MIT LICENSE
- package.json license field that conflicts with LICENSE
- README language implying standard open source when the license is custom
- hidden attribution requirements not reflected clearly in repo docs

## Reviewer checklist

Before publishing, verify:

- LICENSE file is correct
- README badges are correct
- README text is correct
- package metadata is correct
- organization-level messaging is correct

## Recommendation

For serious public adoption, InfraTales should prefer a standard open source license for code and handle brand protection through trademark policy and attribution guidelines outside the code license.
