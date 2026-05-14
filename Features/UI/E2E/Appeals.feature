@UI
Feature: Appeals

@Regression @appeals @appeals_EN @HP_E2E @P1_A @mini_Regression
Scenario: Appeal01_CTPRELMGMT-1644_E2E-CTAppeals[England]-Appellant appeals a AD01 Decision notice- Appeal withdrawn by Appellant
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Appeal_WithDrawn" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		#findHereditament_CAMBRIDGE'
		| fieldName |
		| uprn      |
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
	And user waits till app progress indicator disappears
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And user waits till app progress indicator disappears
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
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
	And User looked for value 'Address and or date of VT/HC decision not supplied' in 'Validity/Acceptance Decision Reason' field by clicking on search icon
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
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 10 days after date for 'Hearing Date' field value
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	   And user waits till 'Saving...' 'progressbar' disappears 
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	#And User looked for value 'Invalid' in 'VT/HC Decision' field
	#Decision Date
	#Decision Notice Received Date
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	#And User looked for value 'Withdrawn' in 'Settlement Decision' field

	And User looked for value 'Withdrawn' in 'Settlement Decision' field with keyboard
    #And User looked for value 'Withdrawn' for 'Settlement Decision' field
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User clicks on 'Settlement Communication Sent to VT?' dropdown and select 'Yes' value

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User closes browser

@Regression @appeals @appeals_EN @mini_Regression @HP_E2E
Scenario: Appeal02_CTPRELMGMT-1645_E2E_CT Appeals[England]_Appellant appeals an invalidity notice- VT decision appeal valid
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_WellFounded" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName |
		| uprn      |
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
	And user waits till app progress indicator disappears
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
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
	And User looked for value 'Alteration challenged was a reference no/address change or a clerical error correction only' in 'Validity/Acceptance Decision Reason' field
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
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	Then User validate 'Resolved' status of 'Request'
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 30 days after date for 'Hearing Date' field value
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	#And User looked for value 'Invalid' in 'VT/HC Decision' field
	#Decision Date
	#Decision Notice Received Date
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Well Founded' in 'Settlement Decision' field with keyboard
	#And User looked for value 'Withdrawn' for 'Settlement Decision' field
	#And user validated 'Send non system generated correspondence,Decision Notice England' text
	#And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User clicks on 'Settlement Communication Sent to VT?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User closes browser

@Regression @appeals @appeals_EN @P1_A @HP_E2E
Scenario: Appeal03_CTPRELMGMT-1686_E2E - CT Appeals[England] - Appellant appeals a AD01 Decision notice- VT decision Band confirmed(VT Confirmation)
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Appeal_VTDecision" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName |
		| uprn      |
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
	And user waits till app progress indicator disappears
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
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
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 0 days before date for 'Date Received' field value
	And User entered 60 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'VT Action' tab from 'Request Form'
	##And User enter random number for 'VT Reference Number' field value
	And User enter random number in '2' position 'VT Reference Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 30 days after date for 'Hearing Date' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Is Hearing Postponed?' dropdown and select 'No' value
	#And User enter 'Time of Hearing Date' as '15' mins after current time
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	#And User looked for value 'Invalid' in 'VT/HC Decision' field
	#Decision Date
	#Decision Notice Received Date
	#And User validate value 'Hearing Date Received' for 'Status Reason' field
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'VT Decision' in 'Settlement Decision' field with keyboard
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User entered 1 days before date for 'VT Settlement Confirmation Date' field value
	And User looked for value 'VT Determination' in 'VT/HC Decision' field
	#And User entered 1 days before date for 'VT/HC Decision Date' field value
	And User entered 1 days before date for 'VT/HC Decision Date' field value in 2 position
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User closes browser

@QAQC
Scenario: Appeal04_CTPRELMGMT-1505_[SIT] - [BST-87712] - Validate System flags job for QA(England) when settlement method as Agreement at DR
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Appeal_143084" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		#findHereditament_CAMBRIDGE'
		| fieldName |
		| uprn      |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	#And User entered 60 days before date for 'Date Received in VOA' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 45 days after date for 'Evidence Sufficient Date' field value
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
	And user waits till app progress indicator disappears
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And user waits till app progress indicator disappears
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
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
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User modifies value 'Invalid' in 'Validity/Acceptance Decision' field
	And User looked for value 'Address and or date of VT/HC decision not supplied' in 'Validity/Acceptance Decision Reason' field by clicking on search icon
	And User click on 'Save' button from 'menubar'
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
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 50 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 56 days after date for 'Hearing Date' field value
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Prepare and Send Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User clicks on 'VOA Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Check For Appellant Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 0 days before date for 'Appellant Case Pack Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicks on 'Appellant Case Pack Received?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Send Combined Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User clicks on 'Combined Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	#And user clicked on 'Confirm Interested Party Court Attendance' link
	And user clicked on 'Confirm VOA Court Attendance' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User clicks on 'VOA Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User clicks on 'IP Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Agreed' in 'Settlement Decision' field with keyboard
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User clicks on 'Settlement Communication Sent to VT?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User closes browser

@Regression @appeals @appeals_EN @HP_E2E
#CTPRELMGMT-1551_E2E Migrated Welsh Reform Appeal - England - Validate VT Decision and VT Decision Date should be automatically populated on proposed assessment
Scenario:Appeal05_CTPRELMGMT-1464_CTPRELMGMT-1551_[SIT][WAR-842] Welsh Reform Proposals - Validate Settlement Decision field in 'Challenge Process Details' must auto-populate to 'VT Decision'
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Appeal_WithDrawn" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		#findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	Given User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	#And User entered 60 days before date for 'Date Received in VOA' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 45 days after date for 'Evidence Sufficient Date' field value
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
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

	#And User entered 60 days before date for 'Proposed Effective Date' field value
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
	And user waits till app progress indicator disappears
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And user waits till app progress indicator disappears
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
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
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User modifies value 'Invalid' in 'Validity/Acceptance Decision' field
	And User looked for value 'Address and or date of VT/HC decision not supplied' in 'Validity/Acceptance Decision Reason' field by clicking on search icon
	And User click on 'Save' button from 'menubar'
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
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 0 days before date for 'Date Received' field value
	And User entered 50 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Appeal_Request' in 'featureContext'
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 56 days after date for 'Hearing Date' field value
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	    And user waits till 'Saving...' 'progressbar' disappears 
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Prepare and Send Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User clicks on 'VOA Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Check For Appellant Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 0 days before date for 'Appellant Case Pack Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicks on 'Appellant Case Pack Received?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Send Combined Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User clicks on 'Combined Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	#And user clicked on 'Confirm Interested Party Court Attendance' link
	And user clicked on 'Confirm VOA Court Attendance' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User clicks on 'VOA Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User clicks on 'IP Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value 'VT Determination' in 'VT/HC Decision' field
	And User entered 0 days before date for 'Decision Date' field value
	And User entered 0 days before date for 'Decision Notice Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	Then User asserts 'Settlement Decision' value as 'VT Decision'

	#Proposal Or Appeal Alteration
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	
		Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
    And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User opens 'Appeal_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
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
	And User waits till record gets 'Saved'
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
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	Then user asserts 'Created Assessments' row count '1'
	And user selects '1' Assessment and clicked on 'View' button
	And User switchs to deafult frame
	And user waits till app progress indicator disappears
	Then User asserts 'VT Decision' value as 'VT Determination'
	Then User validate 'Unpublished' status of 'assesment'
	And User click on 'Save & Close' button from 'dialog'
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Appeal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User entered 0 days before date for 'VT Settlement Confirmation Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Regression @appeals @appeals_Wales @HP_E2E
Scenario: Appeal06_CTPRELMGMT_1687_wales_E2E_Appeal_Scenario-CA05 Reconstitution Merger
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	Given User is logged in to Dynamics application to work for "E2E_Proposals_MR" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	Given User click on 'Customer Enquiries' under 'Service' section
	And user waits till app progress indicator disappears
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	#And User entered 2 days before date of 'BaseProposedEffectiveDate' for 'Date Received in VOA' field value
	And User entered 30 days before date for 'Date Received in VOA' field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	And User entered 20 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	Then User validate value 'Sent' for 'Status Reason' field
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User click on 'Summary' tab from 'Request Form'
	#And User enter 'Time of Date Received' as '90' mins before current time
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'Request SLAs' element
	And User waits till 'Communicate To Valuation Tribunal KPI' becomes 'Noncompliant' by 'Refresh Timer' under 'Request SLAs' 
	#And User click on 'Refresh' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'Challenge Process Settlement' element
	Then User validate 'Transmit Proposal To VT' value for 'Reason For Raising Appeal' field
	Then User validate 'Valid' value for 'Acceptance Decision' field
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears

	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
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
	Then User validate 'Resolved' status of 'Request'
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 0 days before date for 'Date Received' field value
	And User entered 50 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Appeal_Request' in 'featureContext'
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 5 days after date for 'Hearing Date' field value
	#And User enter 'Time of Hearing Date' as '15' mins after current time
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Prepare and Send Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'VOA Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Check For Appellant Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User entered 0 days before date for 'Appellant Case Pack Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicks on 'Appellant Case Pack Received?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Send Combined Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'Combined Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	#And User scroll to 'Related Tasks' element
	#And user clicked on 'Confirm Interested Party Court Attendance' link
	#And User click on 'Close Task' button from 'menubar'
	#And user clicked on the 'Close Task' button element
	#And User clicks on 'Go back' button
	And User clicks on 'VOA Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User clicks on 'IP Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Decisions' element
	And User looked for value 'VT Determination' in 'VT/HC Decision' field
	And User entered 0 days before date for 'Decision Date' field value
	And User entered 0 days before date for 'Decision Notice Received Date' field value
	And User click on 'Save' button from 'menubar'
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Multi Unit Accommodation' element
	And User clicks on 'Alteration Of More Than One Hereditament?' dropdown and select 'Yes' value
	And User looked for value 'Reconstitution' in 'Multi Hereditament Alteration Type' field
	And User looked for value 'Merger' in 'Multi Hereditament Alteration Sub Type' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Reconstitution' tab from 'Desktop Research Form'
	And User clicks on 'Add Outgoing' button element
	And user waits till app progress indicator disappears
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button field
	#And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'dialog'
	And User connects to the DB and retrieves the data for 'findHereditament_Wales'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User click on 'Reconstitution' tab from 'Desktop Research Form'
	And User clicks on 'Add Outgoing' button element
	And user waits till app progress indicator disappears
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'dialog'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User clicks on 'Add Outgoing' button element
	And user waits till app progress indicator disappears
	And User clicked on 2 position 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'dialog'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User filled 1 'Add Incoming' details for 'Postcode'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	#And User click on 'Related Jobs' tab from 'Request Form'
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	Then user asserts related jobs row count '3' by "Refresh" grid
	And User waits till all 3 jobs has name displayed by "Refresh" grid
	And User captured all 3 recons "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And user waits for '240' secs
	Given User click on 'Jobs' under 'Service' section
	#And User click on 'Refresh' button from 'menubar'
	And User 'Assign' 'ReconNew_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Given User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	##And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	##And User looked for 'Group' field value
	And User looked for 'Group' field value by clicking on search icon
	And User looked for 'Type' field value by clicking on search icon
	#And User looked for 'Type' field value
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
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	And User closes business process stage container
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
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconDel_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Given User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Linked Assessment' element
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	#And User click on 'Save' button from 'menubar'
	#And User scroll to 'Remarks' element
	#And User enter data for 'Formal Decision Notes' text area field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User clicks on 'OK' button on 'Confirming Reconstitution Type' dialog
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'No' button on 'All Jobs Created for Request' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'VT Decision' in 'Settlement Decision' field
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User entered 0 days before date for 'VT Settlement Confirmation Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'ReconDel_1' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
    And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Given User clicked on 'Next Stage' for 'Details' journey on the headerbar
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
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'Proposed Assessments' button
	Then user asserts 'Proposed Assessments' row count '0'
	And User switchs to deafult frame
	#And user waits for '15' secs
	Given User click on 'Jobs' under 'Service' section
	And User filters recon job 'ReconNew_0' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'Proposed Assessments' button
	Then user asserts 'Proposed Assessments' row count '0'
	And User switchs to deafult frame
	Given User click on 'Jobs' under 'Service' section
	And User filters recon job 'ReconDel_0' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'Proposed Assessments' button
	Then user asserts 'Proposed Assessments' row count '0'
	And User switchs to deafult frame
	And User closes browser


@QAQC
Scenario: Appeal06_CTPRELMGMT-1487_[SIT] [WAR-266][WAR-731]  Validate job is flagged for QA when DOLU identifier is updated in CMS
	Given User uses test data with ID 'Proposals_001' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Appeal_WithDrawn" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		#findHereditament_CAMBRIDGE'
		| fieldName |
		| uprn      |
    #Customer enquiry
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 60 days before date for 'Date Received in VOA' field value
	And User entered 45 days after date for 'Evidence Sufficient Date' field value
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
	
	#Proposal
	And User clicked on supplementary job id
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And user waits till app progress indicator disappears
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And user waits till app progress indicator disappears
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
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
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User modifies value 'Invalid' in 'Validity/Acceptance Decision' field
	And User looked for value 'Address and or date of VT/HC decision not supplied' in 'Validity/Acceptance Decision Reason' field by clicking on search icon
	And User click on 'Save' button from 'menubar'
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
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	Then User validate 'Resolved' status of 'Request'
	    
	#Appeal
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	And User entered 59 days before date for 'Date Received' field value
	And User entered 50 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 56 days after date for 'Hearing Date' field value
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Prepare and Send Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'VOA Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Check For Appellant Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User entered 0 days before date for 'Appellant Case Pack Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicks on 'Appellant Case Pack Received?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Send Combined Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'Combined Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Confirm Interested Party Court Attendance' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'VOA Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User clicks on 'IP Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Decisions' element
	And User looked for value 'VT Determination' in 'VT/HC Decision' field
	And User entered 0 days before date for 'Decision Date' field value
	And User entered 0 days before date for 'Decision Notice Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'

    #Proposal Or Appeal Alteration
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
	And User waits till record gets 'Saved'
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
	And User looked for value 'Make A Change' in 'Settlement Decision' field
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

	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Agreed' in 'Settlement Decision' field
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display

#@Regression @appeals @appeals_Wales
Scenario: Appeal07_CTPRELMGMT-1440_E2E_[SIT]_CTPRELMGMT-1421 - [WAR-299] - Wales - Welsh Appeal should backdate six years
	Given User uses test data with ID 'Proposals_019' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Proposals_Welsh_Appeal_AD02" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCWales_New_2005'
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
	And User entered 20 days before date for 'Proposed Effective Date' field value
	#And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value

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
	And user waits till app progress indicator disappears
	#And User looked for 'Job Type To Support Basis' field value
	And User looked for 'Job Type To Support Basis' field value by clicking on search icon
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User entered 0 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'No' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	And user waits till app progress indicator disappears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Address and or date of VT/HC decision not supplied' in 'Validity/Acceptance Decision Reason' field
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	#And user validated 'Is there enough evidence to raise an Informal Challenge? If so, raise a new Request. If this is required use the Supplementary Job Requisition to raise the Request.' text
	And User clicks on 'OK' button element
	Then User validate 'Invalid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	Then User validated under 'Outbound Correspondence' 'Invalid Proposal Wales VO7735b' template generated
	And User click on 'Refresh' button from 'menubar'
	And User clicks on 'Resolve Request' under 'Request Action'
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	Then User validate 'Resolved' status of 'Request'
	
	And User uses test data with ID 'Appeals_001' from 'Appeals' sheet
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 10 days before date for 'Proposed Effective Date' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User looked for first element 'Preceding Request' field value only when data not entered
	#And User entered 0 days before date for 'Date Received' field value
	#And User entered 10 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User clicked on 'Property Link' tab under 'Request Form' for proposal
	Then User asserts Property Link table
		| Main_Party        | Effective_To |
		| Council Tax Payer |              |
		| Customer          |              |

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
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User entered 30 days after date for 'Hearing Date' field value
	And User enter random number for 'VT Reference Number' field value
	And User enter random number for 'Agenda Number' field value
	And User clicks on 'Preferred Method of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validate value 'Hearing Date Received' for 'Status Reason' field
	And User click on 'Refresh' button from 'menubar'
	
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Prepare and Send Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'VOA Case Pack Sent?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Check For Appellant Case Pack' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
	And User entered 0 days before date for 'Appellant Case Pack Received Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicks on 'Appellant Case Pack Received?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Send Evidence (incl. Rebuttal) to VT' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	#And User scroll to 'Task Completion' element
	And User clicks on 'Send Evidence' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Related Tasks' element
	And user clicked on 'Confirm Interested Party Court Attendance' link
	And User click on 'Close Task' button from 'menubar'
	And user clicked on the 'Close Task' button element
	And User clicks on 'Go back' button
	And User clicks on 'VOA Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User clicks on 'IP Court Attendance Confirmed?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar'
	
	And User clicked on 'VT Action' tab under 'Desktop Research Form'
	And User scroll to 'Decisions' element
	And User looked for value 'VT Determination' in 'VT/HC Decision' field
	And User entered 0 days before date for 'Decision Date' field value
	And User entered 0 days before date for 'Decision Notice Received Date' field value
	And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears

	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	#And User looked for value 'VT Decision' in 'Settlement Decision' field
	And User entered 0 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User entered 0 days before date for 'VT Settlement Confirmation Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'

#Proposal Or Appeal Alteration
	And User looked for 'Job Type' field value from 'TestDataPart9' for 'Appeal_001'
	#And User entered 0 days before date for 'Proposed Effective Date' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Appeal' request with 'Request Name' and navigate to it
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
	Given User uses test data with ID 'Appeal_001' from 'TestDataPart9' sheet
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
	And User waits till record gets 'Saved'
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
	And User double click on 'Appeal' job under Associated jobs
	And user waits till app progress indicator disappears
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
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details for Welsh Hereditament
		| Effective_From            | Effective_To              | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| effective_To_WalesIC_date |                           | Proposed Tax Band | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date       | effective_To_WalesIC_date | Current Tax Band  | No            | Previously Current   | Published         | New              |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser


