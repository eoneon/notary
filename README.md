== README

# User story
### Overview
This is an application for notaries (**users**) to track information about their **jobs**. Each job consists of: (i) travelling to an appointment location, (ii) verying the identity of a client (**signers**) and making sure that the signer's name conforms _exactly_ to the name on the underlying document to be notarized (Michale J. Fox !== Mike James Fox), and (iii) confirming the statutory language attached to the signature lines on the document to be notarized conforms _exactly_ to California's statutory language. This statutory language is called a "form" and they are usually embedded in the underlying legal document being notarized. If the language or a signer's name does not conform, the notary strikes through the non-conforming language and physically attaches a conforming "form" with both the signer's name(s) and the name of the legal document inputted. The app's focus pertains to the following features:

1. It performs CRUD operations on jobs in order to keep a record of jobs for tax and accounting purposes
2. It performs CRUD operations on companies that source jobs for the same reasons
3. It generates invoices (printable/emailable) that reference:
    + the notary's name and address to send the bill
    + the agent who facilitated the job if the job is sourced from a company
    + the name of the signer(s) for the job
    + the date of the job
    + line-item services rendered by type, quantity and fee
    + the person or company to bill the job
    + the total due
4. It generates notary forms that reference:
    + the date the signatures were executed and notarized
    + the notary's name, commision number, expiration of commission
    + the name of the signer(s) for the underlying document
    + the name of the underlying document notarized
5. Invoices can be emailed to the party billed
6. Invoices and Notary forms can be printed

#### Clients
**General Public Clients:** For jobs sourced directly from the general public involve a broad set of legal documents. They are often one-time clients and a notary is less concerned with tracking information about them; they usually pay on the spot so there is not need to check the status of payment at a later date.

**Company Clients:** The vast majority of jobs are one's in which the notary is an independent contracter where jobs are either: (i) assigned directly by real estate institutions such as banks, or (ii) assigned indirectly by "signing companies" that act as itermediaries between those real estate instituttions and the notary.

#### Payment Structure
**General Public Clients:** The balance due (total) for these kinds of jobs is determined by the number of signatures notarized, as well as other associated fees (e.g., "travel"). The fee for each signature is capped at $10 by the state of California. So if one signer signs one document, the fee is $10. If a husband and wife both sign a single document, the fee is $20. If that same husband and wife want a notarized duplicate of that document, the fee is $40. The app keep tracks of the notarized document name, and the quantity of signatures to charge. The total fee is the sum of this quantity (multiplied by $10), added to the traveling fee which varies by distance.

**Company Clients:** The payment structure for these jobs is based on a set fee which varies from job to job. There are other reasons for tracking the name for each document in which a client's signature is notarized (see "forms"), but for invoicing purposes the service rendered will just be listed as something general like "loan package". "Travel" or "drop off" might be listed on the invoice as one of the services rendered but it won't be factored in calculating the total.
***
### Application Features
#### Tracking Job Information
The most important feature of the app is to track payment status for all jobs for the purposes of collecting outstanding balances, as well as for tax preparation. This implies being able to create `jobs` and updating their status as being paid, as well as being able to search a user scoped set of jobs based on attributes such as the job's status, date, location, as well as execute searches based on the associated signers (`people`) or `company`.

#### Tracking Company Information
Another important feature is the ability to track `company` information. A notary will usually perform many jobs on behalf of one company. Though an invoice is created for each of these jobs, a company will often make block payments on a monthly basis for all jobs performed in that timeframe. The payment received are often itemized using a job-id that cannot be used to reference a specific job, so the notary generally has to match itemized job-id's to corresponding jobs using the amount and dates.

#### Generating Invoices
Using information from a given job and associated objects - user, service, people (signers & agents), and company, a user is able to print or email an invoice.

#### Generating Notary "Forms"
Using information from a given job and associated objects - user, service, people (signers), a user may print two distinct notary "forms" - an "Acknowledgemts" and a "Jurat". These forms consist of boilerplate legal language that contain statutory language and the signer's name(s), gender, date of signing, the notary's name, commision number and expiration, and the underlying document type.

***

## Models
+ `User`
+ `Job`
+ `Service`
+ `Document`
+ `People`
+ `Company`
+ `Address`
+ `Phone`
+ `Email`
+ `Note`

### `User`
The user is the notary. Using Devise, a user registers with an email, password and username. Beyond the the registration feature, there is an invoicing feature where the user's name and address is populated. There is also feature that creates well notary "forms" which populates a user's notary commision-number and expiration-date. If the app sends emails, the user's name is populated here as well. A user might have multiple addresses, phone numbers and emails depending on the circumstances of a given job.
##### Attributes
+ `:username`
+ `:name`
+ `:email`
+ `:password`
+ `:role`
+ `:commission_no` (commission = license)
+ `:commission_exp`  
##### Associations
+ `has_many` `:phones`
+ `has_many` `:emails`
+ `has_many` `:addresses`
+ `has_many` `:jobs`

### `Job`
A Job represents each individual notary appointment the user performs. In the context of a job, the associated `people` are the individuals who sign the underlying documents to be notarized (signers). Some jobs are sourced from `people`, while others are sourced from a `company`. Jobs are billed accoringly. The location (address) of a job is logged as a matter of law. There are both notary and non-notary related related `service`'s. Some of the notary-related services reference every underlying `document` being notarized. A `note` may be added to a job for the user's sake, or to the invoice for billing.
##### Attributes
+ `:date`
+ `:type`
+ `:count`
+ `:status`
+ `:total`

##### Associations
+ `belongs_to` `:user`
+ `belongs_to` `:bill_to` - not sure about this one
+ `has_many` `:people` (signers)
+ `has_one` `:address` (job location)
+ `has_many` `:services`
+ `has_many` `:documents`
+ `has_many` `:notes`

### `Service`
For invoicing purposes, notary-related services are listed as a "package" regardless of how many documents were notarized. In this case, the fee and total due for the job is based on a predetermined flat fee. A notary may also include non-notarial services such as travel or drop-off, but this will be just informative and won't carry any charge. For jobs sourced from the general public, each notarial service will be listed as a line-item with the name of the specific underlying legal document being notarized. The fees for this job are generated by the quantity of signatures on notarized documents.
##### Attributes
+ `:type`
+ `:qauntity`
+ `:fee`
##### Associations
+ `belongs_to` `:job`
+ `has_many` `:documents`

### `People`
There are two contexts for people - the signers of the underlying notary documents for each job, and the agents (or in some cases principles) of the lending institutions who facilitate jobs. There are generally new singers for each job, while agents are reoccuring and are associated with a given company. In the context where an instance of `people` is the principle of a `company`, they are the ones who are billed. In the context where the `people` instance is a client from the general public, they as a signer are the one's who are billed. In the context where the `people` instance is an agent for a `company`, they are referenced on the invoice, but the `company` is billed.
##### Attributes
+ `:name`
+ `:gender`
##### Associations
+ `belongs_to` `:job` (signers)
+ `has_many` `:phones`
+ `has_many` `:emails`

### `Company`
Notaries perform dozens of a jobs (and sometimes more) for a single company in a year. A user will want to be able to business volume for a given company as well as track paid and unpaid jobs for invoicing purposes. For invoicing purposes, the `type` of company is relevant because if it's an institutional entity, the payment for notary services will be a flat fee and the line-item description will be listed as a package rather than a list of notarized doucments and their quantities. If the company is a mom and pop shop, each document (`Document::name`) will be listed with associated `Service::quantity` and `Service::fee` attributes. A `company` might have a url to email invoices or the invoice might be emailed to the agent who facilitated the job.
##### Attributes
+ `:name`
+ `:type`
+ `:url`
##### Associations
+ `belongs_to` `:job`
+ `has_many` `:phones`
+ `has_many` `:emails`
+ `has_many` `:addresses` (might only have one)
+ `has_many` `:people` (agents)

### `Document`
There are two contexts for a `document`, the first is when a user creates a notary "form". Every state has two forms - an "acknowledgement" and a "Jurat". These forms have state-specific language. If there is _any_ deviation in this language (even a single word), the legal power of the notarization is negated. For a variety of reasons, the language in the forms is usually incorrect; clients print out outdated forms, and loan packages often originate from out of state. The point is that if the language does not conform to current statutory language for California, the notary must generate the appropriate "form" and enter the `name` of the notarized document. The other context is when a user generates an invoice, which I described above.
##### Attributes
+ `:type`
+ `:name`
##### Associations
+ `belongs_to` `:job`
+ `belongs_to` `:service`

### `Address`
An address can be associated with: (i) a `user` as a billing address, (ii) a location where a signing takes place (which for real-estate transactions, is also often the underlying property that the document(s) reference, (iii) a signer's address (which must be recorded in a notary "journal" as a matter of statute) , or (iv) a `company`.
##### Attributes
+ `:street`
+ `:unit`
+ `:city`
+ `:state`
+ `:zip`
+ `:po_box`
##### Associations
+ `belongs_to` `:people`
+ `belongs_to` `:company`
+ `belongs_to` `:user`

### `Phone`
A `phone` may be associated with: `user`, `people` (signer and agent), and `company`.
##### Attributes
+ `:type`
+ `:number`
##### Associations
+ `belongs_to` `:people`
+ `belongs_to` `:user`
+ `belongs_to` `:company`
+
### `Email`
An `email` may be associated with: `user`, `people` (signer and agent), and `company`.
##### Attributes
+ `:email`
##### Associations
+ `belongs_to` `:people`
+ `belongs_to` `:user`
+ `belongs_to` `:company`

### `Note`
A `note` is associated with: a `job` (in the job and invoice views)
##### Attributes
+ `:description`
##### Associations
+ `belongs_to` `:job`
***
## Questions & Considerations
+ Should there be a join table between `job`'s and `company` and `job` and `people` (as billed signers)? Invoicing operates differently depending on the type of client; general public clients are billed directly, for jobs sourced by a company, the company is billed, and for smaller companies, sometimes the company is billed and other times the principal of the company is billed. This comes to play when populating a value representing the entity to bill on the invoice. It's also relevant in terms of the email that is poplated on an invoice view in order to send an email.
+ Since a `user` will have an email in the user table for the purposes of authentication but might have additional emails and their is already going to be an `email` model for `people` and `company`, is there anything wrong about associating `user` and `email`? I have the same question for `address` and `phone`. Since a notary only has one commission number (license) I assume there is no reason to create a separate table for that information.
+ In terms of implementing views, if I wanted a sliding pane/sidebar that contained a linked list of a user's `job`'s which populated the main area of the page when clicked, how could this be implemented? This would mean that the `jobs#index` would be served on the same page as `jobs#show`, `jobs#edit`, and perhaps `jobs#new`. I'm not sure how this would work in terms of nesting the routes or implementing the sliding pane. I would like to apply the same functionality for `company`'s.
