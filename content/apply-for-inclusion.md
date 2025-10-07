---
title: Apply for Inclusion
---
# Apply for Inclusion

## Last updated: 2025-XX-XX

The Chrome Root Program's primary commitment is to the security of Chrome's users. We are continuously working to improve the baseline of security on the web, and our policies, procedures, and initiatives reflect that goal. Every Certification Authority (CA) in the Chrome Root Store is a critical link in the chain of trust relied upon by Chrome’s billions of users. Any compromise or misoperation by a single CA can have cascading, detrimental effects, with harm not strictly limited to subscribers of the corresponding CA.

Because of this significant and inherent security risk, our Chrome Root Store inclusion application process is, by necessity, exceptionally rigorous. This stringent approach is essential to protecting users. Meeting the minimum technical and audit requirements is the baseline for consideration, but it is not the end of the process. Successful Applicants  must also demonstrate a deep, long-term commitment to maintaining a robust 'security-first' culture and operational practices that measurably contribute to the web's security and resilience. We welcome all organizations that can demonstrate meeting this high standard.

Google includes or removes self-signed root CA certificates in the Chrome Root Store as it deems appropriate at its sole discretion. The selection and ongoing inclusion of CA certificates is done to enhance the security of Chrome. CA certificates included in the Chrome Root Store must provide value to Chrome end users that clearly exceeds the risk of their continued inclusion.

To that end, the Chrome Root Program Policy defines the [minimum requirements](policy) that must be met by CA Owners for both initial and continued inclusion in the Chrome Root Store. The policy is periodically updated to further promote the Chrome Root Program's goals of [security, agility, and simplicity](moving-forward-together). Generally, all pending inclusion applications submitted to Google Chrome in the Common CA Database (CCADB) should adhere to the latest version of the Chrome Root Program Policy, including any specific criteria for Applicants. If an existing inclusion application submitted in the CCADB doesn't meet the requirements of a revised policy or updated Applicant-specific criteria, the  CA Owner should request a reversion of their CCADB case status back to "CA Providing Data." This allows the CA Owner to modify their inclusion application and demonstrate sufficient alignment with the current policy and requirements.

### Inclusion Processing

The Chrome Root Program and corresponding Root Store processes inclusion applications and requests for changes through the CCADB. CA Owners who satisfy all of the requirements in the Chrome Root Program [Policy](policy) may apply.

The application process includes:

1. A CA Owner [requests](https://www.ccadb.org/cas/request-access) and gains access to the CCADB (if not already granted access).
2. A CA Owner adds a root CA certificate to the CCADB and completes one or more “[Add/Update Root Request](https://www.ccadb.org/cas/updates)” cases in the CCADB to populate all tabs (i.e., CA Owner, Audits, Non-Audit Documents, Root Information, and Test Websites) with information.
3. A CA Owner submits a “[Root Inclusion Request](https://www.ccadb.org/cas/inclusion)” case in the CCADB.
4. The Chrome Root Program performs an initial review of the information included in the CCADB to ensure completeness and compliance with the minimum requirements.
5. A [CCADB public discussion](https://www.ccadb.org/cas/public-group) period ensues.
6. The Chrome Root Program performs a detailed review of all information provided in the CCADB and publicly available (to include output from the CCADB public discussion).
7. The Chrome Root Program makes a final determination and communicates it to the CA Owner.

Typically, applications are processed on a first-in, first-out basis, with priority given to those:

* replacing an existing root CA certificate which is already included in the Chrome Root Store and in good standing, and
* whose disclosed and observed operational practices demonstrate the 'security-first' commitment and measurable contributions described above, thereby clearly offsetting the unavoidable risks associated with additional trusted entities.

CA Owners should not anticipate receiving application coaching beyond what is specified on this page and the Chrome Root Program Policy. CA Owners may seek clarification on Chrome Root Program policies or processes, and members of the Chrome Root Program will respond in a timely manner.

The Chrome Root Program takes as much time to process applications as needed to ensure user security, and makes no guarantees on application processing time. The Chrome Root Program may apply additional application review weighting criteria as it sees necessary or valuable to Chrome user security. At any point, the Chrome Root Program may contact the Applicant during its review seeking additional or clarifying information. Applicants are expected to provide the requested information in a timely manner.

### Inclusion Acceptance

Ultimately, in order for a CA Owner’s inclusion application to be accepted, it must clearly and unequivocally demonstrate how their organization meets the high standards defined by the Chrome Root Program. The burden of proof rests entirely on the Applicant to proactively and unequivocally demonstrate this commitment, thereby clearly offsetting the inherent and significant security risks of inclusion. Without such a compelling and verifiable demonstration, in order to uphold Chrome user security and to preserve the integrity of the Chrome Root Store, an application will not be accepted.

While not a comprehensive list, the following behaviors can serve as positive indicators of an Applicant's commitment to promoting security, operational maturity, and serving the broad public web ecosystem:

**Indicators of security best practices and technical leadership**
* Supporting the Automatic Certificate Management Environment (ACME) protocol and the ACME Renewal Information (ARI) extension, complemented by technical controls that encourage cryptographic agility.
* Responsibly operating [Certificate Transparency](https://googlechrome.github.io/CertificateTransparency/) log(s) qualified in Chrome.
* Not relying on "cached" domain validation information during certificate issuance.
* Leveraging operational practices consistent with those described in [Moving Forward, Together](moving-forward-together) at the time of application submission. For example, reliably issuing TLS server authentication certificates that are valid for a much shorter period of time than the maximum validity allowed by the Baseline Requirements for the Issuance and Management of Publicly-Trusted TLS Server Certificates.
* Proactively implementing security controls and operational practices that exceed the minimum requirements established in the CA/Browser Forum TLS Baseline Requirements.

**Indicators of a public-serving mission**
* Supporting subscribers in multiple geographic markets and in multiple native languages.
* Freely-available guidance, help articles, or FAQs to support the user community in requesting/renewing certificates or configuring TLS.
* Issuing certificates to a broad range of entities, beyond just the CA Owner's existing subscriber base or subscribers of its other business offerings.
* Issuing certificates for a broad range of Top-Level Domains (TLDs), not limited to specific or restricted domains.

Actions in this list are only illustrative and do not guarantee inclusion application acceptance.

Root CA certificates approved for distribution will be added to the Chrome Root Store on approximately, but not limited to, a quarterly basis. However, the Chrome Root Program offers no guarantees related to the timeliness of CA certificate distribution.

### Inclusion Rejection

The Chrome Root Program will reject inclusion applications where an Applicant does not meet the minimum requirements defined by the Chrome Root Program [Policy](index) or the application is deemed incomplete or inaccurate.

While the Chrome Root Program may communicate the basis for its decision, all inclusion determinations are made at its sole discretion and are final.

Illustrative factors for application rejection may include:

* A failure to demonstrate broad value for Chrome users and why the benefits of inclusion outweigh the risks to user safety and privacy.
* The CA Owner only satisfies the minimum requirements without demonstrating the deep, long-term commitment to a 'security-first' culture and practices described above.
* The CA Owner's issuance practices are limited exclusively to existing subscribers or subscribers of its other business offerings, thereby not providing broad value to the general Internet ecosystem.
* The CA Owner's issuance is limited to a narrow range of domains (e.g., specific TLDs or organizational domains) rather than providing broad applicability across the Internet.
* A corresponding Public Key Infrastructure (PKI) certificate hierarchy where leaf certificates are not primarily intended to be used for server authentication facilitating a secure connection between a web browser and a corresponding website (e.g., client authentication certificates, Internet of Things (IoT) device certificates, smart cities, transportation, medical devices, etc.).
* A corresponding PKI hierarchy that currently or previously allowed, facilitated, or enabled “Monster in the Middle” (MITM) attacks (either successful or attempted) where a certificate was issued for the purposes of impersonation, interception, or to alter communications.
* Where the corresponding CA Owner has ever been determined to have acted in an untrustworthy manner or created unnecessary ecosystem risk.
* Has an incident history that does not convey the [factors](index#51-incident-reports) significant to Chrome, including weak root cause analysis or unsatisfactory incident reporting.
* Completion of a CCADB root inclusion public discussion that casts doubt over the CA Owners security, honesty or reliability.
* Discovery of false or misleading information provided by the CA Owner.
* Significant delays in response from the CA Owner when seeking additional or clarifying information.
* Demonstrated low active TLS certificate usage, leading to negligible demonstrable impact on ecosystem security. Low thresholds of TLS certificate issuance, observability, and reliance by Chrome users can indicate a minimal practical contribution to the Chrome Root Store.

Actions in this list are only illustrative and considerations for rejection are not limited to this list.

Depending on the reason for application rejection, the Chrome Root Program, at its sole discretion, may:

* require a period of time to elapse before the CA Owner may re-apply, or
* reject all future applications from the CA Owner.
