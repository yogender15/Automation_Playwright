@UI
Feature: NoAction


@InformalChallenge @Regression @P1_A @mini_Regression @NoAction
#CTPRELMGMT-344 - SIT-Informal Challenge - No Action a Informal Challenge Job with CN04 present band sufficient
Scenario:NA01. CTPRELMGMT-344_CTPRELMGMT-1684_CTPRELMGMT-344CRM Enquiries-Informal Challenge - Via CRM Enquiries  And No Action-Informal Challenge - No Action the band change of an English Hereditament - BST-93871
	Given User uses test data with ID 'IFC_006' from 'InformalChallenge' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	Given User is logged in to Dynamics application to work for "Informal Challenge - Via CRM Enquiries" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 0 days before date for 'Evidence Sufficient Date' field value
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
	#And User entered 0 days before hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
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
	And User looked for 'Data Source Role' field value only when data not entered
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User clicks on 'Channel' dropdown and select 'Phone' value
	And User enter data for 'Reason For Validation' field value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	#And User looked for testdata 'CTPlayer' value for 'Tax Payer Request Property Link' field
	#And User looked for testdata 'Submitted By' value for 'Interested Party Request Property Link' field
	And User clicks on 'New Evidence Provided?' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'A' in 'Proposed Band' field
	And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Comparator Properties' tab under 'Validity/Acceptance Check Form'
	#And User Validates New Validity/Acceptance Check by clicking on 'Check CT Challenge' from 'Request Action' menu for 'Informal Challenge' BP
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
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
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
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value 'CT - Informal Challenge No Action' in 'Template Group' field
	And user waits till app progress indicator disappears
	And User looked for value 'Informal Challenge - CR15 Representative No Action (first)' in 'Template Configuration' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Generate Correspondence' button from 'dialog'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'OK' button element
	And User closed 'No Action Detail' dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Committed |
		| Superseded |
    And User closes browser

@materialReduction @Regression @SIT @P2 @NoAction
Scenario:NA02. CTPRELMGMT-1729_CR07-TC15-BST-59413-Verify the associated CR10's can be No actioned when Material Reduction Job is No actioned
	Given User uses test data with ID 'MI_002' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_BlackPool'
		| fieldName |
		| uprn      |
	Given User is logged in to Dynamics application to work for "BST-80552_NoAction_AssociatedCR10" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	#And User enter data for 'Reason for Portal Reference Omission' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'Set On Hold Request Status?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'On Hold' status of 'Request'
	And User fetch 'CR10_Request' in 'featureContext'
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'MaterialRedcution' for 'MR_001'
	#MR_001
    #MI_002
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 15 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User validate 'Validating' status of 'Request'
	And User fetch 'MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	#And User validated "CR10" Notification "This Job has 1 or more related CR10 requests" message
	And User waits till 'Researching' stage selected
	Then User validate below business stages on business journey header
		| BusinessStages      |
		| Details             |
		| Researching         |
		| Undertake Banding   |
		| Maintain Assessment |
	And User scroll to 'Correspondence Address' element
	And User clicks on 'No Action Associated CR10s' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
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
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 0 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
    And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Have Associated Material Increase Requests?' toggle button
	#And User clicks on '2' postion 'Save' button from 'dialog'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User click on 'Requests' under 'Service' section
	And User opens 'CR10_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User click on 'Requests' under 'Service' section
	And User opens 'MR_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

@Deletion @P2 @Regression @NoAction
Scenario:NA03.CTPRELMGMT-1524_SIT- BST-137088-INC3263860-Verify that No actioning CT to NDR job will create Committed PAD and not Pending PAD
	Given User uses test data with ID 'TD_002' from 'Deletion' sheet
#FindHereditamentforDeletion_Wolverhampton - TD_006
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CTPRELMGMT-1524_CT2NDR_CN04_Noaction" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
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
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	#And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Borderline CT to NDR'
	#And User validates the Pop-ups for 'Borderline CT to NDR' on the Dekstop Reaserch stage
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action Validation' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates 'Validation Error' contains 'Please ensure the PADs are validated before No Action'
	And User clicks on '2' postion 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
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
	
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records not contains 'Proposed' Pad set
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Committed |
		| Superseded |
	And User closes browser

@Deletion @P1_B @Regression @NoAction
Scenario:NA04.CTPRELMGMT-368_SIT-Deletion- No Action with CN04 present band sufficient
	Given User uses test data with ID 'TD_004' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CTPRELMGMT-368_Deletion_CN04_Noaction" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
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
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	#And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Borderline CT to NDR'
	#And User validates the Pop-ups for 'Borderline CT to NDR' on the Dekstop Reaserch stage
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action Validation' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates 'Validation Error' contains 'Please ensure the PADs are validated before No Action'
	And User clicks on '2' postion 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
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
	
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records not contains 'Proposed' Pad set
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Committed |
		| Superseded |
	And User closes browser

@NewProperty @SIT @Inspection @P1_A @Regression @NoAction
Scenario:NA05. BST_69603_CTPRELMGMT-1641_CTPRELMGMT-376_Desktop reasearch raising inspection and field Validation And No Action
	Given User uses test data with ID 'NP_025' from 'NewProperty' sheet
	And User is logged in to Dynamics application to work for "NewProp_Inspection" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Billing Authority Link' element
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	#And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'Inspections' tab under 'Desktop Research Form'
	Then User validates the default values for below fields under 'CT Inspection' section
		| fieldName                                | fieldValue                       |
		| Photos                                   | Inspection                       |
		| Location Plan                            | Obtained/Validated by Researcher |
		| Floor Plan (including layout and access) | Obtained/Validated by Researcher |
		| Measurements                             | Obtained/Validated by Researcher |
		| Details of occupation                    | Obtained/Validated by Researcher |
		| Complete HMO checklist                   | Obtained/Validated by Researcher |
		| Complete boat/mooring checklist          | Obtained/Validated by Researcher |
		| Other- see remarks                       | Obtained/Validated by Researcher |
	And User click on 'Is an Inspection Required?' toggle button
	And User clicks on 'Reason for Inspection' dropdown and select 'Check the state of repair' value
	And User enter data for 'Reason For Inspection Comments' text area field value
	And User entered 5 days before date from calender for 'Internal Inspection SLA' field value on 'dialog'
	#And User clicks on 'Inspection Allocation' dropdown and select 'Assign Inspection to Inspector' value
	And User clicks on 'Inspection Allocation' dropdown and select 'No Assignment Required' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates Inspections 'Job ID' with parent job id from 'featureContext'
	And User clicks on Inspections 'Job ID' element
	And User click on 'Refresh' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Inspection On Site' tab from 'Inspection Task Form'
	And The inspector makes changes to the below default values under 'CT Inspections'
		| fieldName | fieldValue                       |
		| Photos    | Obtained/Validated by Researcher |
	Then User validates and clicks the 'General' tab present in the 'Inspection Task Form' tablist
	And User clicks on 'Inspection Type' dropdown and select 'Full' value
	And User click on 'Inspection On Site' tab from 'Inspection Task Form'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Mark Complete' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates the default values for below fields under 'CT Inspection' section
		| fieldName | fieldValue                       |
		| Photos    | Obtained/Validated by Researcher |
	And User click on 'Ask for Help' button from 'menubar'
	And User enter 'Automation testing' in 'Subject' field
	And User enter 'Automation testing' in 'Description' field in 2 position
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Mark Complete' button from 'dialog'
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'Details' tab under 'Job Form'

	And User navigates to 'Activities' under 'My Work'
	And User filters the View Selector to 'Closed Activities'
	And User filters the 'Subject' column with the 'SubjectText' created
	Then User validates the Activity Status column value as 'Completed' for latest 'Actual End'
	And User closes browser

@Regression @EDC @SIT @P2 @NoAction
Scenario:NA06_CTPRELMGMT-387_CTPRELMGMT-519_SIT - Effective Date Change : Validate no action with (CN09) code without job and subcode is required to no action the request
	Given User uses test data with ID 'EDC_003' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Boston'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CTPRELMGMT-387_EDC_CN09_NoAction" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Non Standard Reason' in 'No Action Code' field
	And user waits till progress indicator disappears
	#SubActionCode
	And User looked for value 'Incorrect report code used.' in 'No Action Sub Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User clicks on 'Ok' button on 'No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

@CompositeDwelling @SIT @P1_A @Regression @NoAction
Scenario: NA07_CTPRELMGMT-1624_SIT_Validate CR06 - Composite Dwelling -Desktop Research Job - No Action 
	Given User uses test data with ID 'CPC_001' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "No Actionn CDP" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

@ChangeOfAddress @SIT @P2 @Regression @NoAction
Scenario:NA08_CTPRELMGMT-335_[SIT] CT Change of address- No Action VOA to VOA Change of Address Job with CN03 Duplicate report No action code
	Given User uses test data with ID 'COA_010' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the unique VOA change of address 'FindVOA_Hereditament'
		#findhereditamentForVOAAddress
		| fieldName           |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_name             |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "Manual Validation of Change of Address" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'Change of Address' element
	And User click on 'Find Address' button
	And User clicked on 2 position 'Search' button
	And user slects already used address for change of address manual process validation
	And User click on 'Use Proposed Address' as title for button
	Then User validate value 'Duplicate Validation Failed' for 'Status Reason' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till app progress indicator disappears
	#And User waits till ProgressRing disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Given User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Created in error' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Addresses' details under 'PVT' tab
		| Status    | AddressSource       |
		| Committed | VOA Created Address |
	And User closes browser

@Regression @DataEnhancement  @SIT @P2 @NoAction
Scenario:NA09_CTPRELMGMT-319_SIT-Data Enhancement - No Action a Data Enhancement Job with committed pads with CN08 Created in error No action code
	Given User uses test data with ID 'DE_001' from 'DataEnhancement' sheet
	And User connects to the DB and retrieves the data for 'findhereditament_DE'
		| fieldName |
		| uprn      |
	Given User is logged in to Dynamics application to work for "E2E_NewCommitted_DE" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
		And User get PAD attributes of 'Committed' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
		And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Details' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
    And User looked for value 'Created in error' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

@Regression @Proposals_Wales @P1_C @E2E @Proposals @NoAction
Scenario:NA10_CTPRELMGMT-1681_Welsh Reform Proposal - [SIT] - [WAR-25] - Wales - Proposal - User can resolve proposal if all supplementary jobs are resolved or No Actioned
	Given User uses test data with ID 'Proposals_017' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_BST_128831" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_Denbighshire'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 40 days before date for 'Date Received in VOA' field value
	#And User entered 20 days before date from calender for 'Date Received in VOA' field value on 'presentation'
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
	And User entered 20 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	#And User looked for value 'Not all information necessary for a valid proposal' in 'Reason for Validity/Acceptance Decision' field
	#And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
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
	#And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User looked for 'Job Type' field value from 'EDC' for 'EDC_003'
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
    
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'MR_001'
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present

	
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get all Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	#And user waits for '5' secs
	Then user asserts related jobs row count '3' by "Refresh" grid
	And user waits for '20' secs
	#And User captures all 3 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User capture all 3 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	#And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Material Reduction' 'Job Name' supplementory job type through 'All Jobs'	
	And User 'Assign' 'Material Reduction' 'Job Name' supplementory through 'All Jobs'
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
	And User looked for 'Proposed Tax Band' and reduced 0 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display

	And User click on 'Jobs' under 'Service' section
	#And User 'Assign' 'Proposal Or Appeal Alteration' 'Job_0' supplementory through 'All Jobs'
	And User 'Assign' 'Effective Date Change' 'Job Name' supplementory through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Effective Date Change'
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       |                  |
		| effective_from_date     |              |         | No            | Previously Current   | Unpublished       | Deletion         |
	And User switchs to deafult frame
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
	And User double click on 'Effective Date Change' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Material Reduction' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User closes browser


@Regression @Proposals_EN @P1_C @E2E @Proposals @mini_Regression @NoAction
Scenario:NA11_CTPRELMGMT-326_SIT- Proposal - Verify user can No Action Supplementary Job Deletion - Validate the No change in list- AD06 - Deletion
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "CTPRELMGMT-326_Proposals_DEL" case
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
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
    And  User clicks on 'Ok' button on 'No Action Validation' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates 'Validation Error' contains 'Please ensure the PADs are validated before No Action'
	And User clicks on '2' postion 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
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
	
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User clicks on 'No Action' under 'Job Actions'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'No Change' in 'Settlement Decision' field
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
	And User double click on 'Deletion' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

	
	@E2E @New_Estate @Regression @NoAction
	#CTPRELMGMT-1480-[SIT] - [BST-140545] - Convert to plot button using Reset function in New Estate
	#CTPRELMGMT-1447 -	[SIT] - [BST-140545] - Convert to plot button using Reset function in New Estate-Confirmation Message
	#CTPRELMGMT-1446 -	[SIT] - [BST-140545] - Convert to plot button using Reset function in New Estate-Form notification message
	#CTPRELMGMT-1523 [BST-138036] - Validate No Action Request if in status of 'Holding'
Scenario: NA12_[SIT] - [BST-139355] - INC3295697 - Verify a user can un-validate and then No Action a New Estate Request[SIT] - [BST-139355] - INC3295697 - Verify a user can un-validate and then No Action a New Estate Request
	Given User uses test data with ID 'Estate_DE_023' from 'Estate_TG' sheet
	Given User is logged in to Dynamics application to work for "BST-139355_No Action" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	And user waits till app progress indicator disappears
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
	And User enter data for 'Plot Starting Number' field value
	And User click on 'Submit' toggle button
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears

	And User click on 'House Types' tab from 'Estate File Form'
	And User clicks on 'New House Type' button element
	And User enter data for 2 position 'Name' field value
	And User looked for 2 position 'Group' field value
	And User looked for 'Type' field value
	And User looked for 'List' field value
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on newly created house type
	And User waits till 'Validate PAD' stage selected
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User looked for 'Parking' field value
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' A single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears

	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears

	
	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'scenarioContext'
	And user waits till app progress indicator disappears
	
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'

	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Parent_MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	#And User waits till ProgressRing disappears
	And user waits till progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'INCOMPLETE' after Plot has been Auto Processed
	And User select 'INCOMPLETE' plot
	And User click on 'resetPlot' button for an incomplete plot
	And User clicked on the 'Confirm' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	

	Given User uses test data with ID 'Estate_DE_022' from 'Estate_TG' sheet
	Given User click on 'Requests' under 'Service' section
	And User opens 'Parent_MR_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
	Then User verifies 'This Request has been reverted to Validating status as Plot was reset. Please verify and validate the Request.' Banner message
	And User modified value 'New Property - Individual' in 'Job Type' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Request Action'
    And User looked for value 'Created in error' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till progress indicator disappears
	And User clicks on 'OK' button on 'Submit No Action' dialog
	#And User closes dialog if still present
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display

	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Parent_MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Researching' status display
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User waits till 'Approve House Type' stage selected
	And User clicked on 'Approve House Type' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'INCOMPLETE' after Plot has been Auto Processed
	
	And User select 'INCOMPLETE' plot
	And User clicked 'Restart Processing' button contains name on 'Plot Manager' section
	
	Given User click on 'Jobs' under 'Service' section
	And User filters 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

	@QAQC @NoAction
Scenario:NA13_IFC05_CTPRELMGMT-1504_English Hereditament-Informal Challenge-Validate QA Review is generated for the current Informal challenge job which contains band change and also preceding request is selected with no actioned informal challenge
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
	And User enters data in "Town/City" field
	And User enters data in "Postcode" field
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
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value 'CT - Informal Challenge No Action' in 'Template Group' field
	And user waits till app progress indicator disappears
	And User looked for value 'Informal Challenge - CR15 Representative No Action (first)' in 'Template Configuration' field
	And User enter data for 'Internal Remarks' text area field value
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Generate Correspondence' button from 'dialog'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'OK' button element
	And User closed 'No Action Detail' dialog if still present
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
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
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
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
	