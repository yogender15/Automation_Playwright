@UI
Feature: Informal Challenge

@InformalChallenge @E2E @P1_B @Regression @mini_Regression @HP_E2E
Scenario: IFC01_CTPRELMGMT-1663English Hereditament-Informal Challenge - Reduce the Band of an English Hereditament Via Request
	Given User uses test data with ID 'IFC_001' from 'InformalChallenge' sheet
	And User is logged in to Dynamics application to work for "E2E_IFC_CTPRELMGMT-1663" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng_new'
		| fieldName |
		| uprn      |
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName |
		| uprn      |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User clicks on 'Channel' dropdown and select 'Phone' value
	And User looked for value 'CT Informal Challenge Registration' in 'Task Type' field
	And User looked for 'Contact Type' field value
	And User looked for 'Cust. Enquiry Type' field value
	And User looked for 'To Unit' field value
	And User looked for 'Cust. Enquiry Sub Type' field value
	And User looked for 'Cust. Enquiry Sub Type 2' field value
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results from Comparator Tool
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Launch Comparator Tool' button
	And User load and validate comparator
	And User 'Override System Decision' to 'Yes',if 'System Suggestion' is 'Rejected'
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Create Request' button from 'menubar'
	Then user validated 'This action will resolve the linked enquiry. Are you sure you want to create a request and complete the Validity/Acceptance Check?' text
	And User clicks on 'OK' button element
	Then user validated 'Send non system generated correspondence,Informal Challenge - CR15 Dual Acknowledgement' text
	And User clicks on 'OK' button element

	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date     |              | Current Tax Band  | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User closes browser
	

@InformalChallenge @E2E @P1_B @Regression @HP_E2E
Scenario: IFC02_CTPRELMGMT-1660_Welsh Hereditament-Informal Challenge - Reduce the Band of an Welsh Hereditament Via Request
	Given User uses test data with ID 'IFC_008' from 'InformalChallenge' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCWales_New_1993'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCWales'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Reduce the Band of an Welsh Hereditament" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'CT Payer' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User scroll to 'Billing Authority Link' element
	And User entered 0 days before date for 'Evidence Sufficient Date' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till record gets 'Saved'
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User looked for testdata 'CTPlayer' value for 'Tax Payer Request Property Link' field
	And User looked for testdata 'Submitted By' value for 'Interested Party Request Property Link' field
	And User clicks on 'New Evidence Provided?' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	#And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	#And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Comparator Properties' tab under 'Validity/Acceptance Check Form'
	And User provided comparable property details for informal challenge
	And User clicked on 'General' tab under 'Validity/Acceptance Check Form'
	And User clicks on 'House Type Match?' dropdown and select 'Yes' value
	And User clicks on 'Property Size Match?' dropdown and select 'Yes' value
	And User clicks on 'Age Match?' dropdown and select 'Yes' value
	And User clicks on 'Group Match?' dropdown and select 'Yes' value
	And User clicks on 'In Lower Band?' dropdown and select 'Yes' value
	And User clicks on 'Comparables Accepted?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'CR15 Dual Acknowledgement' contains text
	And User clicks on 'OK' button element
	Then User validate 'Accepted' value for 'Validity/Acceptance Decision' field
	And User closes dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details for Welsh Hereditament
		| Effective_From            | Effective_To              | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| effective_To_WalesIC_date |                           | Proposed Tax Band | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date       | effective_To_WalesIC_date | Current Tax Band  | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User closes browser


@MandatedDelay
Scenario: IFC03_CTPRELMGMT-1662_E2E Informal Challenge - Increase the Band of an English Hereditament
	Given User uses test data with ID 'IFC_002' from 'InformalChallenge' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Reduce the Band of an English Hereditament" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'CT Payer' field value
	#And User looked for first element 'CT Payer' field value only when data not entered
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User scroll to 'Billing Authority Link' element
	And User entered 0 days before date for 'Evidence Sufficient Date' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User Validates New Validity/Acceptance Check by clicking on 'Check CT Challenge' from 'Request Action' menu for 'Informal Challenge' BP
	#And User navigates to General tab and updates the Comparable Property Match Results for 'Informal Challenge' BP
	#And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	#And user validated 'Send non system generated correspondence,Informal Challenge - CR15 Dual Acknowledgement' text
	#And User clicks on 'OK' button element
	#And User closes dialog if still present
	#And the user validates the outbound Correspondence validates the 'England' and status as 'sent'
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User looked for testdata 'CT Payer' value for 'Tax Payer Request Property Link' field
	And User looked for testdata 'Submitted By' value for 'Interested Party Request Property Link' field
	And User clicks on 'New Evidence Provided?' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	#And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	#And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Comparator Properties' tab under 'Validity/Acceptance Check Form'
	And User provided comparable property details for informal challenge
	And User clicked on 'General' tab under 'Validity/Acceptance Check Form'
	And User clicks on 'House Type Match?' dropdown and select 'Yes' value
	And User clicks on 'Property Size Match?' dropdown and select 'Yes' value
	And User clicks on 'Age Match?' dropdown and select 'Yes' value
	And User clicks on 'Group Match?' dropdown and select 'Yes' value
	And User clicks on 'In Lower Band?' dropdown and select 'Yes' value
	And User clicks on 'Comparables Accepted?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'CR15 Dual Acknowledgement' contains text
	And User clicks on 'OK' button element
	Then User validate 'Accepted' value for 'Validity/Acceptance Decision' field
	And User closes dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and increased 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User closes browser



@QAQC
Scenario: IFC04_CTPRELMGMT-1503_English Hereditament-Informal Challenge - [SIT]-[BST-18947]-Informal Challenge-Validate QA Review is generated when the property band has changed by two or more step counts
	Given User uses test data with ID 'IFC_007' from 'InformalChallenge' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforEnglishHereditament_Adur'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User connects to the DB and retrieves the data for 'FindHereditamentforEnglishHereditament_Adur'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Reduce the Band of an English Hereditament" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'CT Payer' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User scroll to 'Billing Authority Link' element
	And User entered 0 days before date for 'Evidence Sufficient Date' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User Validates New Validity/Acceptance Check by clicking on 'Check CT Challenge' from 'Request Action' menu for 'Informal Challenge' BP
	#And User navigates to General tab and updates the Comparable Property Match Results for 'Informal Challenge' BP
	#And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	#And user validated 'Send non system generated correspondence,Informal Challenge - CR15 Dual Acknowledgement' text
	#And User clicks on 'OK' button element
	#And User closes dialog if still present
	#And the user validates the outbound Correspondence validates the 'England' and status as 'sent'
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User looked for testdata 'CT Payer' value for 'Tax Payer Request Property Link' field
	And User looked for testdata 'Submitted By' value for 'Interested Party Request Property Link' field
	And User clicks on 'New Evidence Provided?' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	#And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	#And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Comparator Properties' tab under 'Validity/Acceptance Check Form'
	And User provided comparable property details for informal challenge
	And User clicked on 'General' tab under 'Validity/Acceptance Check Form'
	And User clicks on 'House Type Match?' dropdown and select 'Yes' value
	And User clicks on 'Property Size Match?' dropdown and select 'Yes' value
	And User clicks on 'Age Match?' dropdown and select 'Yes' value
	And User clicks on 'Group Match?' dropdown and select 'Yes' value
	And User clicks on 'In Lower Band?' dropdown and select 'Yes' value
	And User clicks on 'Comparables Accepted?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'CR15 Dual Acknowledgement' contains text
	And User clicks on 'OK' button element
	Then User validate 'Accepted' value for 'Validity/Acceptance Decision' field
	And User closes dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 2 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display

@QAQC
Scenario: IFC05_CTPRELMGMT-1504_English Hereditament-Informal Challenge-Validate QA Review is generated for the current Informal challenge job which contains band change and also preceding request is selected with no actioned informal challenge
	Given User uses test data with ID 'IFC_007' from 'InformalChallenge' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforEnglishHereditament_Adur'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User connects to the DB and retrieves the data for 'FindHereditamentforEnglishHereditament_Adur'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Reduce the Band of an English Hereditament" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'CT Payer' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User scroll to 'Billing Authority Link' element
	And User entered 0 days before date for 'Evidence Sufficient Date' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User Validates New Validity/Acceptance Check by clicking on 'Check CT Challenge' from 'Request Action' menu for 'Informal Challenge' BP
	#And User navigates to General tab and updates the Comparable Property Match Results for 'Informal Challenge' BP
	#And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	#And user validated 'Send non system generated correspondence,Informal Challenge - CR15 Dual Acknowledgement' text
	#And User clicks on 'OK' button element
	#And User closes dialog if still present
	#And the user validates the outbound Correspondence validates the 'England' and status as 'sent'
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User looked for testdata 'CT Payer' value for 'Tax Payer Request Property Link' field
	And User looked for testdata 'Submitted By' value for 'Interested Party Request Property Link' field
	And User clicks on 'New Evidence Provided?' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	#And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	#And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Comparator Properties' tab under 'Validity/Acceptance Check Form'
	And User provided comparable property details for informal challenge
	And User clicked on 'General' tab under 'Validity/Acceptance Check Form'
	And User clicks on 'House Type Match?' dropdown and select 'Yes' value
	And User clicks on 'Property Size Match?' dropdown and select 'Yes' value
	And User clicks on 'Age Match?' dropdown and select 'Yes' value
	And User clicks on 'Group Match?' dropdown and select 'Yes' value
	And User clicks on 'In Lower Band?' dropdown and select 'Yes' value
	And User clicks on 'Comparables Accepted?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'CR15 Dual Acknowledgement' contains text
	And User clicks on 'OK' button element
	Then User validate 'Accepted' value for 'Validity/Acceptance Decision' field
	And User closes dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 0 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display

	
	
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 25 days after date for 'Evidence Sufficient Date' field value
	And User clicks on 'Channel' dropdown and select 'Phone' value
	And User looked for 'Task Type' field value
	And User looked for 'Contact Type' field value
	And User looked for 'Cust. Enquiry Type' field value
	And User looked for 'To Unit' field value
	And User looked for 'Cust. Enquiry Sub Type' field value
	And User looked for 'Cust. Enquiry Sub Type 2' field value
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 60 days before date for 'Proposed Effective Date' field value
	And User clicked on 2 position 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	
	And User click on 'Supplementary Requests' tab from 'Customer Enquiry Form'
	And User clicked on supplementary job id
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User looked for testdata 'CT Payer' value for 'Tax Payer Request Property Link' field
	And User looked for testdata 'Submitted By' value for 'Interested Party Request Property Link' field
	And User clicks on 'New Evidence Provided?' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	#And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	#And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Comparator Properties' tab under 'Validity/Acceptance Check Form'
	And User provided comparable property details for informal challenge
	And User clicked on 'General' tab under 'Validity/Acceptance Check Form'
	And User clicks on 'House Type Match?' dropdown and select 'Yes' value
	And User clicks on 'Property Size Match?' dropdown and select 'Yes' value
	And User clicks on 'Age Match?' dropdown and select 'Yes' value
	And User clicks on 'Group Match?' dropdown and select 'Yes' value
	And User clicks on 'In Lower Band?' dropdown and select 'Yes' value
	And User clicks on 'Comparables Accepted?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'CR15 Dual Acknowledgement' contains text
	And User clicks on 'OK' button element
	Then User validate 'Accepted' value for 'Validity/Acceptance Decision' field
	And User closes dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	