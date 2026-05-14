@UI
Feature: Proposals

@QAQC
#E2E-CT Proposals-England-Verify permanent change in the locality such as a new motorway
#CTPRELMGMT-1481-[SIT] [WAR-266][WAR-733]  Validate proposal job is flagged for QA when undergone band change for reason/ground AD03 
Scenario:Proposal01_CTPRELMGMT-1481_E2E [SIT] [WAR-266][WAR-733]  Validate proposal job is flagged for QA when undergone band change for reason/ground AD03
	Given User uses test data with ID 'Proposals_005' from 'Proposals' sheet
	#And Login to Dynamics application with 'VOA Team Manager' user to work for "1481_E2E_Proposals_MR" case
	And User is logged in to Dynamics application to work for "1481_E2E_Proposals_MR" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	#And User looked for value 'Test Customer' in 'Customer' field
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
	#And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered
	
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	And user waits till app progress indicator disappears
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'MR_001'
	#And User entered 25 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User enters same date as 'Proposed Effective Date' for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	#And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	#And User closes business process stage container
	#And User switchs to Assessment frame
	#And User clicked on 'Created Assessments' button
	#And User asserts below 'Created Assessments' details
	#	| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	#	| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	#And User switchs to deafult frame
	#And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display

	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager1' user

	And User closes browser

#CTPRELMGMT-1710 - covered as part of Proposals
#CTPRELMGMT-1434 -[SIT] [WAR-779] - Validate status of Property Link is shown as Inactive
@Regression @Proposals_EN @P1_C @E2E @Proposals @mini_Regression
Scenario: Proposal02_CTPRELMGMT-1721_CTPRELMGMT-1710_E2E-CT Proposals-England-Verify proposal is Invalid and CR15 Informal Challenge is raised
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_Invalid" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| uprn      |
	And User click on 'Customer Enquiries' under 'Service' section
	And user waits till app progress indicator disappears
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
	And User looked for 'Reason/Ground' field value
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
	#And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And user waits till app progress indicator disappears
	#And User looked for 'Job Type To Support Basis' field value by clicking on search icon
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 20 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User entered 0 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'No' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	And user waits till app progress indicator disappears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User looked for value 'A proposal made on the same facts has been determined by the VT or HC' in 'Validity/Acceptance Decision Reason' field
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Is there enough evidence to raise an Informal Challenge? If so, raise a new Request. If this is required use the Supplementary Job Requisition to raise the Request.' text
	And User clicks on 'OK' button element
	Then User validate 'Invalid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	Then User validated under 'Outbound Correspondence' 'Invalid Proposal England VO7735a' template generated
	And User click on 'Refresh' button from 'menubar'
	And User clicks on 'Resolve Request' under 'Request Action'
	#And User click on 'Refresh' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	Then User validate 'Resolved' status of 'Request'
	And User clicked on 'Property Link' tab under 'Request Form' for proposal
	And User double click on 'No' link under property links 
	#And User click on 'Property Link' link
	And User clicked on the 'Property Link' link
	#And User click on 'Is Valid?' toggle button
	And verify status reason as 'Inactive' in the property link page
	And User closes browser
	

@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal03_CTPRELMGMT-1715_E2E-CT Proposals-England-Verify the Valid Proposal now considered Invalid
	Given User uses test data with ID 'Proposals_002' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_Invalid" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| uprn      |
	And User click on 'Customer Enquiries' under 'Service' section
	And user waits till app progress indicator disappears
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
	And User looked for 'Reason/Ground' field value
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
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button


	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User enter 'B' in 'Proposed Band' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	#And User scroll to 'Validity/Acceptance Decision' element
	#And User scroll to 'Validity/Acceptance Decision' label element
	And User looked for value 'Invalid' in 'Validity/Acceptance Decision' field
	#And User entered data for 'Validity/Acceptance Decision Date' field value on dialog
	And User entered 0 days before date for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User looked for value 'A proposal made on the same facts has been determined by the VT or HC' in 'Validity/Acceptance Decision Reason' field
	And User click on 'Save' button from 'dialog'
	And User clicks on 'Is CR15 Required?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'dialog'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Is there enough evidence to raise an Informal Challenge? If so, raise a new Request. If this is required use the Supplementary Job Requisition to raise the Request.' text
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	Then User validated under 'Outbound Correspondence' 'Invalid Proposal England VO7735a' template generated
	And User click on 'Refresh' button from 'menubar'
	And User clicks on 'Resolve Request' under 'Request Action'
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	Then User validate 'Resolved' status of 'Request'
	And User closes browser


@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal04_CTPRELMGMT-1690_CTPRELMGMT-1596_E2E CT Proposals -TC06 - AD07 Change ED and Decrease Band (verify that a Proposal Job can be used to change both the Effective Date and the Band with a Proposal or Appeal Alterations Job.) BST-125483
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_POA" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	#And User click on 'Complete Acceptance Check' button from 'menubar'
	#And user validated 'Acknowledgment of Registration - VO7706 Submitted For Issuing' text
	#And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	#And user validated 'No valid correspondeance criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_EN @P1_C @E2E @Proposals @HP_E2E
Scenario: Proposal05_CTPRELMGMT-1723_E2E CT Proposals - New Property Request through to Release and Publish
	Given User uses test data with ID 'Proposals_012' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_NewProperty" case
	And User collapse if site map navigation expanded on left pane
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
	And User looked for 'Reason/Ground' field value
	And User entered 60 days before date for 'Proposed Effective Date' field value
	And User click on 'Find Address' button
	#And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	#And user enters data in "Postcode" save uprn and selects unique address in 'scenarioContext'
	#And User waits till ProgressRing disappears
	And User scroll to 'Proposed Billing Authority' element
	And User looked for 'Proposed Billing Authority' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Supplementary Requests' tab from 'Customer Enquiry Form'
	And User clicked on supplementary job id
	And user waits till app progress indicator disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 60 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'NewProperty' for 'NP_003'
	And User entered 60 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User clicked on 'Find Hereditament' button
	#And user enters data in "Postcode" and selects unique address in 'scenarioContext' on dialog
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	#And User clicked on 'Search' button
	And User clicked on 'Search' button on dialog
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for 'Group' field value by clicking on search icon
	And User looked for 'Type' field value by clicking on search icon
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for 'Parking' field value
	And User looked for 'Conservatory Type' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display

	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'New Property - Individual' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser


@Regression @Proposals_Wales @P1_C @E2E @Proposals @mini_Regression @HP_E2E
#CTPRELMGMT-1436 -[SIT] [WAR-779] - Validate status of Property Link is shown as Accepted
Scenario: Proposal06_CTPRELMGMT-1724_E2E CT Proposals - Deletion enquiry through to Release and Publish
	Given User uses test data with ID 'Proposals_002' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_DL" case
	And User connects to the DB and retrieves the data for 'findHereditament_Wales_UAT'
		| fieldName           |
		| uprn                |
		| effective_from_date |

	And User click on 'Customer Enquiries' under 'Service' section
	And User collapse if site map navigation expanded on left pane
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
	And User looked for 'Reason/Ground' field value
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Property Link' tab under 'Request Form' for proposal
	And User double click on 'No' link under property links 
	And User clicked on the 'Property Link' link
	And verify status reason as 'Accepted' in the property link page
	And User click on 'Is Valid?' toggle button
	And User entered 25 days after date for 'Effective To' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And verify status reason as 'Accepted' in the property link page	
	And User clicks on 'Go back' button
	And User clicks on 'Go back' button
	
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'DL_001'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Linked Assessment' element
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Remarks' element
	And User enter data for 'Formal Decision Notes' text area field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Well Founded VO7736' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Deletion' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser


@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario:Proposal07_CTPRELMGMT-1597_[SIT] - [WAR-1] - Migrated - No Check Acceptance for Invalid Property -BST-125482
	Given User uses test data with ID 'Proposals_014' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_POA" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	#And User looked for 'Customer' field value
	And User looked for value 'ttttt' in 'Customer' field with keyboard
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
	#And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field with keyboard
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for value 'Proposal Or Appeal Alteration' in 'Job Type To Support Basis' field
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And user waits till app progress indicator disappears
	And User clicks on 'Ok' button on 'Interested Party Property Link' dialog
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears and validate no check acceptance
	And User closes browser

@Regression @Proposals_Wales @P1_C @E2E @Proposals
Scenario: Proposal08 CTPRELMGMT-1538_[SIT] - [WAR-575] Welsh Recon Proposal has BA Reference limited by Guardrails
	Given User uses test data with ID 'Proposals_015' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_proposalrecon" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer' field value
	And User looked for 'Customer Relationship Role' field value
	And User entered 20 days before date for 'Date Received in VOA' field value
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for value 'Reconstitution' in 'Job Type To Support Basis' field
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Proposals and Appeals AD01' element
	And User clicks on 'Alteration Of More Than One Hereditament?' dropdown and select 'Yes' value
	And User looked for value 'Reconstitution' in 'Multi Hereditament Alteration Type' field
	And User looked for value 'Split' in 'Multi Hereditament Alteration Sub Type' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Reconstitution' tab from 'Desktop Research Form'

	And User clicks on 'Add Outgoing' button element
	And user waits till app progress indicator disappears
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button field
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present

	And User filled 1 'Add Incoming' details for 'Postcode' in a proposal job for guardrail validation
	And User closes dialog if still present
	
	And User filled 1 'Add Incoming' details for 'Postcode' in a proposal job for wales
	#And User enter community code number for "Proposed BA Reference Number" field value
	#And User click on 'Save' button from 'dialog'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present

	And User uses test data with ID 'Proposals_016' from 'Proposals' sheet
	And User filled 1 'Add Incoming' details for 'Postcode' in a proposal job for wales
	#And User enter community code number for "Proposed BA Reference Number" field value
	#And User click on 'Save' button from 'dialog'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	
	
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	#And user asserts related jobs row count '4' by "Refresh" grid
	And User get all Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '4' by "Refresh" grid
	#And user waits for '20' secs
	And User waits till all 4 jobs has name displayed by "Refresh" grid
	And User captured all 4 recons "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
		
	And user waits for '120' secs
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconDel_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Linked Assessment' element
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	And User waits till 'Maintain Assessment' stage selected
	#And User click on 'Refresh' button from 'menubar'
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	
	And user waits for '45' secs
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconNew_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
	And User looked for value 'BD - Detached bungalow' in 'Type' field
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	#And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	
	And user waits for '45' secs
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconNew_1' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
	And User looked for value 'BD - Detached bungalow' in 'Type' field
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	#And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	
	
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field
	Then user validated 'Send non system generated correspondence,Well Founded VO7736' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	

	And User click on 'Jobs' under 'Service' section
	And User filters recon job 'ReconNew_0' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User scroll to 'Billing Authority Link' element
	Then user verifies "Proposed BA Reference Number" in the billing Authority section
	And User click on 'Jobs' under 'Service' section
	And User filters recon job 'ReconNew_1' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User scroll to 'Billing Authority Link' element
	Then user verifies "Proposed BA Reference Number" in the billing Authority section

	And User click on 'Jobs' under 'Service' section
	And User filters recon job 'ReconDel_1' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	
	And User closes browser



@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal09_CTPRELMGMT-1690_CTPRELMGMT-1596_E2E CT Proposals -TC06 - AD07 Change ED and Decrease Band (verify that a Proposal Job can be used to change both the Effective Date and the Band with a Proposal or Appeal Alterations Job.) BST-125483
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_POA" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	#And User click on 'Complete Acceptance Check' button from 'menubar'
	#And user validated 'Acknowledgment of Registration - VO7706 Submitted For Issuing' text
	#And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	#And user validated 'No valid correspondeance criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal10_CTPRELMGMT-1461_[SIT]-BST-131926 - Verify Proposal or Appeal Alteration triggers QC
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA QC User' user to work for "E2E_Proposals_QC" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	#And User click on 'Complete Acceptance Check' button from 'menubar'
	#And user validated 'Acknowledgment of Registration - VO7706 Submitted For Issuing' text
	#And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user

	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	#And user validated 'No valid correspondeance criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser


@Regression @Proposals_EN @E2E @Proposals @HP_E2E
Scenario:Proposal11_CTPRELMGMT-1582_[SIT] - [WAR-299] - Wales - Welsh Proposal should backdate six years
	Given User uses test data with ID 'Proposals_005' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA Team Manager' user to work for "1481_E2E_Proposals_MR" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_Wales_UAT'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	#And User looked for value 'Test Customer' in 'Customer' field
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
	#And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered
	
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	And user waits till app progress indicator disappears
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	#	And User clicks on 'Ok' button on 'Quality Review?' dialog
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User click on job link in Header
	#And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	#And User logged out from Dynamics application
	#And Login to Dynamics application with 'VOA Team Manager1' user
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal12_CTPRELMGMT-1426 [SIT]-[WAR-1077] Proposals - Validate the duplicate request is identified and relevant pop-up notification is displayed
	Given User uses test data with ID 'Proposals_017' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_duplicate request message" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	#And user waits for '5' secs
	Then user validated 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' text
	And User clicks on 'OK' button element
	Then User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	#And User scroll to 'Decision' section on validity check
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	##And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field by clicking on search icon
	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	#And User click on 'Complete Acceptance Check' button from 'menubar'
	#And user validated 'Acknowledgment of Registration - VO7706 Submitted For Issuing' text
	#And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	
	And User clicks on 'OK' button element
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
	
	And User clicks on 'OK' button element
	Then User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Supplementary Requests' tab from 'Customer Enquiry Form'
	And User clicked on supplementary job id
	And user waits till app progress indicator disappears
	And User clicks on 'OK' button element
	Then User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	#And User clicks on 'OK' button element
	#And User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User get Supplementary Job details in 'featureContext'
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User clicks on 'OK' button element
	Then User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	#proposal or appeal alteration
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	#And User click on the 'Refresh' button from 'menubar' clicks on 'OK' button on 'Duplicate Proposal' dialog until 'Pending Release' status is displayed
	And User clicks on 'OK' button element

	And User clicked on 'Associated Jobs' tab under 'Job Form'
	#And User clicks on 'OK' button element
	#And User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	#And user validated 'No valid correspondeance criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'OK' button element
	Then User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'OK' button element
	#And User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User click on job link in Header
	#And User clicks on 'OK' button element
	#And User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	#And User click on the 'Refresh' button from 'menubar' clicks on 'OK' button on 'Duplicate Proposal' dialog until 'Pending Release' status is displayed
	
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'OK' button element
	#And User verifies 'A Proposal for this hereditament with the same details already exists in the system. Please check existing requests before continuing. Ask for help if required.' Banner message
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	#And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User click on the 'Refresh' button from 'menubar' clicks on 'OK' button on 'Duplicate Proposal' dialog until 'Resolved' status is displayed
	And User closes browser 

@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal13_CTPRELMGMT-2633_[SIT] [WAR-1227]-Proposal(Wales)-Validate Disclosure pack fields are enabled and SLA 'Send Disclosure Pack' should be Succeeded when 'Is Band Correct' = YES
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA Team Manager1' user to work for "E2E_DisclosurePack_Succeeded" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field with keyboard

	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851a' text
	And User clicks on 'OK' button element
	#And User click on 'Complete Acceptance Check' button from 'menubar'
	#And user validated 'Acknowledgment of Registration - VO7706 Submitted For Issuing' text
	#And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User clicks on 'Is Band Correct' dropdown and select 'Yes' value
	Then user validated 'Send non system generated correspondence, 'CT Proposal - Disclosure Letter/ Invitation to withdraw' (VO7763a)'' text
	And User clicks on 'OK' button element
	And User entered 0 days before date for 'Disclosure Pack Sent On' field value
	And User entered 0 days before date for 'Disclosure Pack Response Received On' field value
	And User clicks on 'Disclosure Pack Response' dropdown and select 'Withdraw' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Well Founded VO7736' text
	#And user validated 'No valid correspondeance criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
    And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User scroll to 'Request SLAs' element
	Then User validated 'Succeeded' status for 'Send Disclosure Pack KPI' SLA
	Then User validated 'Succeeded' status for 'Response On Disclosure Pack KPI' SLA
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal14_CTPRELMGMT-2610_[SIT] [INC3697495/WAR-1228&WAR-1227]-Proposal(Wales)-Validate Disclosure pack fields are disabled and SLA 'Send Disclosure Pack' should be CANCELLED when 'Is Band Correct' = No or Null
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA Team Manager1' user to work for "E2E_DisclosurePack_Cancelled" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field with keyboard

	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851a' text
	And User clicks on 'OK' button element
	#And User click on 'Complete Acceptance Check' button from 'menubar'
	#And user validated 'Acknowledgment of Registration - VO7706 Submitted For Issuing' text
	#And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User clicks on 'Is Band Correct' dropdown and select 'No' value
	And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice Wales' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
    And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Request' link
	And User scroll to 'Request SLAs' element
	Then User validated 'Canceled' status for 'Send Disclosure Pack KPI' SLA
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User scroll to 'Request SLAs' element
	Then User validated 'Canceled' status for 'Send Disclosure Pack KPI' SLA
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

	@Regression @Proposals_EN @P1_C @E2E @Proposals
Scenario: Proposal15_CTPRELMGMT-2610_[SIT] [INC3697495/WAR-1228&WAR-1227]-Proposal(Wales)-Validate Disclosure pack fields are disabled and SLA 'Send Disclosure Pack' should be CANCELLED when 'Is Band Correct' = No or Null
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA Team Manager1' user to work for "E2E_DisclosurePack_NoAction_Cancelled" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field with keyboard

	#And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851a' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User clicks on 'Is Band Correct' dropdown and select 'No' value
	And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Decision Notice Wales' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
    And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Request' link
	And User scroll to 'Request SLAs' element
	Then User validated 'Canceled' status for 'Send Disclosure Pack KPI' SLA
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User scroll to 'Request SLAs' element
	Then User validated 'Canceled' status for 'Send Disclosure Pack KPI' SLA
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_Wales @P1_C @E2E @Proposals @mini_Regression
Scenario: Proposal16_CTPRELMGMT-1507_[SIT] - [WAR-299] - Wales - QA is mandatory if assessment is set to not use DOLU
	Given User uses test data with ID 'Proposals_005' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA Team Manager1' user to work for "E2E_Proposals_1507" case
	And User connects to the DB and retrieves the data for 'findHereditament_Wales_2005'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User collapse if site map navigation expanded on left pane
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
	And User looked for 'Reason/Ground' field value
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Proposal' in 'featureContext'
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User opens 'Proposal' 'Name' through 'CT Requests'
	And User navigates to filtered request
	#And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
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
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	Then user asserts 'Created Assessments' row count '1'
	And user selects '1' Assessment and clicked on 'View' button
	And User switchs to deafult frame
	And user waits till progress indicator disappears
	And user waits till app progress indicator disappears
	Then user validated 'The Effective From Date will be amended to Release date Less 6 years' text
	And User clicks on 'Ok' button element
	And User clicks on 'Use Date of List Update?' dropdown and select 'No' value
	And User click on 'Save & Close' button from 'dialog'
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user
	And User click on 'Jobs' under 'Service' section
	And User filters recon job 'Supplementary Job Name' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User clicked on 'Quality Review' tab under 'Job Form'
	And User selects review record 
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Approve' button from 'menubar'
	Then user validated 'Please populate the Approval Decision Reason in Approvals Tab.' text
	And User clicks on 'OK' button element
	And User enter data for 'Approval Decision Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Review Complete' status display
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager1' user
	And User click on 'Jobs' under 'Service' section
	And User filters the 'Job_0' 'Job Name' through 'All Jobs'
	#And User filters 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Researching' stage selected
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field with keyboard
	Then user validated 'Send non system generated correspondence,Well Founded VO7736' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
    And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser


@Regression @Proposals_Wales @P1_C @E2E @Proposals @HP_E2E
Scenario: Proposal17_CTPRELMGMT-1708_E2E-CT Proposals-Wales-Verify Proposal received to insert a new property(dwelling) in the List
	Given User uses test data with ID 'Proposals_021' from 'Proposals' sheet
	And Login to Dynamics application with 'VOA Team Manager' user to work for "E2E_Proposals_Wales_NewProperty" case

	#And User is logged in to Dynamics application to work for "E2E_Proposals_Wales_NewProperty" case
	And User collapse if site map navigation expanded on left pane
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
	And User looked for 'Reason/Ground' field value
	And User entered 60 days before date for 'Proposed Effective Date' field value
	And User click on 'Find Address' button
	#And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	#And user enters data in "Postcode" save uprn and selects unique address in 'scenarioContext'
	#And User waits till ProgressRing disappears
	And User scroll to 'Proposed Billing Authority' element
	And User looked for 'Proposed Billing Authority' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Supplementary Requests' tab from 'Customer Enquiry Form'
	And User clicked on supplementary job id
	And user waits till app progress indicator disappears
	And User scroll to 'Billing Authority Link' element
	#
	And User enter community code number for "Proposed BA Reference Number" field value
	And User enter 'PENLLERGAER' and 'Swansea' community code number for 'Proposed BA Reference Number' field value

	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 60 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'NewProperty' for 'NP_003'
	And User entered 60 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User clicked on 'Find Hereditament' button
	#And user enters data in "Postcode" and selects unique address in 'scenarioContext' on dialog
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	#And User clicked on 'Search' button
	And User clicked on 'Search' button on dialog
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for 'Group' field value by clicking on search icon
	And User looked for 'Type' field value by clicking on search icon
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for 'Parking' field value
	And User looked for 'Conservatory Type' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display

	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field
	Then user validated 'Send non system generated correspondence,Decision Notice England' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'New Property - Individual' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_Wales @P1_C @E2E @Proposals1 @mini_Regression
#CTPRELMGMT-1435 -[SIT] [WAR-779] - Validate status of Property Link is shown as Accepted - Effective to date is past date
Scenario:Proposal18_CTPRELMGMT-1435_BST-120131_AD02 + Composite Property -Wales - Validate the change in list- AD02 with Composite Property when Proposal is Valid
	Given User uses test data with ID 'Proposals_Wales_100' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_Proposals_AD02_CPC_Agreed" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
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
	And User looked for 'Reason/Ground' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

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
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


@Regression @Proposals_EN @E2E
Scenario: Proposal19_SIT_CTPRELMGMT-420_ Proposals[WAR-1196/INC3497598] : Validate the E2E Proposal with Recon Merger as supplementary job and check the correspondence generated
Given User uses test data with ID 'Proposals_022' from 'Proposals' sheet
And User is logged in to Dynamics application to work for "E2E_England_proposalrecon" case
And User collapse if site map navigation expanded on left pane
And User connects to the DB and retrieves the data for 'findHereditament_birmimghamrecon_PR'
| fieldName           |
| band                |
| uprn                |
| effective_from_date |
And User click on 'Customer Enquiries' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for value 'Test Customer' in 'Customer' field
And User looked for 'Customer' field value
And User looked for 'Customer Relationship Role' field value
And User entered 20 days before date for 'Date Received in VOA' field value
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
And User looked for 'Reason/Ground' field value
And User enters '5' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
And user waits till app progress indicator disappears
And User scroll to 'Remarks' element
And User scroll to 'Authority to Act' element
And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
And User looked for 'Reason/Ground' field value only when data not entered
And User looked for 'Data Source Role' field value only when data not entered
And User clicks on 'Channel' dropdown and select 'Email' value
And User looked for 'Submitted By' field value only when data not entered
And User looked for 'Relationship Role' field value only when data not entered
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicked on 'Property Link' tab under 'Request Form' for proposal
	And User double click on 'No' link under property links 
	And User clicked on the 'Property Link' link
	And User click on 'Is Valid?' toggle button
	And User entered 25 days before date for 'Effective To' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And verify status reason as 'Inactive' in the property link page	
	And User clicks on 'Go back' button
	And User clicks on 'Go back' button

	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
And User clicks on 'Check CT Challenge' under 'Request Action'
And User clicks on 'Yes' button on 'Check CT Challenge' dialog
And User looked for value 'Reconstitution' in 'Job Type To Support Basis' field
And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
And User enter 'B' in 'Proposed Band' field
And User looked for 'Tax Payer Request Property Link' and selects '1' option value
And User looked for 'Interested Party Request Property Link' and selects '2' option value
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Check Acceptance' button from 'dialog'
And User clicks on 'OK' button on 'Leave this page?' dialog
And User click on 'Complete Acceptance Check' button from 'menubar'
And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
And user waits till app progress indicator disappears
And User clicks on 'OK' button element
And User validate 'Valid' value for 'Validity/Acceptance Decision' field
And User click on 'Refresh' button from 'menubar' untill 'Complete' status display

And User clicks on 'Go back' button
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
And User validate below business stages on business journey header
	| BusinessStages |
	| Details        |
	| Researching    |
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User scroll to 'Proposals and Appeals AD01' element
And User clicks on 'Alteration Of More Than One Hereditament?' dropdown and select 'Yes' value
And User looked for value 'Reconstitution' in 'Multi Hereditament Alteration Type' field
And User looked for value 'Merger' in 'Multi Hereditament Alteration Sub Type' field
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Reconstitution' tab from 'Desktop Research Form'

And User clicks on 'Add Outgoing' button element
And user waits till app progress indicator disappears
And User click on 'Find Hereditament' button
And User select 'UPRN' value from 'Search By' dropdown
And User enters data in "UPRN" field
And User clicked on 'Search' button field
And User slects spcific 'uprn' row from search hereditament results
And User clicked on 'Select' button
And User waits till Find Hereditament dialog disappears
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' 'progressbar' disappears
And User closes dialog if still present

And User connects to the DB and retrieves the data for 'findHereditament_birmimghamrecon_PR' for reconstitution
	| fieldName           |
	| band                |
	| uprn                |
	| effective_from_date |
And User clicks on 'Add Outgoing' button element
And user waits till app progress indicator disappears
And User click on 'Find Hereditament' button
And User select 'UPRN' value from 'Search By' dropdown
And User enters data in "UPRN" field
And User clicked on 'Search' button field
And User slects spcific 'uprn' row from search hereditament results
And User clicked on 'Select' button
And User waits till Find Hereditament dialog disappears
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' 'progressbar' disappears
And User closes dialog if still present

And User filled 1 'Add Incoming' details for 'Postcode' in a proposal job
#And User click on 'Save' button from 'dialog'
#And user waits till 'Saving...' 'progressbar' disappears
And User waits till Find Hereditament dialog disappears
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' 'progressbar' disappears
And User closes dialog if still present

And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
#And user asserts related jobs row count '4' by "Refresh" grid
And User get all Supplementary Job details in 'featureContext'
And User click on 'Requests' under 'Service' section
And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
And User click on 'Related Jobs' tab from 'Request Form'
And user asserts related jobs row count '4' by "Refresh" grid
#And user waits for '20' secs
And User waits till all 4 jobs has name displayed by "Refresh" grid
And User captured all 4 recons "Job ID" and "Job Name" in "featureContext" by "Refresh" grid


	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconDel_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Linked Assessment' element
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	And User waits till 'Maintain Assessment' stage selected
	#And User click on 'Refresh' button from 'menubar'
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display

	And user waits for '120' secs
	
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconDel_1' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Linked Assessment' element
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	And User waits till 'Maintain Assessment' stage selected
	#And User click on 'Refresh' button from 'menubar'
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display

	And user waits for '120' secs
	
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconNew_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
	And User looked for value 'BD - Detached bungalow' in 'Type' field
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	#And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display

	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field
	Then user validated 'Send non system generated correspondence,Well Founded VO7736' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'CPC_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
	And User enter data for 'Related Composite Property' field value from 'CompositeDwelling' for 'CPC_001'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
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
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
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
	#And User closes business process stage container
	#And User switchs to Assessment frame
	#And User clicked on 'Created Assessments' button
	#And User asserts below 'Created Assessments' details
	#	| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	#	| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	#And User switchs to deafult frame
	#And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Agreed' in 'Settlement Decision' field with keyboard
	Then user validated 'No valid correspondence criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Composite Property Change' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @Proposals_EN @E2E
Scenario: Proposal20_SIT- E2E _CTPRELMGMT-1689_CT Proposals - AD04 Material Reduction within 6 months of VT Decision on Neighbouring property
Given User uses test data with ID 'Proposals_023' from 'Proposals' sheet
And User is logged in to Dynamics application to work for "E2E_Proposals_POA" case
And User collapse if site map navigation expanded on left pane
And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
	| fieldName           |
	| uprn                |
	| effective_from_date |
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
And User looked for 'Reason/Ground' field value
And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
And user waits till app progress indicator disappears
And User scroll to 'Remarks' element
And User scroll to 'Authority to Act' element
And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
And User looked for 'Reason/Ground' field value only when data not entered
And User looked for 'Data Source Role' field value only when data not entered

And User clicks on 'Channel' dropdown and select 'Email' value
And User looked for 'Submitted By' field value only when data not entered
And User looked for 'Relationship Role' field value only when data not entered
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears


And User clicks on 'Check CT Challenge' under 'Request Action'
And User clicks on 'Yes' button on 'Check CT Challenge' dialog
And User entered 0 days before date for 'VT Decision Date' field value on 'dialog'
And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
And User enter 'B' in 'Proposed Band' field
And User looked for 'Tax Payer Request Property Link' and selects '1' option value
And User looked for 'Interested Party Request Property Link' and selects '2' option value
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Override System Decision' dropdown and select 'Yes' value
And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
And User entered 0 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks 2 position 'OK' button on 'Leave this page?' dialog
And User click on 'Complete Acceptance Check' button from 'menubar'
And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
And user waits till app progress indicator disappears
And user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
And User clicks on 'OK' button element
And User validate 'Valid' value for 'Validity/Acceptance Decision' field
And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
And User clicks on 'Go back' button
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
And User validate below business stages on business journey header
	| BusinessStages |
	| Details        |
	| Researching    |
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_003'
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' disappears on dialog
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' disappears on dialog
And User closes dialog if still present
And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
And User get Supplementary Job details in 'featureContext'
And User click on 'Requests' under 'Service' section
And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
And User click on 'Related Jobs' tab from 'Request Form'
And user asserts related jobs row count '2' by "Refresh" grid
And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
And User click on 'Jobs' under 'Service' section
And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on "Job Id" element
And User waits till 'Details' stage selected
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User selects 'Committed' record
And User get PAD attributes of 'Committed' record
And User clicked on 'Amend' button
And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
And user waits till app progress indicator disappears
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
And User scroll to 'PAD Validation' element
And User click on 'Validate PAD Code' toggle button
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validate value 'Pass' for 'PAD Validation Outcome' field
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Undertake Banding' stage selected
#And User clicked on 'Undertake Banding' BPF Journey button
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
And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
And User clicks on 'Yes' button on 'Complete Job' dialog
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
And User clicked on 'Associated Jobs' tab under 'Job Form'
And User double click on 'Proposal' job under Associated jobs
And user waits till app progress indicator disappears
And User clicked on 'Researching' BPF Journey button
And User closes business process stage container
And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
And User looked for value 'Make A Change' in 'Settlement Decision' field with keyboard
And user validated 'Send non system generated correspondence,Decision Notice England' text
#And user validated 'No valid correspondeance criteria met, no correspondence has been generated.' text
And User clicks on 'OK' button element
And User entered 1 days before date for 'Settlement Decision Date' field value
And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User click on job link in Header
And User clicked on 'Details' tab under 'Job Form'
And User click on 'Request' link
And User clicked on 'Outbound Correspondence' tab under 'Request Form'
And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
And User click on correspondence "Job Id" element
And User clicks on 'OK' button on 'Leave this page?' dialog
And User clicks on 'Status Reason' dropdown and select 'Sent' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Refresh' button from 'menubar'
And User click on 'Save & Close' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Researching' BPF Journey button
And User closes business process stage container
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Yes' button on 'Complete Job' dialog
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on job link in Header
And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
And User clicked on 'Details' tab under 'Job Form'
And User click on 'Request' link
And User clicks on 'Release and Publish' under 'Request Action'
And User clicks on 'OK' button element
And User closes dialog if still present
And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
And User clicked on 'PVT' tab under 'Job Form'
And User validate 'Assessments' details under 'PVT' tab
	| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
	| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
	| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
And User clicked on 'Associated Jobs' tab under 'Job Form'
And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
And User closes browser

@Regression @Proposals_EN
Scenario: Proposal21_CTPRELMGMT-561_SIT- Proposal - CTPCASE-168-INC3460598-- Validate user can abort the case when there is no hereditament attached
Given User uses test data with ID 'PAA_004' from 'TestDataPart3' sheet
And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
	| fieldName           |
	| uprn                |
	| effective_from_date |
And User is logged in to Dynamics application to work for "Abort_Noheraditament" case
And User collapse if site map navigation expanded on left pane
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value
And User looked for 'Reason/Ground' field value
And User looked for 'Data Source Role' field value
And User clicks on 'Channel' dropdown and select 'Email' value
And User looked for value 'Test CouncilTaxPayer' in 'CT Payer' field
And User looked for value 'Test Customer' in 'Submitted By' field
And User looked for value 'Owner / Occupier' in 'Relationship Role' field
And User entered 0 days before date for 'Date Received' field value
And User entered 25 days before date for 'Proposed Effective Date' field value
And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
And User enter random number for 'Proposed BA Reference Number' field value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User scroll to 'New Hereditament Details' element
And User looked for 'Proposed Billing Authority' field value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Validate Request' under 'Request Action'
And User click on 'Save & Close' button from 'dialog'
And User waits till 'dialog' disappears
And User click on 'Related Jobs' tab from 'Request Form'
And User captures "Job ID" in "featureContext"
And User click on 'Jobs' under 'Service' section
And User 'Assign' 'Job ID' through 'All Jobs' for abort case
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on "Job Id" element

And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_005'
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' disappears on dialog
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' disappears on dialog
And User closes dialog if still present

And User clicked on 'Associated Jobs' tab under 'Job Form'
And User double click on 'New Property - Individual' job under Associated jobs
And user waits till app progress indicator disappears
And User clicks on 'Abort Job' under 'Job Actions'
And User clicks on 'Abort' button on 'Abort Job(s)' dialog
And user waits till app progress indicator disappears
And verify status reason as 'Aborted' in the property link page
And User closes browser

@Regression @Proposals_EN @Proposals
Scenario: Proposal22_CTPRELMGMT-1980_ CT Proposals - SIT-[CTPCASE-805/INC3561980] :Verify users are not restricted from selecting a non live hereditament for proposal reason AD05
	Given User uses test data with ID 'Proposals_012' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_NewProperty" case
	And User collapse if site map navigation expanded on left pane
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
	And User looked for 'Reason/Ground' field value
	And User entered 60 days before date for 'Proposed Effective Date' field value
	And User click on 'Find Address' button
	#And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	#And user enters data in "Postcode" save uprn and selects unique address in 'scenarioContext'
	#And User waits till ProgressRing disappears
	And User scroll to 'Proposed Billing Authority' element
	And User looked for 'Proposed Billing Authority' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Supplementary Requests' tab from 'Customer Enquiry Form'
	And User clicked on supplementary job id
	And user waits till app progress indicator disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 60 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
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
	
	And User connects to the DB and retrieves the data for 'findHereditament_manchester_PR'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'NewProperty' for 'NP_034'
	And User entered 60 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User clicked on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
And User enters data in "UPRN" field
And User clicked on 'Search' button field
And User slects spcific 'uprn' row from search hereditament results
And User clicked on 'Select' button
And User waits till Find Hereditament dialog disappears
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' 'progressbar' disappears
And User closes dialog if still present

	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_manchester_PR'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'NewProperty' for 'NP_034'
	And User entered 60 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User clicked on 'Find Hereditament' button
	
And User select 'UPRN' value from 'Search By' dropdown
And User enters data in "UPRN" field
And User clicked on 'Search' button field
And User slects spcific 'uprn' row from search hereditament results
And User clicked on 'Select' button
And User waits till Find Hereditament dialog disappears
And User click on 'Save' button from 'dialog'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Submit' button from 'dialog'
And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
And user waits till 'Saving...' 'progressbar' disappears
And User closes dialog if still present
